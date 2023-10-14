#!/bin/bash
set -e
set -x

sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y vim

# vim setup
sudo mkdir -p /opt/vim/
echo $whoami
sudo chown -R $UID:$UID /opt/vim
if ! [ -d /opt/vim/YouCompleteMe ]; then
  git clone --recurse-submodules https://github.com/ycm-core/YouCompleteMe.git /opt/vim/YouCompleteMe
  pushd /opt/vim/YouCompleteMe
  ./install.py --clangd-completer
  popd
fi
if ! [ -d /opt/vim/NERDCommenter ]; then
  git clone https://github.com/preservim/nerdcommenter.git /opt/vim/NERDCommenter
fi
if ! [ -d /opt/vim/securemodelines ]; then
  git clone https://github.com/ciaranm/securemodelines /opt/vim/securemodelines
fi

# vim setup
mkdir -p ~/.vim/pack/plugins/opt
if ! [ -d ~/.vim/pack/plugins/opt/YouCompleteMe ]; then
  ln -s /opt/vim/YouCompleteMe ~/.vim/pack/plugins/opt/YouCompleteMe
fi

if ! [ -d ~/.vim/pack/plugins/opt/NERDCommenter ]; then
  ln -s /opt/vim/NERDCommenter ~/.vim/pack/plugins/opt/NERDCommenter
fi

if ! [ -d ~/.vim/pack/plugins/opt/securemodelines ]; then
  ln -s /opt/vim/securemodelines ~/.vim/pack/plugins/opt/securemodelines
fi

cat << EOF > ~/.vimrc
packadd YouCompleteMe
packadd NERDCommenter
packadd securemodelines

filetype plugin indent on

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

hi YcmWarningSection ctermbg=52
EOF
