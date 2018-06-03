# Exit unless app requirements are met and in PATH
declare -a reqlist=(rclone awk sed egrep grep echo printf find sort tee python3)
for app in $reqlist; do
  [[ ! $(which $app) ]] && echo -e "$app dependency not met/nPlease install $app" && exit 1
done

# If folder not found, then create.
[[ ! -d $logDir ]] || mkdir $logDir &>/dev/null

# If file not found, then copy it to destination
[[ ! -e ${jsonPath}/auto-rename-my-keys.sh ]] && cp /opt/plexguide/scripts/supertransfer/auto-rename-my-keys.sh $jsonPath

# Show user a structured block of text
cat_Help() {
  cat <<HELP
Usage: supertransfer [OPTION]

##############################
ATTN: Commands not ready yet!
##############################

-s, --status           bring up status menu (not ready)
-l, --logs             show program logs
-r, --restart          restart daemon
    --stop             stop daemon
    --start            start daemon

-c, --config           start configuration wizard
    --config-rclone    interactively configure gdrive service accounts
    --purge-rclone     remove all service accounts and reconfigure
    --set-email=EMAIL  config gdrive account impersonation
    --set-teamdrive=ID config teamdrive with ID (default: no)
    --set-path=PATH    config where files are stored on gdrive: (default: /)

    --pw=PASSWORD      unlocks secret multi-SA mode ;)
                       n00b deterrence:
                       password is reversed base64 of ZWxkcnVkCg==

-v  --validate         validates json account(s)
-V  --version          outputs version
-h, --help             what you're currently looking at

Please report any bugs to @flicker-rate#3637 on discord, or at plexguide.com
HELP
}

read -p "View Error Log? y/n>" answer
[[ $answer =~ [y|Y|yes|Yes] ]] && less /tmp/SA_error.log
