#!/bin/bash
#
# sync-agents.sh - Sync AI agent configurations across tools
#
# Source of truth: ~/.claude/CLAUDE.md, ~/.claude/settings.json, ~/.claude/commands/
# Targets: Codex, Gemini, OpenCode
#
# Usage:
#   ./sync-agents.sh [--watch] [--dry-run] [--instructions-only] [--settings-only] [--commands-only] [--no-commands]
#
# Config paths (from official docs):
#   Claude:   ~/.claude/CLAUDE.md, ~/.claude/settings.json
#   Codex:    ~/.codex/AGENTS.md, ~/.codex/config.toml
#   Gemini:   ~/.gemini/GEMINI.md, ~/.gemini/settings.json
#   OpenCode: ~/.config/opencode/.opencode.json, ~/.config/opencode/commands/

set -euo pipefail

# ─────────────────────────────────────────────────────────────────────────────
# Configuration
# ─────────────────────────────────────────────────────────────────────────────

SOURCE_DIR="$HOME/.claude"
CODEX_DIR="$HOME/.codex"
GEMINI_DIR="$HOME/.gemini"
OPENCODE_DIR="$HOME/.config/opencode"

SOURCE_INSTRUCTIONS="$SOURCE_DIR/CLAUDE.md"
SOURCE_SETTINGS="$SOURCE_DIR/settings.json"
SOURCE_COMMANDS_DIR="$SOURCE_DIR/commands"

CODEX_PROMPTS_DIR="$CODEX_DIR/prompts"

DRY_RUN=false
WATCH_MODE=false
SYNC_INSTRUCTIONS=true
SYNC_SETTINGS=true
SYNC_COMMANDS=true

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ─────────────────────────────────────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────────────────────────────────────

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

ensure_dir() {
  if [[ ! -d "$1" ]]; then
    if [[ "$DRY_RUN" == "true" ]]; then
      log_info "[DRY-RUN] Would create directory: $1"
    else
      mkdir -p "$1"
      log_info "Created directory: $1"
    fi
  fi
}

backup_file() {
  local file="$1"
  if [[ -f "$file" ]]; then
    local backup="${file}.bak.$(date +%Y%m%d_%H%M%S)"
    if [[ "$DRY_RUN" == "true" ]]; then
      log_info "[DRY-RUN] Would backup: $file -> $backup"
    else
      cp "$file" "$backup"
      log_info "Backed up: $file"
    fi
  fi
}

# ─────────────────────────────────────────────────────────────────────────────
# Instructions Sync
# ─────────────────────────────────────────────────────────────────────────────

sync_instructions() {
  log_info "Syncing instructions from $SOURCE_INSTRUCTIONS..."

  if [[ ! -f "$SOURCE_INSTRUCTIONS" ]]; then
    log_error "Source file not found: $SOURCE_INSTRUCTIONS"
    return 1
  fi

  # Read source content
  local content
  content=$(cat "$SOURCE_INSTRUCTIONS")

  # ─── Codex (AGENTS.md) ───
  # Codex uses AGENTS.md directly, same markdown format
  local codex_target="$CODEX_DIR/AGENTS.md"
  ensure_dir "$CODEX_DIR"

  if [[ "$DRY_RUN" == "true" ]]; then
    log_info "[DRY-RUN] Would copy to: $codex_target"
  else
    echo "$content" > "$codex_target"
    log_success "Synced: $codex_target"
  fi

  # ─── Gemini (GEMINI.md) ───
  # Gemini uses GEMINI.md, same markdown format
  local gemini_target="$GEMINI_DIR/GEMINI.md"
  ensure_dir "$GEMINI_DIR"

  if [[ "$DRY_RUN" == "true" ]]; then
    log_info "[DRY-RUN] Would copy to: $gemini_target"
  else
    echo "$content" > "$gemini_target"
    log_success "Synced: $gemini_target"
  fi

  # ─── OpenCode (commands or .opencode directory) ───
  # OpenCode uses .opencode.json for config, but instructions go in commands/
  # or can be loaded via context settings
  local opencode_target="$OPENCODE_DIR/OPENCODE.md"
  ensure_dir "$OPENCODE_DIR"

  if [[ "$DRY_RUN" == "true" ]]; then
    log_info "[DRY-RUN] Would copy to: $opencode_target"
  else
    echo "$content" > "$opencode_target"
    log_success "Synced: $opencode_target"
  fi

  log_success "Instructions sync complete!"
}

# ─────────────────────────────────────────────────────────────────────────────
# Commands / Prompts Sync
# ─────────────────────────────────────────────────────────────────────────────

