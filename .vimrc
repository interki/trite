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
set hidden
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

Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug '/usr/bin/fzf'
Plug 'vimwiki/vimwiki' 
Plug 'mcchrish/nnn.vim'
Plug 'scwood/vim-hybrid'
"Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
"Plug 'https://github.com/preservim/vim-pencil'
Plug 'https://github.com/chrisbra/recover.vim'
Plug 'justinmk/vim-sneak'
"Plug 'romainl/vim-cool'

call plug#end()

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
set tw=80
set fo=aw2tq  

if has('gui_running')
	set guifont=Liberation\ Mono\ 12
	set guifont=Cousine\ 12
	highlight Normal guibg=#e3e3e3
	"set guicursor=a:blinkwait1000-blinkon1000-blinkoff1000
	set guicursor=a:blinkon0
	"set noerrorbells
	"set visualbell 
	"set t_vb=
	set belloff=all
	set guioptions=c
endif

" Save automatically on text changes or insert leave
" autocmd TextChanged,InsertLeave * silent! wall

"augroup FixOneDrive
  "autocmd!
  "autocmd BufWriteCmd ~/OneDrive/*
        "\ if &readonly | echoerr "E45: 'readonly' option is set" | else |
        "\   call writefile(getline(1, '$') + (&eol || !&bin ? [''] : []),
        "\     expand('<afile>:p'), 'b') | setlocal nomodified | silent! checktime |
        "\ endif
"augroup END

"Vim Wiki
let g:vimwiki_list = [{'path': '~/OneDrive/Documents/notes/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_autowriteall = 0
let g:vimwiki_key_mappings = { 'links': 0 }
"
function! SafeVimwikiFix()
  silent! nunmap <buffer> <CR>
  silent! vunmap <buffer> <CR>
  nmap <buffer> <Leader>g <Plug>VimwikiFollowLink
endfunction
augroup VimwikiEnterFix
  autocmd!
  autocmd FileType vimwiki call SafeVimwikiFix()
augroup END

"Toggle spellchecking
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction
"nnoremap <silent> <Leader>S :call ToggleSpellCheck()<CR>
nnoremap <silent> <F2> :call ToggleSpellCheck()<CR>

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

iabbrev poeple people
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>d :w !diff % -<CR>
nnoremap <silent> <Leader>o O<CR><UP>
nnoremap <silent> <Space> o<Esc>
noremap <silent> <Leader>p "+p
noremap <silent> <Leader>y "+y
nnoremap ; :
nnoremap : ;
nnoremap <C-PageUp> :bnext<CR>
nnoremap <C-PageDown> :bprevious<CR>
nnoremap L :bnext<CR>
nnoremap H :bprevious<CR>
nnoremap <Up> <C-y><C-y>
nnoremap <Down> <C-e><C-e>
nnoremap <C-l> <C-y><C-y><C-y>
nnoremap <C-h> <C-e><C-e><C-e>
noremap <C-j> }
noremap <C-k> {
inoremap <C-d> <esc> 
inoremap kj <esc>
nnoremap <Leader>s :VimwikiSearch 
nnoremap <silent> <Leader>f :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <silent> <Esc> :noh<CR><Esc>
nnoremap <Leader>8 a*p*[]<Esc>i
nnoremap <Leader>v GVgg
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]
let g:sneak#label = 1
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S
nnoremap <Leader>r mayap}p`a
nnoremap <Leader>R mayapGo<Esc>p`a
nnoremap Y ,
nnoremap Q 1z=

function! VoicePaste()
  let l:clip = getreg('+') != '' ? getreg('+') : getreg('*')
  let l:clean = substitute(l:clip, '^Voice\s*\|\.m4a\s*$', '', 'g')
  let @v = '[' . trim(l:clean) . ']'
  normal! "vp
endfunction
nnoremap <silent> <Leader>V :call VoicePaste()<CR>

