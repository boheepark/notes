set autoindent
set autowrite
set background=dark
set backspace=indent,eol,start
set binary
set nocompatible
set copyindent
set expandtab
set foldmethod=expr
set formatoptions-=tc
set history=10000
set incsearch
set mouse=a
set ruler
set shiftwidth=4
set showcmd
set smartcase
set smarttab
set shell=/bin/ksh
set showmatch
set tabstop=4
set term=xterm
set textwidth=120
set winfixheight
set winfixwidth
set nowrapscan

iabbrev slef self
iabbrev pritn print

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>syn :call ToggleSyntax()<CR>
nnoremap <leader>pysyn :call TogglePySyntax()<CR>
nnoremap <leader>htmlsyn :call ToggleHTMLSyntax()<CR>

onoremap in( :<C-u>normal! f(vi(<CR>

nnoremap <leader>kshz :!ksh %
nnoremap <leader>bashz :!bash %

nnoremap <leader>ksh<CR> :!ksh %<CR>
nnoremap <leader>bash<CR> :!bash %<CR>
nnoremap <leader>py<CR> :!python %<CR>
nnoremap <leader>py3<CR> :!python3 %<CR>
nnoremap <leader>pl<CR> :!perl %<CR>
nnoremap <leader>nd<CR> :!node %<CR>

nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>ek :vsplit ~/.kshrc<CR>
nnoremap <leader>eb :vsplit ~/.bashrc<CR>

nnoremap - ddkP
nnoremap _ ddp

inoremap <C-e> <C-x><C-e>
inoremap <C-y> <C-x><C-y>

highlight BOLDIT term=bold cterm=bold gui=bold

syntax match pyComment /#.*/
syntax match pyAnnotation /\s@.*/

let s:pywords = ["from", "import", "as", "class", "self", "def", "print", "for", "is", "in", "range", "and", "if", "else", "elif", "endif", "while", "not", "return", "try", "except", "with", "True", "False", "None", "pass", "len", "append"]
let s:match_pywords = 'match BOLDIT /\c\<\(' . join (s:pywords, '\|') . '\)\>/'

function! TogglePySyntax()
    if exists('w:check_pywords')
        let w:check_pywords = !w:check_pywords
    else
        let w:check_pywords = 1
    endif
    if w:check_pywords
        exec s:match_pywords
        highlight pyComment ctermfg=DarkGray
        highlight pyAnnotation ctermfg=Gray
    else
        match none
    endif
endfunction

let s:jswords = ["document", "function", "var", "false", "true"]
let s:match_jswords = 'match BOLDIT /\c\<\(' . join (s:jswords, '\|') . '\)\>/'

function! ToggleHTMLSyntax()
    if exists('w:check_jswords')
        let w:check_jswords = !w:check_jswords
    else
        let w:check_jswords = 1
    endif
    if w:check_jswords
        exec s:match_jswords
    else
        match none
    endif
endfunction

let s:htmlwords = ["html", "head", "title", "body", "h1", "div", "class", "form", "method", "action", "href", "link", "script", "a", "nav", "id"]
let s:match_htmlwords = 'match BOLDIT /\c\<\(' . join (s:htmlwords, '\|') . '\)\>/'

function! ToggleHTMLSyntax()
    if exists('w:check_htmlwords')
        let w:check_htmlwords = !w:check_htmlwords
    else
        let w:check_htmlwords = 1
    endif
    if w:check_htmlwords
        exec s:match_htmlwords
    else
        match none
    endif
endfunction

function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif
