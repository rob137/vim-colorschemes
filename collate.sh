bin bash stuff
eou pipefail whatever

mkdir ./colorschemes

" cp * from two directories to directory of this script:
$DIRS = [
	~/.vim/plugged/awesome-vim-colorschemes/colors/
	~/.vim/plugged/vim-colorschemes/colors/
]
cp $dir/* in $DIRS to ./colorschemes/

" cp my list of nice colorschemes:
cp ~/dotfiles/nice-vim-colorschemes.txt .

" Run down the list of files in ./colorschemes, asking 'is it in the list of
" nice colorschemes?'
$COLORSCHEMES = ./colorschemes/*
for $colorscheme in $COLORSCHEMES:
	IF (1+ lines in nice-vim-colorschemes.txt is a substring of your name') 
		rm $colorscheme
	ENDIF
ENDFOR

" Copy contents of ./colorschemes to somewhere vim looks for its colorschemes
cp ./colorschemes/* ~/.vim/colors


