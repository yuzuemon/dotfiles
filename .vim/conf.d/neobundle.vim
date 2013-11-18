" for NeoBundle ------------------------
set nocompatible
if has('vim_starting')
  if filereadable(expand('$HOME/dotfiles/.vim/neobundle/neobundle.vim/autoload/neobundle.vim'))
    set rtp+=$HOME/dotfiles/.vim/neobundle/neobundle.vim
  elseif filereadable(expand('$HOME/dotfiles/.vim/neobundle.vim/autoload/neobundle.vim'))
    set rtp+=$HOME/dotfiles/.vim/neobundle.vim
  endif

  call neobundle#rc(expand('$HOME/dotfiles/.vim/neobundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" from github
" NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc.vim', {'build': {'mac': 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'}}
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'h1mesuke/unite-outline'
NeoBundleLazy 'yuzuemon/jslint.vim', {"autoload": {"filetypes": 'javascript'}}
NeoBundleLazy 'mattn/emmet-vim', {"autoload": {"filetypes": 'html'}}
NeoBundle 'nakatakeshi/jump2pm.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'taku-o/vim-catn'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-surround'

" from vim-scripts repository
NeoBundle 'taglist.vim'
NeoBundle 'sudo.vim'
NeoBundleLazy 'TwitVim'

filetype plugin indent on
NeoBundleCheck
