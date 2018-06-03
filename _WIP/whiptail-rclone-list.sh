#!/usr/bin/env bash

REMOTES="$HOME/scripts/DEV/remotes.omg"
#WHIPTAILREMOTES=wremotes.omg
#NUM=num.txt
COUNT=$(wc -l <"$REMOTES")

function _GETREMOTES() {
  rclone listremotes |
    grep WWW |
    nl -w1 -s' ' |
    sed --expression='s/[^ ]\+/"&"/g' |
    sed --expression='s/$/ OFF /' |
    sed '$s/..$//' | tee "$REMOTES"
}

#function _remoteARRAY() {
#
#  ((i = 0))
#  while ((${#array[@]} > i)); do
#    printf "${array[i++]}"
#  done
#}

# Load text file lines into a bash array.
function _reader() {
  while IFS= read -r line; do
    echo "$line"
  done <"$REMOTES"
}

#seq 10022 +1 10033 >>"$PORTS"
#$COUNT >$NUM
#parallel -k -x echo "'\"'{1}'\"' '\"'{2}'\"'" >hydra.txt :::: $NUM $REMOTES
#_GETREMOTES
#declare -a array
#readarray array <$REMOTES

whiptail --scrolltext --title "xx" --checklist 'pick your accounts' 20 78 "$COUNT" "$(_reader)"