sync_commands() {
  log_info "Syncing commands from $SOURCE_COMMANDS_DIR..."

  if [[ ! -d "$SOURCE_COMMANDS_DIR" ]]; then
    log_error "Source commands directory not found: $SOURCE_COMMANDS_DIR"
    return 1
  fi

  local commands_root="$SOURCE_COMMANDS_DIR"
  if [[ -L "$SOURCE_COMMANDS_DIR" ]]; then
    commands_root="$(cd "$SOURCE_COMMANDS_DIR" && pwd -P)"
    log_info "Resolved commands directory: $commands_root"
  fi

  ensure_dir "$CODEX_PROMPTS_DIR"

  local has_files="false"
  while IFS= read -r -d '' file; do
    has_files="true"

    local rel_path
    rel_path="${file#"$commands_root"/}"

    local target_name
    target_name="${rel_path//\//-}"

    local codex_target="$CODEX_PROMPTS_DIR/$target_name"

    if [[ "$DRY_RUN" == "true" ]]; then
      log_info "[DRY-RUN] Would copy to: $codex_target"
    else
      backup_file "$codex_target"
      cp "$file" "$codex_target"
      log_success "Synced: $codex_target"
    fi
  done < <(find -L "$commands_root" -type f -name "*.md" -print0)

  if [[ "$has_files" == "false" ]]; then
    log_warn "No command markdown files found in $SOURCE_COMMANDS_DIR"
    return 0
  fi

  log_success "Commands sync complete!"
}

# ─────────────────────────────────────────────────────────────────────────────
# Settings Sync
# ─────────────────────────────────────────────────────────────────────────────

# Extract allowed commands from Claude settings and convert to other formats
sync_settings() {
  log_info "Syncing settings from $SOURCE_SETTINGS..."

  if [[ ! -f "$SOURCE_SETTINGS" ]]; then
    log_error "Source file not found: $SOURCE_SETTINGS"
    return 1
  fi

  # Check for jq
  if ! command -v jq &> /dev/null; then
    log_error "jq is required for settings sync. Install with: brew install jq"
    return 1
  fi

  sync_codex_settings
  sync_gemini_settings
  sync_opencode_settings

  log_success "Settings sync complete!"
}

sync_codex_settings() {
  # Codex uses a fundamentally different permission model:
  # - Project trust levels in config.toml (not command permissions)
  # - AGENTS.md for instructions (already synced)
  # So we skip settings sync for Codex - only instructions matter
  log_info "Codex: Skipping settings sync (uses different permission model)"
  log_info "Codex: Instructions synced via AGENTS.md"
}

