unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
"set nocompatible              " be iMproved, required
"filetype off                  " required
"syntax enable
"filetype plugin on
"syntax on
set hlsearch
packadd nohlsearch
"set incsearch
"set backspace=2
"set mouse=a
"set t_Co=256
set autoindent
"set hidden
"set wildmenu
"set wrapscan
"set encoding=utf-8
"set complete+=k

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

"Plug 'wfxr/minimap.vim'
Plug 'Jimeno0/vim-chito'
Plug 'cocopon/iceberg.vim'
Plug 'arzg/vim-substrata'
Plug 'arcticicestudio/nord-vim' 
Plug 'rakr/vim-one'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'https://github.com/preservim/vim-pencil'
Plug 'https://github.com/chrisbra/recover.vim'
Plug 'justinmk/vim-sneak'
"Plug 'romainl/vim-cool'


call plug#end()

"set term=xterm-256color
set termguicolors

colorscheme hybrid
set background=light
set confirm
set relativenumber
set number
set shiftwidth=2
set tabstop=2
set scrolloff=5
set dictionary+=/usr/share/dict/cracklib-small 
set thesaurus+=/home/think/.vim/thesaurus/mthesaur.txt
set ignorecase
set smartcase
set foldmethod=manual
set tw=80
set fo=aw2tq  

if has('gui_running')
	python3 from powerline.vim import setup as powerline_setup
	python3 powerline_setup()
	python3 del powerline_setup

	"set guifont=Consolas\ for\ Powerline\ 13
	"set guifont=Consolas\ Regular\ 13
	set guifont=Terminus\ (TTF)\ Medium\ 16
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

endif

"au VimEnter * AirlineToggle

"Vim Wiki
let g:vimwiki_list = [{'path': '~/OneDrive/Documents/notes/', 'syntax': 'markdown', 'ext': '.md'}]

"let g:vimwiki_list = [
"	\ {'path': '~/OneDrive/Documents/notes/', 'syntax': 'markdown', 'ext': '.md'},
"  \ {'path': '~/OneDrive/Documents/notes/cover', 'syntax': 'markdown', 'ext': '.md'}
"  \ ]

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
nmap <C-l> <Plug>VimwikiGoToNextHeader
nmap <C-h> <Plug>VimwikiGoToPrevHeader
nmap <Leader>wn <Plug>VimwikiNextLink
let g:vimwiki_autowriteall = 0

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

"Toggle location list
function! ToggleLocationList()
    let l:window_count = winnr('$')
    lclose
    " If the number of windows didn't change, the location list wasn't open
    if winnr('$') == l:window_count
        try
            lopen
        catch /E776:/
            echo "Location list is empty"
        endtry
    endif
endfunction
nnoremap <silent> <leader>l :call ToggleLocationList()<CR>

" Save automatically on text changes or insert leave
" autocmd TextChanged,InsertLeave * silent! wall

