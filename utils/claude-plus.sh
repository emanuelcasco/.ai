#!/usr/bin/env bash

# claude-as - Run Claude with persona impersonation and context loading
#
# DESCRIPTION:
#   This script allows you to run Claude CLI with a specific persona context
#   and optionally load memory files from your .ai/data directories.
#   It provides a convenient way to maintain consistent AI assistant behavior
#   across different projects and use cases.
#
# USAGE:
#   claude-as [--persona|--as <name>] [--memory <true|false>] [prompt...]
#   claude-as <persona> [prompt...]  # Legacy format (backwards compatible)
#
# OPTIONS:
#   --persona, --as <name>  Specify the persona to use (optional)
#   --memory <true|false>   Enable/disable loading memory files (default: true)
#   -h, --help             Show this help message
#
# EXAMPLES:
#   claude-as --persona dev "Help me debug this code"
#   claude-as --as architect --memory false "Design a new system"
#   claude-as dev "What's wrong with my React component?"  # Legacy format
#   claude-as --memory true "Analyze this without persona"
#
# PERSONAS:
#   Persona files are stored in ~/.ai/personas/ as YAML files.
#   Each persona defines the AI's role, behavior, and capabilities.
#
# MEMORY FILES:
#   Memory files are automatically loaded from:
#   - Current project: $PWD/.ai/data/*
#   - Global context: ~/.ai/data/*
#   These provide additional context and preferences to the AI.
#
# TAB COMPLETION:
#   To enable tab completion for personas, add to your shell config:
#   Bash: source ~/.ai/utils/claude-as-completion.bash
#   Zsh:  source ~/.ai/utils/claude-as-completion.zsh
#
# AUTHOR: Emanuel Casco
# VERSION: 2.1.0

PERSONAS_DIR="$HOME/.ai/personas"

# Default values
persona=""
memory_enabled="true"
system_prompt=""

# Help function
show_help() {
  echo "claude-as - Run Claude with persona impersonation and context loading"
  echo
  /Users/emanuelcasco/.claude/local/claude --help
  echo
  echo "CLAUDE-AS ADDITIONAL OPTIONS:"
  echo "  --persona, --as <name>  Specify the persona to use (optional)"
  echo "  --memory <true|false>   Enable/disable loading memory files (default: true)"
  echo
  echo "CLAUDE-AS USAGE EXAMPLES:"
  echo "  claude-as --persona dev \"Help me debug this code\""
  echo "  claude-as --as architect --memory false \"Design a new system\""
  echo "  claude-as dev \"What's wrong with my React component?\"  # Legacy format"
  echo "  claude-as --memory true \"Analyze this without persona\""
  echo
  echo "PERSONAS:"
  echo "  Persona files are stored in ~/.ai/personas/ as YAML files."
  echo
  echo "MEMORY FILES:"
  echo "  Memory files are automatically loaded from:"
  echo "  - Current project: \$PWD/.ai/data/*"
  echo "  - Global context: ~/.ai/data/*"
}

#########################
# Parse arguments
#########################

# Parse arguments
args=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --persona|--as)
      if [[ -z "$2" ]]; then
        echo "Error: --persona/--as requires a persona name"
        exit 1
      fi
      persona="$2"
      shift 2
      ;;
    --memory)
      if [[ -z "$2" ]]; then
        echo "Error: --memory requires true or false"
        exit 1
      fi
      if [[ "$2" != "true" && "$2" != "false" ]]; then
        echo "Error: --memory must be 'true' or 'false'"
        exit 1
      fi
      memory_enabled="$2"
      shift 2
      ;;
    -h|--help)
      show_help
      exit 0
      ;;
    -*)
      # Pass through unknown flags to claude command
      args+=("$1")
      shift
      ;;
    *)
      # First non-option argument could be legacy persona format
      if [[ -z "$persona" && ${#args[@]} -eq 0 && ! "$1" =~ ^- ]]; then
        # Check if this looks like a persona (no spaces, reasonable length)
        if [[ "$1" =~ ^[a-zA-Z0-9_-]+$ && ${#1} -le 20 ]]; then
          # Check if persona file exists
          if [[ -f "$PERSONAS_DIR/$1.yml" ]]; then
            persona="$1"
            shift
            continue
          fi
        fi
      fi
      # Add to remaining arguments
      args+=("$1")
      shift
      ;;
  esac
done

#########################
# Load persona context
#########################

if [[ -n "$persona" ]]; then
  persona_file="$PERSONAS_DIR/$persona.yml"
  if [[ ! -f "$persona_file" ]]; then
    echo "Error: Persona '$persona' not found in $PERSONAS_DIR"
    exit 1
  fi
  
  # Load persona system prompt
  system_prompt=$(cat "$persona_file")
fi

#########################
# Load memory context
#########################

# Function to add data files to system prompt
add_data_files() {
  local data_dir="$1/.ai/data"
  
  if [[ -d "$data_dir" ]]; then
    for file in "$data_dir"/*; do
      # Skip if glob doesn't match any files
      [[ ! -e "$file" ]] && continue
      if [[ -f "$file" ]]; then
        if [[ -r "$file" ]]; then
          local filename=$(basename "$file")

          system_prompt+="\n\n## Data from: $file\n\n"
          system_prompt+="$(cat "$file")"
        fi
      fi
    done
  fi
}

if [[ "$memory_enabled" == "true" ]]; then
  system_prompt+="\n# === MEMORY CONTEXT START ===\n"
  system_prompt+="\n# Follow the instructions below they are very important \n"
  # Add data files from project root (if in a project)

  if [[ -n "$PWD" ]]; then
    add_data_files "$PWD"
  fi
  # Add data files from ~/.claude
  add_data_files "$HOME"
  system_prompt+="\n# === MEMORY CONTEXT END ===\n"
fi

#########################
# Run claude with persona prompt + all arguments
#########################
if [[ -n "$system_prompt" ]]; then
  /Users/emanuelcasco/.claude/local/claude --append-system-prompt "$system_prompt" "${args[@]}"
else
  /Users/emanuelcasco/.claude/local/claude "${args[@]}"
fi

