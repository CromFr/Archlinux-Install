all: base ohmyzsh vim

yaourt:
	echo -e '[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/$$arch' >> /etc/pacman.conf
	pacman -S yaourt --needed

base:
	pacman -Syu --noconfirm
	pacman -S zsh git tree vim wget htop --noconfirm --needed

# Oh-My-ZSH
ohmyzsh: base
	chsh -s /bin/zsh
	git clone https://github.com/CromFr/crom-custom-oh-my-zsh.git ~/.oh-my-zsh
	cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Vim & monokai-vim
vim: base
	mkdir -p ~/.vim/colors/
	wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim -O ~/.vim/colors/monokai.vim
	echo -e "set nocompatible\n\nset pastetoggle=<F2>\nset number\nset nowrap\nset tabstop=4\nset backspace=indent,eol,start\nset autoindent\nset copyindent\nset shiftwidth=4\nset shiftround\nset showmatch\nset ignorecase\nset smartcase\nset smarttab\nset hlsearch\nset incsearch\n\nset mouse=a\nsyntax enable\ncolorscheme monokai" > ~/.vimrc