" 1. Track the active status of Limelight
let g:limelight_keys_active = 0
function! ToggleLimelightWithKeys()
    " 2. Execute the actual plugin toggle
		execute 'Limelight!!'
		" 3. Swap the keybindings dynamically
    if g:limelight_keys_active == 0
        " Place mappings you want ONLY during Limelight here
				nnoremap } }j
				nnoremap { {{j
				set scrolloff=15
        let g:limelight_keys_active = 1
    else
        " Safely unmap those keys when Limelight is turned off
				nnoremap } }
				nnoremap { {
				set scrolloff=5
        let g:limelight_keys_active = 0
    endif
endfunction
nnoremap <leader>i :call ToggleLimelightWithKeys()<CR>

function! SafeVimwikiFix()
  silent! nunmap <buffer> <CR>
  silent! vunmap <buffer> <CR>
  nmap <buffer> <Leader>g <Plug>VimwikiFollowLink
endfunction
augroup VimwikiEnterFix
  autocmd!
  autocmd FileType vimwiki call SafeVimwikiFix()
augroup END

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>d :w !diff % -<CR>
nnoremap <silent> <Leader>o O<CR><UP>
nnoremap <silent> <Leader>[ o<Esc>
nnoremap <silent> <Leader>p "+1p
nnoremap ; :
nnoremap : ;
nnoremap <C-PageUp> :bnext<CR>
nnoremap <C-PageDown> :bprevious<CR>
nnoremap L :bnext<CR>
nnoremap H :bprevious<CR>
nnoremap <Up> <C-y><C-y>
nnoremap <Down> <C-e><C-e>
nnoremap <C-k> <C-y><C-y><C-y>
nnoremap <C-j> <C-e><C-e><C-e>
inoremap <C-d> <esc> 
inoremap kj <esc>
nnoremap <Leader>ff :VimwikiSearch 
nnoremap <silent> <Leader>f :Files <C-R>=expand('%:h')<CR><CR>
"nnoremap <silent> <Esc> :noh<CR><Esc>
nnoremap <Leader>8 a*p*[]<Esc>i
nnoremap <Leader>v GVgg
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]
let g:sneak#label = 1
nnoremap <Leader>n mayap}p`a
nnoremap <Leader>N mayapGo<Esc>p`a
nnoremap Y ,

command! -bang -nargs=? -complete=dir Buffers
  \ call fzf#vim#buffers({'options': ['--exact', '--tiebreak=index']}, <bang>0)

function! ZigZagInvertSelection() range
    let l:save_cursor = getpos('.')
    let l:start = a:firstline
    let l:end = a:lastline
    
    let l:sw = shiftwidth()
    let l:indent_char = &expandtab ? ' ' : '	'
    
    " Step 1: Snapshot original indents and find the true structural baseline
    let l:min_indent = -1
    let l:orig_indents = []
    
    let l:current_line = l:start
    while l:current_line <= l:end
        let l:line_text = getline(l:current_line)
        let l:ind = (l:line_text =~ '^\s*$') ? -1 : indent(l:current_line)
        call add(l:orig_indents, l:ind)
        if l:ind != -1 && (l:min_indent == -1 || l:ind < l:min_indent)
            let l:min_indent = l:ind
        endif
        let l:current_line += 1
    endwhile

    if l:min_indent == -1 | return | endif

    " Step 2: Safely determine global layout state (A or B) using the completed snapshot
    let l:is_state_b = 0
    for l:ind in l:orig_indents
        if l:ind == l:min_indent + l:sw | let l:is_state_b = 1 | break | endif
        if l:ind == l:min_indent | break | endif
    endfor

    " Step 3: Traverse and apply the mathematical toggle rules using the snapshot
    let l:active_parent_is_p1 = 1
    let l:idx = 0
    let l:current_line = l:start
    
    while l:current_line <= l:end
        let l:ind = l:orig_indents[l:idx]
        if l:ind != -1
            " Track active parent tree context safely using original unmutated values
            if l:ind == l:min_indent
                let l:active_parent_is_p1 = !l:is_state_b
            elseif l:ind == l:min_indent + l:sw
                let l:active_parent_is_p1 = l:is_state_b
            endif

            " Execute perfectly mirrored structural shifts
            if l:active_parent_is_p1
                let l:new_size = l:ind + (l:is_state_b ? -l:sw : l:sw)
            else
                let l:new_size = (l:ind <= l:min_indent + l:sw) ? (l:ind + (l:is_state_b ? l:sw : -l:sw)) : l:ind
            endif

            " Commit text change directly to the file buffer
            let l:clean_text = substitute(getline(l:current_line), '^\s*', '', '')
            let l:new_leading = repeat(l:indent_char, &expandtab ? l:new_size : (l:new_size / l:sw))
            call setline(l:current_line, l:new_leading . l:clean_text)
        endif
        let l:idx += 1
        let l:current_line += 1
    endwhile
    
    call setpos('.', l:save_cursor)
endfunction

xnoremap Z :call ZigZagInvertSelection()<CR>
