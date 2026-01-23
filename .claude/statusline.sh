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

# Parse fields directly from JSON (no transcript parsing needed)
MODEL=$(echo "$input" | jq -r '.model.display_name // "Claude"')
DIR_NAME=$(basename "$(echo "$input" | jq -r '.workspace.current_dir // "~"')")
ADDED=$(echo "$input" | jq -r '.cost.total_lines_added // 0')
REMOVED=$(echo "$input" | jq -r '.cost.total_lines_removed // 0')

# Use pre-calculated total cost
TOTAL_COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')

# Token counts from JSON
INPUT_TOKENS=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
OUTPUT_TOKENS=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
CTX_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')

# Calculate context percentage from total tokens used
TOTAL_TOKENS=$((INPUT_TOKENS + OUTPUT_TOKENS))
CTX_PERCENT=$((CTX_SIZE > 0 ? TOTAL_TOKENS * 100 / CTX_SIZE : 0))
CTX_PERCENT=$((CTX_PERCENT > 100 ? 100 : CTX_PERCENT < 0 ? 0 : CTX_PERCENT))

format_cost() {
  local cost=$1
  if [[ "$cost" == "0" || "$cost" == "null" || -z "$cost" ]]; then
    echo "\$0.00"
  else
    printf "\$%.2f" "$cost"
  fi
}

format_tokens() {
  local n=$1
  [[ "$n" == "null" || -z "$n" ]] && n=0
  if (( n >= 1000000 )); then
    printf "%.1fM" "$(echo "scale=1; $n / 1000000" | bc)"
  elif (( n >= 1000 )); then
    printf "%.1fK" "$(echo "scale=1; $n / 1000" | bc)"
  else
    printf "%d" "$n"
  fi
}

COST_FMT=$(format_cost "$TOTAL_COST")
INPUT_FMT=$(format_tokens "$INPUT_TOKENS")
OUTPUT_FMT=$(format_tokens "$OUTPUT_TOKENS")

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

FILLED_STR=""
EMPTY_STR=""
(( FILLED > 0 )) && FILLED_STR=$(printf '█%.0s' $(seq 1 $FILLED))
(( BAR_WIDTH - FILLED > 0 )) && EMPTY_STR=$(printf '░%.0s' $(seq 1 $((BAR_WIDTH - FILLED))))
BAR="${BAR_COLOR}${FILLED_STR}${MUTED}${EMPTY_STR}${NC}"

# Build output
SEP="${MUTED}  ${NC}"
LINE="${BOLD}${PURPLE}${MODEL_ICON} ${MODEL}${NC}"
LINE+="${SEP}${ACCENT}📁 ${DIR_NAME}${NC}"
[[ -n "$BRANCH" ]] && LINE+="${SEP}${SECONDARY}⎇ ${BRANCH}${NC}"
LINE+="${SEP}${SUCCESS}+${ADDED}${NC} ${ERROR}-${REMOVED}${NC}"
LINE+="${SEP}${MUTED}ctx${NC} ${BAR} ${MUTED}${CTX_PERCENT}%${NC}"
LINE+="${SEP}${SECONDARY}↑${NC}${INPUT_FMT}  ${PURPLE}↓${NC}${OUTPUT_FMT}  ${MUTED}${COST_FMT}${NC}"

echo -e "\033[2m${LINE}\033[0m"
