find "$PWD" -type f -print | parallel -j 10 "filebot.sh -script fn:amc --output "$HOME/files/Plex-Media" --action move --conflict auto -non-strict --log-file "$HOME/logs/amc.log" -get-subtitles --def unsorted=y clean=y deleteAfterExtract=y minFileSize=0 minLengthMS=0 --mode interactive --def seriesFormat="@$HOME/scripts/a.cartoons.txt" animeFormat="@$HOME/scripts/animeFormat.txt" {}"