command! -bang -nargs=? -complete=dir Buffers
  \ call fzf#vim#buffers({'options': ['--exact', '--tiebreak=index']}, <bang>0)
autocmd FileType markdown,vimwiki syntax sync minlines=40 maxlines=150
"autocmd FileType markdown,vimwiki syntax clear

"augroup VimwikiSearchRefinement
	"autocmd!
	"" 1. Map Enter to select and close inside the location list
	"autocmd FileType qf nnoremap <buffer> <CR> <CR>:lclose<CR>
	"" 2. Auto-open the list on search and jump the cursor into it
	"autocmd QuickFixCmdPost l* lwindow | call timer_start(5, {-> execute('if &filetype != "quickfix" | wincmd j | endif')})
"augroup END

augroup VimwikiSearchRefinement | autocmd!
  autocmd FileType qf nnoremap <buffer> <CR> <CR>:lclose<CR>
  autocmd QuickFixCmdPost l* lwindow | wincmd j
augroup END

"function! ZigZagInvertSelection() range
		"let l:save_cursor = getpos('.')
		"let l:start = a:firstline
		"let l:end = a:lastline
		
		"let l:sw = shiftwidth()
		"let l:indent_char = &expandtab ? ' ' : '	'
		
		"" Step 1: Snapshot original indents and find the true structural baseline
		"let l:min_indent = -1
		"let l:orig_indents = []
		
		"let l:current_line = l:start
		"while l:current_line <= l:end
				"let l:line_text = getline(l:current_line)
				"let l:ind = (l:line_text =~ '^\s*$') ? -1 : indent(l:current_line)
				"call add(l:orig_indents, l:ind)
				"if l:ind != -1 && (l:min_indent == -1 || l:ind < l:min_indent)
						"let l:min_indent = l:ind
				"endif
				"let l:current_line += 1
		"endwhile

		"if l:min_indent == -1 | return | endif

		"" Step 2: Safely determine global layout state (A or B) using the completed snapshot
		"let l:is_state_b = 0
		"for l:ind in l:orig_indents
				"if l:ind == l:min_indent + l:sw | let l:is_state_b = 1 | break | endif
				"if l:ind == l:min_indent | break | endif
		"endfor

		"" Step 3: Traverse and apply the mathematical toggle rules using the snapshot
		"let l:active_parent_is_p1 = 1
		"let l:idx = 0
		"let l:current_line = l:start
		
		"while l:current_line <= l:end
				"let l:ind = l:orig_indents[l:idx]
				"if l:ind != -1
						"" Track active parent tree context safely using original unmutated values
						"if l:ind == l:min_indent
								"let l:active_parent_is_p1 = !l:is_state_b
						"elseif l:ind == l:min_indent + l:sw
								"let l:active_parent_is_p1 = l:is_state_b
						"endif

						"" Execute perfectly mirrored structural shifts
						"if l:active_parent_is_p1
								"let l:new_size = l:ind + (l:is_state_b ? -l:sw : l:sw)
						"else
								"let l:new_size = (l:ind <= l:min_indent + l:sw) ? (l:ind + (l:is_state_b ? l:sw : -l:sw)) : l:ind
						"endif

						"" Commit text change directly to the file buffer
						"let l:clean_text = substitute(getline(l:current_line), '^\s*', '', '')
						"let l:new_leading = repeat(l:indent_char, &expandtab ? l:new_size : (l:new_size / l:sw))
						"call setline(l:current_line, l:new_leading . l:clean_text)
				"endif
				"let l:idx += 1
				"let l:current_line += 1
		"endwhile
		
		"call setpos('.', l:save_cursor)
"endfunction

"xnoremap Z :call ZigZagInvertSelection()<CR>

