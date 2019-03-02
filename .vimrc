set nocompatible              " be iMproved, required
filetype off                  " required

" vim=plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Jimeno0/vim-chito'
Plug 'tomtom/tcomment_vim' 
Plug 'junegunn/goyo.vim'
Plug 'dylanaraps/fff.vim' 
Plug 'vimwiki/vimwiki' 
Plug 'mcchrish/nnn.vim'

call plug#end()

set t_Co=256
syntax enable
let g:airline_theme='ayu_mirage'
" let g:airline_theme='base16_atelierdune'
" au VimEnter * AirlineToggle
set relativenumber
set backspace=2

if has('gui_running')
        set guifont=Consolas\ for\ Powerline\ 13
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

	" air-line
	let g:airline_powerline_fonts = 1
        if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
	endif
	let g:airline_theme='base16_spacemacs'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#show_buffers = 0
	let g:airline#extensions#tabline#show_close_button = 0
endif

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Vim Wiki
filetype plugin on 
syntax on
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" nnoremap <leader>n :NnnPicker '%:p:h'<CR>

nnoremap ; :
nnoremap <leader>h :tabnew<CR>:help<CR><C-w><C-w>:quit<CR>
