
INFILE=youre_all_fired.gif
OUTFILE=youre_all_fired.mp4

ffmpeg -i "$INFILE" -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/4)*2:trunc(ih/4)*2" "$OUTFILE"
