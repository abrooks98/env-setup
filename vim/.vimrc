if has("win64") || has("win32") || has ("win16")
  let &runtimepath.=',$HOME/.vim'
endif

execute pathogen#infect()
syntax enable
colorscheme desert

" Style "
set smartindent   " -- use smart indenting
set tabstop=2     " -- <TAB> two spaces
set shiftwidth=2  " -- makes shift width two spaces
set expandtab     " -- converts tabs to spaces
set showmatch     " -- shows matching parenthesis and brackets
set title         " -- shows filename in window
set cursorline    " -- show current line of cursor
set ruler         " -- show line/col number

" Sounds "
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Scrolling and Editting "
set scrolloff=10  " -- keep 10 lines on both sides of cursor when scrolling
set nowrap        " -- don't wrap lines
set backspace=indent,eol,start  " -- let backspace delete anything
set mouse=a

" Searching "
set incsearch     " -- see the first match before actually searching
set ignorecase    " -- perform case-insensitive searches
set smartcase     " -- perform case-sensitive search if uppercase chars present
set hls           " -- highlights search terms

" Highlight Trailing Whitespace "
hi TrailingSpace ctermbg=1
match TrailingSpace / \+$/

" Swap/Backup Files "
set nobackup    " -- turn off backup
set nowb        " -- turn off auto write-back
set noswapfile  " -- turn off swap files

" Tabs "
map <C-n> <Esc>:tabe 
map <C-l> <Esc>:tabn<CR>
map <C-h> <Esc>:tabp<CR>

" Clear Whitespace "
map <C-w> <Esc>:%s/\s\+$//e<CR>

" CTags "
set tags=./tags;/

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Paste-Overwriting "
vnoremap <leader>p "_dP

" Grep with colors
cnoremap grep !grep --color=always -n
