#!/bin/sh
set -euxo pipefail

TMPDIR="/tmp/colorschemes"

# Create dir if not already there
mkdir -p $TMPDIR

# cp my list of nice colorschemes:
cp ~/dotfiles/nice-vim-colors.txt .

# cp * from two directories to directory of this script:
declare -a dirs=(
  "/Users/univers/.vim/plugged/awesome-vim-colorschemes/colors/"
 "/Users/univers/.vim/plugged/vim-colorschemes/colors/"
)
for dir in "${dirs[@]}"
do
 cp $dir* $TMPDIR
done

# Make array of nice colors
nicecolors=""
IFS=$'\n'       # make newlines the only separator
for i in $(cat < /Users/univers/dotfiles/nice-vim-colors.txt); do
  nicecolors+="$i.vim "
done

# Run down the list of files in ./colorschemes, asking 'is it in the list of
# nice colorschemes?', deleting the ones that aren't
colorpaths=( /tmp/colorschemes/* )
for colorpath in "${colorpaths[@]}"; do
	colorfile=$(basename $colorpath)
	if ! [[ " ${nicecolors[@]} " =~ $colorfile ]]; then
		rm "$colorpath"
	fi
done

# Copy contents of ./colorschemes to somewhere vim looks for its colorschemes
cp $TMPDIR/* /Users/univers/.vim/colors