function! ZigZagInvertSelection() range
    " --- EFFICIENCY BLOCK START ---
    let l:save_lazy = &lazyredraw
    let l:save_ei = &eventignore
    setlocal lazyredraw
    setlocal eventignore=all
    silent! undojoin
    " --- EFFICIENCY BLOCK END ---

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

    if l:min_indent == -1
        " --- CLEANUP ON EARLY EXIT ---
        let &lazyredraw = l:save_lazy
        let &eventignore = l:save_ei
        return 
    endif

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
        " --- RESTORE THE SYSTEM ITERATOR LOOP ---
        let l:current_line += 1
    endwhile
    
    call setpos('.', l:save_cursor)

    " --- EFFICIENCY RESTORE START ---
    let &lazyredraw = l:save_lazy
    let &eventignore = l:save_ei
    " --- EFFICIENCY RESTORE END ---
endfunction
vnoremap <silent> <Leader>z :call ZigZagInvertSelection()<CR>

"traverse buffers cronologically
function! SmoothBufJump(dir)
    let [b:winview, l:jumps, l:curr] = [winsaveview(), getjumplist()[0], getjumplist()[1]]
    let l:step = a:dir == 'H' ? -1 : 1
    let l:idx = l:curr + l:step
    while l:idx >= 0 && l:idx < len(l:jumps)
        if l:jumps[l:idx].bufnr != bufnr('%') && bufexists(l:jumps[l:idx].bufnr)
            execute "normal! " . abs(l:idx - l:curr) . (a:dir == 'H' ? "\<C-o>" : "\<C-i>")
            if exists('b:winview') | call winrestview(b:winview) | endif
            return
        endif
        let l:idx += l:step
    endwhile
endfunction
nnoremap <silent> H :call SmoothBufJump('H')<CR>
nnoremap <silent> L :call SmoothBufJump('L')<CR>

"function! WriteOneDriveFile() abort
	"if &readonly | echoerr "E45: 'readonly' option is set" | return | endif
	"let l:eof = (&eol || !&bin ? [''] : [])
	"call writefile(getline(1, '$') + l:eof, expand('<afile>:p'), 'b')
	"setlocal nomodified
	"let l:open = '\' . repeat('=', 50) . '%'
	"let l:close = '\' . repeat('=', 49) . '%%'
	"let l:o_esc = '\V' . escape(l:open, '\') . '\m'
	"let l:c_esc = '\V' . escape(l:close, '\') . '\m'
	"let [l:l1, l:l2] = [search('^' . l:o_esc . '$', 'nw'),
				"\ search('^' . l:c_esc . '$', 'nw')]
	"if expand('<afile>:e') ==# 'md' && l:l1 > 0 && l:l2 > l:l1
		"let l:body = join(getline(l:l1 + 1, l:l2 - 1), "\n")
		"let l:pat = '\(^\|' . "\n" . '\)\zs' . l:o_esc . '\n\_.\{-}\n'
					"\ . l:c_esc . '\ze\($\|' . "\n" . '\)'
		"let l:rep = escape(l:open . "\n" . l:body . "\n" . l:close, '\&~')
		"let l:cur = expand('<afile>:p')
		"let l:files = filter(glob(expand('<afile>:p:h') . '/*.md', 0, 1),
					"\ 'v:val !=# l:cur')
		"for l:f in l:files
			"let l:old = join(readfile(l:f), "\n")
			"let l:new = substitute(l:old, l:pat, l:rep, 'g')
			"if l:new !=# l:old
				"call writefile(split(l:new, "\n", 1), l:f, 'b')
			"endif
		"endfor
	"endif
	"silent! checktime
"endfunction
"augroup FixOneDrive
	"autocmd!
	"autocmd BufWriteCmd ~/OneDrive/* call WriteOneDriveFile()
"augroup END

" ============================================================================
" Vimwiki Header Sync, File Includes & OneDrive Save Fix
" ============================================================================

