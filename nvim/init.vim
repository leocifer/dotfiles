set encoding=UTF-8
set relativenumber
set background=dark
set hidden

""""""""""""
" Plugins  "
""""""""""""
call plug#begin()
" General
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
    Plug 'itchyny/lightline.vim'
	Plug 'tpope/vim-surround'
	Plug 'vim-ctrlspace/vim-ctrlspace'
	Plug 'tpope/vim-fugitive'
	Plug 'preservim/nerdtree'
	Plug 'liuchengxu/vim-which-key'
" Syntax
    Plug 'ap/vim-css-color'
    Plug 'vim-syntastic/syntastic'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'leafgarland/typescript-vim'
    Plug 'ianks/vim-tsx'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Color-schemes
    Plug 'morhetz/gruvbox' "My favorite theme
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'ajh17/Spacegray.vim'
    Plug 'arcticicestudio/nord-vim'
call plug#end()

syntax on
filetype plugin indent on
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  

colorscheme nord

" Airline
" let g:airline_powerline_fonts = 1
" let g:airline_theme='violet'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#whitespace#enabled = 1
" let g:airline#extensions#syntastic#enabled = 1

""""""""""""
" Mappings "
""""""""""""
let mapleader=" "
" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" Split rewrite bindings
nnoremap Q <nop>

nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

" Move visually selected files up and down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Sytastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlSpace
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

" NerdTree with Git Status
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowIgnoredStatus = 1

" Highlighting large jsx and tsx files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Tool tip documentation 
nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" Vim Which Key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
