" ====== .vimrc ======
syntax on
let mapleader = ","


" ======================= Defaults ===========================
set encoding=utf8
set ffs=unix,dos,mac
set backspace=2
set tabstop=4 softtabstop=4
set shiftwidth=4
set number relativenumber
set splitright splitbelow

set ruler
set cursorline
set laststatus=2
set wildmenu
set completeopt-=preview
set signcolumn=no
set incsearch
set viminfo= 
set noshowmode
set noswapfile
set noerrorbells

nmap <Leader>w :w!<CR>      " quick save
nmap <Leader>q :bdelete<CR> " close current buffer

" Splits
map <Tab> <C-W>w            " change split pane
noremap <Leader>v :vnew<CR> " new vertical split
noremap <Leader>h :new<CR>  " new horizontal split

" extra options in GUI mode
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guifont=JetBrains\ Mono\ Regular:h14
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkoff0
    set guitablabel=%N:\ %f
endif


" =========================== Plugins & Configuration ===========================
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-surround'
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'pangloss/vim-javascript'
    Plug 'dylon/vim-antlr'
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"" morhetz/gruvbox
colorscheme gruvbox
set background=dark
hi Normal ctermfg=252 ctermbg=234 guibg=#1c1c1c guifg=#d0d0d0
hi! link SignColumn LineNr

"" itchyny/lightline.vim && mengelbrecht/lightline-bufferline
set showtabline=2

" let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

nmap <Leader>1 :call lightline#bufferline#go(1)<CR>
nmap <Leader>2 :call lightline#bufferline#go(2)<CR>
nmap <Leader>3 :call lightline#bufferline#go(3)<CR>
nmap <Leader>4 :call lightline#bufferline#go(4)<CR>
nmap <Leader>5 :call lightline#bufferline#go(5)<CR>
nmap <Leader>6 :call lightline#bufferline#go(6)<CR>
nmap <Leader>7 :call lightline#bufferline#go(7)<CR>
nmap <Leader>8 :call lightline#bufferline#go(8)<CR>
nmap <Leader>9 :call lightline#bufferline#go(9)<CR>

"" preservim/nerdtree
let g:NERDTreeWinPos = "right"
map <Leader>t :NERDTreeToggle<CR>

"" neoclide/coc.nvim

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