" --- 1. Peer-to-Peer Header Sync (\===% ... \===%%) ---
function! SyncWikiHeader(cur, dir) abort
  let l:open = '\' . repeat('=', 50) . '%'
  let l:close = '\' . repeat('=', 49) . '%%'
  let l:o_esc = '\V' . escape(l:open, '\') . '\m'
  let l:c_esc = '\V' . escape(l:close, '\') . '\m'

  let [l:l1, l:l2] = [search('^' . l:o_esc . '$', 'nw'),
        \ search('^' . l:c_esc . '$', 'nw')]
  if l:l1 == 0 || l:l2 <= l:l1 | return | endif

  let l:body = join(getline(l:l1 + 1, l:l2 - 1), "\n")
  let l:pat = '\(^\|' . "\n" . '\)\zs' . l:o_esc . '\n\_.\{-}\n'
        \ . l:c_esc . '\ze\($\|' . "\n" . '\)'
  let l:rep = escape(l:open . "\n" . l:body . "\n" . l:close, '\&~')

  for l:f in filter(glob(a:dir . '/*.md', 0, 1), 'v:val !=# a:cur')
    let l:old = join(readfile(l:f), "\n")
    let l:new = substitute(l:old, l:pat, l:rep, 'g')
    if l:new !=# l:old
      call writefile(split(l:new, "\n", 1), l:f, 'b')
    endif
  endfor
endfunction

" --- 2. Single-Source File Transclusion (<!-- include: ... -->) ---
function! ExpandIncludes(text, dir) abort
  let l:pat = '<!-- include: \([^ >]\+\) -->\n\_.\{-}\n<!-- endinclude -->'
  let l:res = a:text
  let l:pos = 0
  while 1
    let l:m = matchlist(l:res, l:pat, l:pos)
    if empty(l:m) | break | endif
    let l:full = get(l:m, 0)
    let l:file = get(l:m, 1)
    let l:inc = a:dir . '/' . l:file
    if filereadable(l:inc)
      let l:body = join(readfile(l:inc), "\n")
      let l:rep = '<!-- include: ' . l:file . " -->\n" . l:body
            \ . "\n<!-- endinclude -->"
      let l:idx = match(l:res, l:pat, l:pos)
      let l:res = strpart(l:res, 0, l:idx) . l:rep
            \ . strpart(l:res, l:idx + strlen(l:full))
      let l:pos = l:idx + strlen(l:rep)
    else
      let l:pos = match(l:res, l:pat, l:pos) + strlen(l:full)
    endif
  endwhile
  return l:res
endfunction

function! PushWikiIncludes(cur, dir, name) abort
  let l:tag = '<!-- include: ' . a:name . ' -->'
  for l:f in filter(glob(a:dir . '/*.md', 0, 1), 'v:val !=# a:cur')
    let l:old = join(readfile(l:f), "\n")
    if stridx(l:old, l:tag) != -1
      let l:new = ExpandIncludes(l:old, a:dir)
      if l:new !=# l:old
        call writefile(split(l:new, "\n", 1), l:f, 'b')
      endif
    endif
  endfor
endfunction

" --- 3. OneDrive Save Coordinator ---
function! WriteOneDriveFile() abort
  if &readonly | echoerr "E45: 'readonly' option is set" | return | endif

  let l:cur = expand('<afile>:p')
  let l:dir = expand('<afile>:p:h')
  let l:is_md = (expand('<afile>:e') ==# 'md')
  let l:text = join(getline(1, '$'), "\n")

  if l:is_md
    let l:exp = ExpandIncludes(l:text, l:dir)
    if l:exp !=# l:text
      let l:text = l:exp
      call setline(1, split(l:text, "\n", 1))
    endif
  endif

  let l:eof = (&eol || !&bin ? [''] : [])
  call writefile(split(l:text, "\n", 1) + l:eof, l:cur, 'b')
  setlocal nomodified

  if l:is_md
    call SyncWikiHeader(l:cur, l:dir)
    call PushWikiIncludes(l:cur, l:dir, expand('<afile>:t'))
  endif
endfunction

augroup FixOneDrive
  autocmd!
  autocmd BufWriteCmd ~/OneDrive/* call WriteOneDriveFile()
augroup END
