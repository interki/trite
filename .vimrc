set nocompatible              " be iMproved, required
filetype off                  " required

" vim=plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Jimeno0/vim-chito'
Plug 'tomtom/tcomment_vim' 
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki' 
Plug 'mcchrish/nnn.vim'
Plug 'scwood/vim-hybrid'

Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
Plug 'arzg/vim-substrata'

call plug#end()

" set showtabline=2
set encoding=utf-8
" set termguicolors
" set term=xterm-256color
set t_Co=256
syntax enable
colorscheme hybrid
" let g:airline_theme='onedark'
let g:airline_theme='hybrid'
" let g:airline_theme='base16_atelierdune'
" let g:airline_theme='ayu_mirage'
" au VimEnter * AirlineToggle
set hidden
set relativenumber
set wildmenu
set wrapscan
set backspace=2
set mouse=a
set background=dark
au VimEnter * set laststatus=0
set shiftwidth=2
set tabstop=2
set so=5
set is

if has('gui_running')
	python3 from powerline.vim import setup as powerline_setup
	python3 powerline_setup()
	python3 del powerline_setup

	set guifont=Consolas\ for\ Powerline\ 13
        " set guifont=Consolas\ with\ Powerline\ 13
        " set guifont=Consolas\ 13
        " set guifont=Consolas\ Regular\ 13
        " set guifont=Literation\ Mono\ Nerd\ Font\ Complete\ Mono\ 13
        " set guifont=Inconsolata\ Regular\ 13
        " set guifont=Liberation\ Mono\ for\ Powerline\ Regular\ 13
	set background=dark
	colorscheme chito
	set noerrorbells
	set visualbell 
	set t_vb=
	" set belloff=all
	set guioptions-=m 
	set guioptions-=T
	set guioptions-=L
	set wildmode
	set relativenumber 
	set number
	set showcmd
	set ignorecase
	set smartcase
	set tw=140
	set wrap linebreak nolist
	set breakindent
	let g:goyo_width = 140
	let g:goyo_height = 100

	au VimEnter * set laststatus=2
	set showcmd
	set showtabline=2

	" let g:airline_theme='base16_spacemacs'
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#show_buffers = 1
	let g:airline#extensions#tabline#show_close_button = 0

        " let g:airline_symbols.space = "\ua0"
	let g:Powerline_symbols = 'unicode'
	let g:pymcd_powerline="py3"
	let g:Powerline_symbols = 'fancy'

	" let g:loaded_airline = 1

endif

au VimEnter * AirlineToggle

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Vim Wiki
filetype plugin on 
syntax on
let g:vimwiki_list = [{'path': '~/OneDrive/Documents/notes/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Toggle spellchecking
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> <Leader>S :call ToggleSpellCheck()<CR>
nnoremap <silent> <Leader>D :w !diff % -<CR>

nnoremap ; :
nnoremap : ;
nnoremap <leader>h :tabnew<CR>:help<CR><C-w><C-w>:quit<CR>

" nnoremap <C-n> :bnext<CR>
" nnoremap <C-p> :bprevious<CR>
nnoremap <C-PageUp> :bnext<CR>
nnoremap <C-PageDown> :bprevious<CR>

" nmap <s-l> <Plug>VimwikiGoToNextHeader
" nmap <s-h> <Plug>VimwikiGoToPrevHeader
nmap <C-l> <Plug>VimwikiGoToNextHeader
nmap <C-h> <Plug>VimwikiGoToPrevHeader
