set nocompatible
syntax on
colorscheme molokai
set ts=4 sts=4 sw=4 expandtab
set autoindent
set wildmode=full
set wildmenu
set wildignore=*.resx,*.jpg,*.png,*.jpeg,*.gif,*.proj
set path=**
set suffixesadd=.cs,.aspx,.js,.rb
set number
execute pathogen#infect()
filetype plugin indent on
map <C-o> :NERDTreeToggle<CR>

