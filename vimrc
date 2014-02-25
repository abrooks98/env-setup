" Style "
set smartindent   " -- use smart indenting
set tabstop=2     " -- <TAB> two spaces
set shiftwidth=2  " -- makes shift width two spaces
set expandtab     " -- converts tabs to spaces
set showmatch     " -- shows matching parenthesis and brackets
set title         " -- shows filename in window
set scrolloff=10  " -- keep 10 lines on both sides of cursor when scrolling
set backspace=indent,eol,start  " -- let backspace delete anything
set nowrap        " -- don't wrap lines

" Searching
set incsearch     " -- see the first match before actually searching
set ignorecase    " -- perform case-insensitive searches
set smartcase     " -- perform case-sensitive serach if uppercase chars present
set hls           " -- highlights search terms

" Swap/Backup Files "
set nobackup    " -- turn off backup
set nowb        " -- 
set noswapfile  " -- turn off swap files

" Saving/Quitting "
map <c-x>     :q<CR>
map <c-w>     :w<CR>

" Tabs "
map <c-n>     :tabe 
map <c-Right> :tabn<CR>
map <c-Left>  :tabp<CR>

" Highlight Trailing Whitespace "
hi TrailingSpace ctermbg=1      
au filetype c,cpp,python match TrailingSpace "\s\+\n"
