#!/usr/bin/env bash
# tmux pane label: show SSH host (ip/domain) if an ssh client is running in the pane;
# otherwise show local hostname.
#
# Usage from tmux:
#   #(~/bin/ssh_status.sh #{pane_pid})

set -euo pipefail

pane_pid="${1:-}"
if [[ -z "$pane_pid" ]]; then
  if command -v tmux >/dev/null 2>&1; then
    pane_pid="$(tmux display-message -p "#{pane_pid}")"
  fi
fi

get_children() {
  local pid="$1"
  local kids
  kids="$(pgrep -P "$pid" 2>/dev/null || true)"
  echo "$pid"
  for k in $kids; do
    get_children "$k"
  done
}

parse_ssh_dest() {
  local -a a
  # shellcheck disable=SC2206
  a=($1)

  [[ "${a[0]:-}" == "ssh" ]] && a=("${a[@]:1}")

  local dest=""
  local i=0
  while (( i < ${#a[@]} )); do
    local tok="${a[i]}"

    [[ "$tok" == "--" ]] && { ((i++)); break; }

    if [[ "$tok" == -* ]]; then
      case "$tok" in
        -p|-l|-i|-F|-o|-J|-L|-R|-D|-W|-b|-c|-m|-S|-E|-I|-B|-w) ((i+=2)); continue ;;
        *) ((i++)); continue ;;
      esac
    fi

    dest="$tok"
    break
  done

  if [[ -z "$dest" ]]; then
    while (( i < ${#a[@]} )); do
      [[ "${a[i]}" != -* ]] && { dest="${a[i]}"; break; }
      ((i++))
    done
  fi

  [[ "$dest" == *@* ]] && dest="${dest#*@}"
  dest="${dest#[}"
  dest="${dest%]}"

  echo "$dest"
}

local_hostname() {
  hostname -s 2>/dev/null || hostname 2>/dev/null || echo "local"
}

[[ -z "$pane_pid" ]] && { local_hostname; exit 0; }

all_pids="$(get_children "$pane_pid")"

ssh_pid=""
for pid in $all_pids; do
  comm="$(ps -p "$pid" -o comm= 2>/dev/null || true)"
  if [[ "$comm" == "ssh" ]]; then
    ssh_pid="$pid"
    break
  fi
done

if [[ -n "$ssh_pid" ]]; then
  args="$(ps -p "$ssh_pid" -o args= 2>/dev/null || true)"
  dest="$(parse_ssh_dest "$args")"
  [[ -n "$dest" ]] && echo "$dest" || echo "SSH"
else
  local_hostname
fi
