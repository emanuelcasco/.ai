#!/bin/bash

# Colors (Tokyo Night)
ACCENT='\033[38;5;73m'     # #7DCFFF cyan
SECONDARY='\033[38;5;111m' # #7AA2F7 blue
MUTED='\033[38;5;59m'      # #565F89 dark gray
SUCCESS='\033[38;5;114m'   # #9ECE6A green
ERROR='\033[38;5;204m'     # #F7768E red/pink
PURPLE='\033[38;5;141m'    # #BB9AF7 purple
BOLD='\033[1m'
NC='\033[0m'

input=$(cat)

# Parse fields
MODEL=$(echo "$input" | jq -r '.model.display_name // "Claude"')
DIR_NAME=$(basename "$(echo "$input" | jq -r '.workspace.current_dir // "~"')")
ADDED=$(echo "$input" | jq -r '.cost.total_lines_added // 0')
REMOVED=$(echo "$input" | jq -r '.cost.total_lines_removed // 0')

# Context usage
CTX_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')
TOTAL_USED=$(echo "$input" | jq -r '
  (.context_window.current_usage.input_tokens // 0) +
  (.context_window.current_usage.cache_creation_input_tokens // 0) +
  (.context_window.current_usage.cache_read_input_tokens // 0)')
CTX_PERCENT=$((CTX_SIZE > 0 ? TOTAL_USED * 100 / CTX_SIZE : 0))
CTX_PERCENT=$((CTX_PERCENT > 100 ? 100 : CTX_PERCENT < 0 ? 0 : CTX_PERCENT))

# Git branch
BRANCH=$(git branch --show-current 2>/dev/null)
[[ -n "$BRANCH" && -n $(git status --porcelain 2>/dev/null) ]] && BRANCH+="*"

# Model icon
case "$MODEL" in
  *Opus*)   MODEL_ICON="🎭" ;;
  *Sonnet*) MODEL_ICON="🎵" ;;
  *Haiku*)  MODEL_ICON="🎶" ;;
  *)        MODEL_ICON="🎼" ;;
esac

# Progress bar
BAR_WIDTH=8
FILLED=$((CTX_PERCENT * BAR_WIDTH / 100))
if [ "$CTX_PERCENT" -ge 80 ]; then BAR_COLOR="$ERROR"
elif [ "$CTX_PERCENT" -ge 50 ]; then BAR_COLOR="$ACCENT"
else BAR_COLOR="$SUCCESS"; fi

BAR="${BAR_COLOR}$(printf '█%.0s' $(seq 1 $FILLED 2>/dev/null))${MUTED}$(printf '░%.0s' $(seq 1 $((BAR_WIDTH - FILLED)) 2>/dev/null))${NC}"

# Build output
SEP="${MUTED}  ${NC}"
LINE="${BOLD}${PURPLE}${MODEL_ICON} ${MODEL}${NC}"
LINE+="${SEP}${ACCENT}📁 ${DIR_NAME}${NC}"
[[ -n "$BRANCH" ]] && LINE+="${SEP}${SECONDARY}⎇ ${BRANCH}${NC}"
LINE+="${SEP}${SUCCESS}+${ADDED}${NC} ${ERROR}-${REMOVED}${NC}"
LINE+="${SEP}${MUTED}ctx${NC} ${BAR} ${MUTED}${CTX_PERCENT}%${NC}"

echo -e "$LINE"