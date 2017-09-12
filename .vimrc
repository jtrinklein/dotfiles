set nocompatible
filetype off
syntax on
colorscheme molokai
let g:molokai_original = 1
set ts=4 sts=4 sw=4 expandtab
set autoindent
set wildmode=full
set wildmenu
set wildignore=*.resx,*.jpg,*.png,*.jpeg,*.gif,*.proj
set path=**
set suffixesadd=.cs,.aspx,.js,.rb
set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required

execute pathogen#infect()
filetype plugin indent on
map <C-o> :NERDTreeToggle<CR>
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
nnoremap mk :m .-2<CR>==
nnoremap mj :m .+1<CR>==
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map + <C-w>+
map - <C-w>-
map <kPlus> +
map <kMinus> -
map <PageUp> <C-w>_
map <PageDown> <C-w>=
map <C-u> <C-w><lt>
map <C-i> <C-w>>
map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>Op 0
