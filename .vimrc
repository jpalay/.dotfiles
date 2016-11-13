" Vundle setup
set nocompatible
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'nvie/vim-togglemouse'
Plugin 'tomtom/tcomment_vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'othree/html5.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'gregsexton/MatchTag'
Plugin 'pangloss/vim-javascript'
Plugin 'klen/python-mode'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'

call vundle#end()

if $TERM == "xterm-256color"
    set t_Co=256
endif

" Set filetype-specific commands
if has("autocmd")
    au BufRead,BufNewFile *.jinja2 set filetype=html
    au BufRead,BufNewFile *.jinja2 nnoremap <leader>s :wa<CR>:!./template.py<CR>
    au BufRead,BufNewFile *.c nnoremap <leader>s :wa<CR>:!make<CR>
    au BufRead,BufNewFile *.pde set filetype=c
    au BufRead,BufNewFile *.c.txt set filetype=c
    au BufRead,BufNewFile *.tex nnoremap <leader>s :w<CR>:!tex_to_pdf<CR><CR>
    au BufRead,BufNewFile *.sql nnoremap <leader>e :w<CR>:!cat % \| grep -v ^-- \| grep -v ^\s*$ && echo && mysql --defaults-group-suffix=rm2 --table < %<CR>
    autocmd! BufReadPost,BufNewFile * call SetupEnvironment()
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd FileType javascript set shiftwidth=2 | set softtabstop=2 | set tabstop=2
endif


" Set colorscheme
if has("gui_running")
    set guifont=Consolas:h11
    set background=dark
    colorscheme solarized
    set guicursor+=a:blinkon0
    " Remove left scrollbar on vspilt window
    set go-=L
    " Remove right scrollbar
    set guioptions-=r
else
    " let g:solarized_termcolors=256
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
    set background=dark
    colorscheme solarized
endif

highlight link GitGutterAdd DiffAdd
highlight link GitGutterDelete DiffDelete
highlight link GitGutterChange DiffChange
highlight link GitGutterChangeDelete DiffDelete

nnoremap <leader>hn <Plug>GitGutterNextHunk
nnoremap <leader>hN <Plug>GitGutterPrevHunk

" Window swap setup
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

let mapleader=","
nnoremap ; :
syntax on

set grepprg=grep\ -nH\ $*
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase      " Do smart case matching
set incsearch		" Incremental search
set hidden             " Hide buffers when they are abandoned
set backspace=indent,eol,start
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set copyindent
set number
set shiftround " (un)indent to nearest tabstop
set mouse=a
set history=1000
set undolevels=1000
set wildignore=*.cmi,*.cmo,*.mid,*.pyo,*.pyc,*.ctxt,*.jar,*.jpg,*.jpeg,*.png
set wildignore+=*.gif,*.tiff,*.o,*/data/*
set title
set visualbell
set noerrorbells
set nobackup
set pastetoggle=<F2>
set colorcolumn=80 " Colored column at 90 chars
set laststatus=2
set foldmethod=syntax
set nofoldenable

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


nnoremap <leader><leader> $
nnoremap <leader>wl <c-w>l 
nnoremap <leader>wh <c-w>h 
nnoremap <leader>wj <c-w>j 
nnoremap <leader>wk <c-w>k 
nnoremap <leader>we <c-w>= 
inoremap <leader>n <c-n>
nnoremap <silent> <leader>wy :call MarkWindowSwap()<CR>
nnoremap <silent> <leader>wp :call DoWindowSwap()<CR>
nnoremap <leader>j o<Esc>
nnoremap <leader>J O<Esc>
nnoremap <leader>x /.\{81,}<CR>

" ctags
nnoremap <leader>\ :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>] <C-]>
nnoremap <leader>. :CtrlPTag<CR>

" latex
nnoremap <leader>c <leader>ll

" Ctrl-P options
nnoremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>t'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_custom_ignore = {
    \ 'dir': '*/scraper/data',
    \ }
let g:ctrlp_cmd = 'CtrlPMixed'

" Emmet options
let g:user_emmet_expandabbr_key = '<leader>f'

"pymode options
let g:pymode_indent = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_trim_whitespaces = 0
" let g:pymode_options_max_line_length = 90
let g:pymode_motion = 0
" E731 - do not assign a lambda expression, use a def
" E309 - blank line below class definitions
" E501 - 80 character limit
" E701 - multiple statements on one line
let g:pymode_lint_ignore = "E731,E309,E501,E701,C901,"
nnoremap <leader>l :PymodeLint<CR>

" indentLine options
let g:indentLine_char = '¦'

" Copy/paste to/from clipboard
function! s:FuckingCopyTheTextPlease() " {{{2
  let old_z = @z
  normal! gv"zy
  call system('pbcopy', @z)
  let @z = old_z
endfunction " }}}2

noremap <leader>p :silent! set paste<CR>"*p:set nopaste<CR>
vnoremap <silent> <leader>y :<c-u>call <SID>FuckingCopyTheTextPlease()<cr>

highlight MatchParen cterm=underline,bold ctermbg=none ctermfg=none

match Error "[^\x00-\x7F]"
highlight Error ctermbg=126 ctermfg=White

filetype plugin on
filetype plugin indent on

function! SetupEnvironment()
  let l:path = expand('%:p')
  if l:path =~ '/Users/joshpalay/Desktop/work/cs171'
      setlocal tabstop=2 shiftwidth=2 softtabstop=2
  endif
endfunction

function! CursorPing()
    set cursorline cursorcolumn
    redraw
    sleep 400m
    set nocursorline nocursorcolumn
endfunction

nnoremap <leader><Space> :call CursorPing()<CR>

let g:is_purple = 0
function! TogglePurple()
    if g:is_purple
        set background=light
        let g:is_purple = 0
    else
        highlight Normal guibg=MediumOrchid1
        let g:is_purple = 1
    endif
endfunction
command Purple call TogglePurple()

function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

au FileType python call TextEnableCodeSnip('sql', "''' -- sql", "'''", 'SpecialComment')
au FileType python call TextEnableCodeSnip('sql', "\u''' -- sql", "'''", 'SpecialComment')

try 
  source ~/.local_vimrc
catch
  " No such file? No problem; just ignore it.
endtry 
