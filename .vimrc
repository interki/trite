set nocompatible              " be iMproved, required
filetype off                  " required

" vim=plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug '/usr/bin/fzf'
Plug 'vimwiki/vimwiki' 
Plug 'mcchrish/nnn.vim'
Plug 'scwood/vim-hybrid'
Plug 'joshdick/onedark.vim'

Plug 'wfxr/minimap.vim'
Plug 'Jimeno0/vim-chito'
Plug 'cocopon/iceberg.vim'
Plug 'arzg/vim-substrata'
Plug 'arcticicestudio/nord-vim' 
Plug 'rakr/vim-one'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'https://github.com/preservim/vim-pencil'
Plug 'https://github.com/chrisbra/recover.vim'


call plug#end()

set encoding=utf-8
set term=xterm-256color
set t_Co=256
set termguicolors

syntax enable
colorscheme hybrid
set background=light
set hidden
set confirm
set relativenumber
set number
set wildmenu
set wrapscan
set backspace=2
set mouse=a
set shiftwidth=2
set tabstop=2
set scrolloff=5
set incsearch
set autoindent
set dictionary+=/usr/share/dict/cracklib-small 
set thesaurus+=/home/think/.vim/thesaurus/mthesaur.txt
set complete+=k
set ignorecase
set smartcase

set tw=80
set fo=aw2tq  
"set formatoptions+=a
 
"au VimEnter * set laststatus=0
"
if has('gui_running')
	python3 from powerline.vim import setup as powerline_setup
	python3 powerline_setup()
	python3 del powerline_setup

	"set guifont=Consolas\ for\ Powerline\ 13
	"set guifont=Consolas\ Regular\ 13
	set guifont=Terminus\ (TTF)\ Medium\ 15
	"set guifont=Terminus\ Medium\ 15

	set background=dark
	colorscheme onedark
	set noerrorbells
	set visualbell 
	set t_vb=
	" set belloff=all
	set guioptions-=m 
	set guioptions-=T
	set guioptions-=L
	set guioptions+=d
	set guioptions-=e
	set guioptions+=c
	set wildmode
	set showcmd
	set ignorecase
	set smartcase
	set tw=140
	set wrap linebreak nolist
	set breakindent

	let g:goyo_width = 145
	let g:goyo_height = 100
	let g:goyo_linenr = 1

	au VimEnter * set laststatus=2
	set showcmd
	set showtabline=2

	"let g:airline_theme='monochrome'

	"let g:airline_powerline_fonts = 1
	"let g:airline#extensions#tabline#enabled = 1
	"let g:airline#extensions#tabline#show_buffers = 1
	"let g:Powerline_symbols = 'unicode'
	"let g:pymcd_powerline="py3"
	"let g:Powerline_symbols = 'fancy'

	"let g:airline#extensions#tabline#show_close_button = 0
	"let g:loaded_airline = 1
	"let g:airline_symbols.space = "\ua0"

endif

"au VimEnter * AirlineToggle

"Vim Wiki
filetype plugin on 
syntax on
let g:vimwiki_list = [{'path': '~/OneDrive/Documents/notes/', 'syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_list += [{'path': '~/Documents/d', 'syntax': 'vimwiki'}]

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
nmap <C-l> <Plug>VimwikiGoToNextHeader
nmap <C-h> <Plug>VimwikiGoToPrevHeader
nmap <Leader>wn <Plug>VimwikiNextLink

"Toggle spellchecking
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> <Leader>S :call ToggleSpellCheck()<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>D :w !diff % -<CR>
nnoremap ; :
nnoremap : ;
nnoremap <C-PageUp> :bnext<CR>
nnoremap <C-PageDown> :bprevious<CR>
