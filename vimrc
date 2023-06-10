syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Directives
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set term=screen-256color
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir  " Undotree directives
set undofile                " Undotree directives
set incsearch
set cursorline
set background=dark
set splitright
set statusline+=%#warningmsg#                   " Syntax Higlighting and Linting
"set statusline+=%{SyntasticStatuslineFlag()}    " Syntax Higlighting and Linting
set statusline+=%*                              " Syntax Higlighting and Linting
set autoread                                    " set autoindent
set backspace=indent,eol,start
set complete+=kspell
set completeopt=menuone,longest
set encoding=utf-8
set expandtab smarttab
set shortmess+=c
set hlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MyHighlights() abort
   ¦highlight Visual     cterm=NONE ctermbg=76  ctermfg=16  gui=NONE guibg=#5fd700 guifg=#000000
"    highlight StatusLine cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#d70000
"    highlight Normal     cterm=NONE ctermbg=17              gui=NONE guibg=#00005f
"    highlight NonText    cterm=NONE ctermbg=17              gui=NONE guibg=#00005f
endfunction

augroup MyColors
   autocmd!
   autocmd ColorScheme * call MyHighlights()
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All Group Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight HighlightedyankRegion ctermfg=black ctermbg=yellow
highlight Visual cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#5fd700 guifg=#000000


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode Map Directives
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map F3 to toggle set nu directive
nmap <F3> :set nu! <CR>
" Floaterm - Map F12 to toggle :terminal command
nmap <F12> :terminal <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode Remap Directives
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>h :wincmd h<CR>                                            " Switch to split window on right
nnoremap <leader>j :wincmd j<CR>                                            " Switch to split window on left
nnoremap <leader>k :wincmd k<CR>                                            " Switch to split window on down
nnoremap <leader>l :wincmd l<CR>                                            " Switch to split window on up
nnoremap <leader>u :UndotreeToggle<CR>                                      " Toggle for undotree window
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>        " Opens netrw window in a vertical split and resizes it to 30

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert Mode Remap Directives
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"     " Navigate the complete menu items like CTRL+n / CTRL+p would
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"        " Navigate the complete menu items like CTRL+n / CTRL+p would
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"  " Select the complete menu item like CTRL+y would
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"         " Select the complete menu item like CTRL+y would
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"    " Cancel the complete menu item like CTRL+e would

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocmd Directives
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertEnter * silent! set paste                         " Set paste on InsertEnter
autocmd InsertLeave * silent! set nopaste                       " Unset paste on InsertLeave
autocmd VimResized * wincmd =                                   " Auto-resize splits when Vim gets resized.
autocmd InsertEnter * set cursorline                            " Enable cursorline highlight when in Insert Mode
autocmd InsertLeave * set nocursorline                          " Disable cursorline when leaving Insert Mode
autocmd BufWritePre *.* silent! %s/\s\+$//                      " Removes trailing whitespace
"autocmd BufWritePre *.yml silent! %s/^\(\s*\)#\(\S\)/\1# \2/g
"autocmd BufWritePre *.yml silent! %s/^\(\s*\)-\(\S\)/\1- \2/g
autocmd BufNewFile,BufRead *.md set filetype=markdown           " ### File Type detection
autocmd BufReadPost *.yml setlocal expandtab tabstop=2 ai sw=2 sts=2 nu  " ### Yaml File Indentation
autocmd InsertEnter * highlight CursorLine guifg=white guibg=blue ctermfg=black ctermbg=blue     " Configure cursorline highlight color colorscheme
autocmd InsertEnter * highlight CursorLine guifg=white guibg=blue ctermfg=black ctermbg=blue     " Configure cursorline highlight color colorscheme