sync_gemini_settings() {
  log_info "Syncing Gemini settings (settings.json)..."

  local gemini_config="$GEMINI_DIR/settings.json"
  ensure_dir "$GEMINI_DIR"

  # Extract allowed bash commands and convert to Gemini format
  # Claude: Bash(git add:*) -> Gemini: run_shell_command(git add)
  local allowed_cmds
  allowed_cmds=$(jq -r '
    .permissions.allow[]?
    | select(startswith("Bash("))
    | gsub("Bash\\("; "")
    | gsub(":.*\\)"; ")")
    | gsub("\\)$"; "")
    | "run_shell_command(\(.))"
  ' "$SOURCE_SETTINGS" 2>/dev/null | sort -u || echo "")

  # Read existing Gemini settings
  local existing_settings="{}"
  if [[ -f "$gemini_config" ]]; then
    existing_settings=$(cat "$gemini_config")
  fi

  # Build allowed tools array
  local tools_array="[]"
  if [[ -n "$allowed_cmds" ]]; then
    tools_array=$(echo "$allowed_cmds" | jq -R -s 'split("\n") | map(select(length > 0))')
  fi

  if [[ "$DRY_RUN" == "true" ]]; then
    log_info "[DRY-RUN] Would update Gemini settings.json"
    log_info "[DRY-RUN] Tools: $tools_array"
  else
    backup_file "$gemini_config"

    # Merge new tools with existing settings, preserving other config
    local new_settings
    new_settings=$(echo "$existing_settings" | jq --argjson tools "$tools_array" '
      .tools.allowed = $tools |
      .tools.enabled = true |
      .tools.enableHooks = true |
      ._syncedFrom = "claude" |
      ._syncedAt = (now | todate)
    ')

    echo "$new_settings" > "$gemini_config"
    log_success "Synced: $gemini_config"
  fi
}

sync_opencode_settings() {
  log_info "Syncing OpenCode settings (.opencode.json)..."

  local opencode_config="$OPENCODE_DIR/.opencode.json"
  ensure_dir "$OPENCODE_DIR"

  # Read existing OpenCode settings
  local existing_settings="{}"
  if [[ -f "$opencode_config" ]]; then
    existing_settings=$(cat "$opencode_config")
  fi

  # Extract allowed commands - OpenCode format is similar to Claude
  local allowed_cmds
  allowed_cmds=$(jq '.permissions.allow // []' "$SOURCE_SETTINGS" 2>/dev/null || echo "[]")

  if [[ "$DRY_RUN" == "true" ]]; then
    log_info "[DRY-RUN] Would update OpenCode .opencode.json"
  else
    backup_file "$opencode_config"

    # OpenCode uses a different structure - adapt as needed
    local new_settings
    new_settings=$(echo "$existing_settings" | jq --argjson perms "$allowed_cmds" '
      .permissions = ($perms | map(
        if startswith("Bash(") then
          gsub("Bash\\("; "shell:") | gsub(":.*\\)"; "")
        else
          .
        end
      )) |
      ._syncedFrom = "claude" |
      ._syncedAt = (now | todate)
    ')

    echo "$new_settings" > "$opencode_config"
    log_success "Synced: $opencode_config"
  fi
}

# ─────────────────────────────────────────────────────────────────────────────
# Watch Mode
# ─────────────────────────────────────────────────────────────────────────────

watch_and_sync() {
  log_info "Starting watch mode on $SOURCE_DIR..."
  log_info "Press Ctrl+C to stop"

  # Check for fswatch
  if ! command -v fswatch &> /dev/null; then
    log_error "fswatch is required for watch mode. Install with: brew install fswatch"
    return 1
  fi

  fswatch -o "$SOURCE_INSTRUCTIONS" "$SOURCE_SETTINGS" "$SOURCE_COMMANDS_DIR" | while read -r _; do
    log_info "Change detected, syncing..."
    [[ "$SYNC_INSTRUCTIONS" == "true" ]] && sync_instructions
    [[ "$SYNC_SETTINGS" == "true" ]] && sync_settings
    [[ "$SYNC_COMMANDS" == "true" ]] && sync_commands
    log_info "Waiting for changes..."
  done
}

# ─────────────────────────────────────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────────────────────────────────────

show_help() {
  cat << EOF
sync-agents.sh - Sync AI agent configurations across tools

USAGE:
  ./sync-agents.sh [OPTIONS]

OPTIONS:
  --watch              Watch for changes and auto-sync
  --dry-run            Show what would be done without making changes
  --instructions-only  Only sync instruction files (CLAUDE.md)
  --settings-only      Only sync settings files
  --commands-only      Only sync command/prompt files
  --no-commands        Skip syncing command/prompt files
  -h, --help           Show this help message

SYNCED PATHS:
  Source (Claude):
    Instructions: ~/.claude/CLAUDE.md
    Settings:     ~/.claude/settings.json
    Commands:     ~/.claude/commands/*.md

  Targets:
    Codex:    ~/.codex/AGENTS.md, ~/.codex/config.toml
    Codex:    ~/.codex/prompts/*.md (flattened, nested paths become dash-separated)
    Gemini:   ~/.gemini/GEMINI.md, ~/.gemini/settings.json
    OpenCode: ~/.config/opencode/OPENCODE.md, ~/.config/opencode/.opencode.json

EXAMPLES:
  # Sync everything once
  ./sync-agents.sh

  # Preview changes without applying
  ./sync-agents.sh --dry-run

  # Only sync instructions
  ./sync-agents.sh --instructions-only

  # Watch for changes and auto-sync
  ./sync-agents.sh --watch

EOF
}

main() {
  # Parse arguments
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --watch)
        WATCH_MODE=true
        shift
        ;;
      --dry-run)
        DRY_RUN=true
        shift
        ;;
      --instructions-only)
        SYNC_SETTINGS=false
        SYNC_COMMANDS=false
        shift
        ;;
      --settings-only)
        SYNC_INSTRUCTIONS=false
        SYNC_COMMANDS=false
        shift
        ;;
      --commands-only)
        SYNC_INSTRUCTIONS=false
        SYNC_SETTINGS=false
        shift
        ;;
      --no-commands)
        SYNC_COMMANDS=false
        shift
        ;;
      -h|--help)
        show_help
        exit 0
        ;;
      *)
        log_error "Unknown option: $1"
        show_help
        exit 1
        ;;
    esac
  done

  echo ""
  echo "╔═══════════════════════════════════════════════════════════════╗"
  echo "║           AI Agent Config Sync                                ║"
  echo "║           Source: Claude -> Codex, Gemini, OpenCode           ║"
  echo "╚═══════════════════════════════════════════════════════════════╝"
  echo ""

  if [[ "$DRY_RUN" == "true" ]]; then
    log_warn "Running in DRY-RUN mode - no changes will be made"
    echo ""
  fi

  if [[ "$WATCH_MODE" == "true" ]]; then
    # Initial sync then watch
    [[ "$SYNC_INSTRUCTIONS" == "true" ]] && sync_instructions
    [[ "$SYNC_SETTINGS" == "true" ]] && sync_settings
    [[ "$SYNC_COMMANDS" == "true" ]] && sync_commands
    echo ""
    watch_and_sync
  else
    [[ "$SYNC_INSTRUCTIONS" == "true" ]] && sync_instructions
    echo ""
    [[ "$SYNC_SETTINGS" == "true" ]] && sync_settings
    echo ""
    [[ "$SYNC_COMMANDS" == "true" ]] && sync_commands
  fi

  echo ""
  log_success "All done!"
}

main "$@"
