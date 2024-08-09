# outputs all files, removing their extension names. Excludes "_" preffixed files.
ls -1 $BASEDIR/z/install/ -I="_*.sh" | sed -e 's/\.sh$//'
