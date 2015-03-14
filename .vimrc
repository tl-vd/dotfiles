" Setup"{{{
function! VimSetup()
let g:home=system("printf $HOME")
let g:ran_setup=1


set number           " Required to have current line number not be just zero

set smartindent
set backspace=indent,start,eol
set history=1000
set nocompatible

set laststatus=2
set statusline=%10f:        " Filename (padded to 10 characters)
set statusline+=\ %4l/%.4L  " Current line / Total lines (padded to 4 chars)
set statusline+=\ -\ %2c    " Current character number

set wildignore=*.o,*.obj,*.exe,*.jpg,*.gif,*.png,*.class,*.hi,*.pdf,*.pyc,*.jpeg,*.gz,*.cache
set wildignore+=doc
set wildignore+=.git
set wildignore+=.git/*
set wildignore+=*/.git/*
" Use shell-like autocompletion "
set wildmode=longest:list

set virtualedit=onemore
"}}}
" Plugins"{{{
filetype off
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'ntpeters/vim-better-whitespace'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/phd'
NeoBundle 'chriskempson/vim-tomorrow-theme'

NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-notes'
" NeoBundle 'lervag/vim-latex'
" NeoBundle 'FuzzyFinder'
NeoBundle 'bling/vim-airline'

NeoBundle 'Shougo/vimproc.vim', {'build':'unix'}
" NeoBundle 'Shougo/vimshell'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = '<c-Space>'

" NeoBundle 'Valloric/YouCompleteMe'
"let g:ycm_allow_changing_updatetime = 0
"let g:ycm_confirm_extra_conf=0
"let g:ycm_semantic_triggers = {'haskell' : ['.', '(']}
"let g:ycm_filetype_blacklist = {'haskell': 1}

call CtrlPSetup()
call SyntasticSetup()
call AirlineSetup()

" Language plugins"{{{
let supported_languages = split(globpath('~/code/dotfiles/vim/languages', '*'), '\n')
call map(supported_languages, 'split(v:val, "/")[-1]')
call map(supported_languages, 'split(v:val, "\\.")[0]')
for language in supported_languages
    " Include bundles for languages
    exe 'source ~/code/dotfiles/vim/languages/' . language . '.vim'
    if exists('*' . language . '#bundles')
        exe 'call ' . language . '#bundles()'
    endif
endfor
"}}}
set rtp+=~/.vim/bundle/vimproc.vim
call neobundle#end()
filetype plugin indent on
" Neobundle
"}}}
" Calls"{{{
call CodeFolding()
call TabBehaviour()
call SearchBehaviour()
call BackupAndSwapFiles()
call SyntaxHighlighting()
call SetupTags()
call NoteSetup()
"}}}
" GUI"{{{
if has("gui_running")
    set shell=/usr/bin/zsh\ -i
endif
set vb t_vb=  " No bell
autocmd GUIEnter * set visualbell t_vb=
set guifont=Monospace\ 14
set guioptions-=m
set guioptions-=r
set guioptions-=T
set guioptions-=L
set ghr=0
set scrolloff=15
set guicursor+=a:blinkon0
set background=dark
"}}}
" Filetypes"{{{
augroup filetypedetect
    let language_extensions = {
        \ "haskell":   "hs",
        \ "latex":     "tex",
        \ "python":    "py",
        \ "asciidoc":  "adoc",
        \ "opencl":    "cl",
        \ "note":      "note"
        \ }
    for [lang, ext] in items(language_extensions)
        if exists('*' . lang . '#enter')
            exe 'au! BufEnter,BufNewFile *.' . ext . ' call ' . lang . '#enter()'
        endif
        if exists('*' . lang . '#leave')
            exe 'au! BufLeave,BufUnload,BufDelete *.' . ext . ' call ' . lang . '#leave()'
        endif
    endfor
augroup END
"}}}
" Keybindings"{{{
" Leader"{{{
let g:mapleader=' '
map <Leader>w :w<CR>:echo "Written at " . strftime("%c")<CR><ESC>
map <Leader>q :q<CR>
map <Leader>! :q!<CR>
map <Leader>t :SyntasticToggleMode<CR>
map <Leader>e :StripWhitespace<CR>

map <Leader><Right> :vertical resize +5<CR>
map <Leader><cg> :vertical resize -5<CR>
map <Leader><Down> :resize +5<CR>
map <Leader><Up> :resize -5<CR>

map <Leader>v :vs
map <Leader>g :sp
map <Leader>s :%s//<Left>
vmap <Leader>s :s//<Left>
nnoremap <Leader>z za
"}}}
" Remaps"{{{
nnoremap L g_
nnoremap H ^
nnoremap k gk
nnoremap j gj

inoremap <S-CR> <Esc>A<CR>
inoremap <C-u> <Esc>

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"}}}
endfunction
"}}}
" Functions"{{{
" Tabs: Expand tabs to four spaces each. ""{{{
function! TabBehaviour()
    " Use spaces, not real tabs "
    set expandtab

    " When indenting with cindent, >>, <<, etc, use 4 spaces "
    set shiftwidth=4

    " When hitting tab or backspace, a tab should be 4 spaces "
    set softtabstop=4

    " For consistency, treat even real tabs as 4 spaces "
    set tabstop=4

    " If cursor is at 3 spaces, you press >>, go to 4, not 7 "
    set shiftround
endfunction
"}}}
" Search: incremental search that isn't stupid ""{{{
function! SearchBehaviour()
    " Incremental search "
    set incsearch

    " Ignore case of search strings, unless capitals are included "
    set ignorecase
    set smartcase
    set nohlsearch
endfunction
"}}}
" Backup And Swap Files: Keep in ~/.vim/tmp/backup and ~/.vim/tmp, respectively ""{{{
function! BackupAndSwapFiles()
    " Make backup files in .vim/tmp/backup "
    set backup
    set backupdir=~/.vim/tmp/backup

    " Put swap files (.swo, .swp) in .vim/tmp "
    set directory=~/.vim/tmp
endfunction
"}}}
" Setup Tags: Enable ctags and create mappings for jumping around. ""{{{
function! SetupTags()
    " ctags file "
    set tags=~/.vim/tmp/tags

    map <C-\> :pop<CR>
    imap <C-\> <ESC>:pop<CR>
endfunction
"}}}
" Syntax Highlighting: enabled, color-themed, and customized ""{{{
function! SyntaxHighlighting()
    " Enable syntax highlighting "
    syntax on
    colorscheme solarized
endfunction
"}}}
" Note Setup: stuff ""{{{
function! NoteSetup()

    let g:notes_suffix='.note'
    let g:notes_indexfile='~/.vim/bundle/vim-notes/misc/note.index'
endfunction
"}}}
" Code Folding: allow code folding for functions, etc ""{{{
function! CodeFolding()
    " Enable code folding "
    set foldenable

    " C-style folding "
    set foldmethod=marker
    set foldmarker={{{,}}}

    " Don't autofold unless we have at least 5 lines "
    set foldminlines=5
endfunction
"}}}
" Airline configuration"{{{
function! AirlineSetup()
    :let g:airline_theme='powerlineish'
    let g:airline#extensions#tabline#enabled = 1
endfunction
"}}}
" Syntastic configurations:"{{{
function! SyntasticSetup()
    NeoBundle 'scrooloose/syntastic'
    let g:syntastic_auto_loc_list=1 " open error window automatically with size 4
    let g:syntastic_loc_list_height=4
    let g:syntastic_check_on_open=1
    let g:syntastic_python_checkers=["flake8", "pep8", "flake8", "pyflakes", "pylint"]
    let g:syntastic_always_populate_loc_list=1


    let g:syntastic_tex_checkers=['chktex']
    let g:syntastic_tex_chktex_args='-n 1'

    map gn :ll<Space>\|<Space>lnext<CR>
    map gN :ll<Space>\|<Space>lprev<CR>
endfunction
"}}}
" Ctrl-P file finder"{{{
function! CtrlPSetup()
    NeoBundle 'kien/ctrlp.vim'

    let g:ctrlp_extensions = ['line', 'mixed']
    let g:ctrlp_map = '<c-n>'
    let g:ctrlp_cmd = 'CtrlP ' . g:home
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_show_hidden=1
    let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("h")': ['<c-g>'],
        \ }
    " Don't regenerate the cache every time
    let g:ctrlp_clear_cache_on_exit = 0

    " Places for Ctrl-P to ignore
    let ignore_dirs = ["\\.git", "\\.hg", "\\.svn", "\\.cache", "\\.ghc", "\\.gem", "\\.shelly", "\\.text", "\\.theano",
                    \"\\.cabal", "\\.ipynb_checkpoints", "stuff", "\\.matlab", "\\.ipynb_checkpoints", "\\.ssh",
                    \"\\.gradle", "\\.asy", "\\.lein", "\\.boot2docker", "\\.m2", "\\.vagrant.d", "\\.android", "\\.idea",
                    \"\\.julia", "\\.Trash", "music", "Documents", "Movies", "dist", "ace", "ace-builds", "\\.mplayer",
                    \"\\.ihaskell", "dev", "bundle", "tmp", "Pictures", "\\.store", "env", "Metadata", "weights", "\\.cabal-sandbox",
                    \"Library", "downloads", "archive", "Public", "default", "\\.ipython", "*\\.pages", "Applications",
                    \"\\.cups", "\\.subversion", "security", "\\.sass-cache", "gen", "bootstrap"]
    let ignore_exts = ["exe", "so", "dll", "doc", "svg", "mp4", "mp3", "hi", "a", "p_hi", "p_o",  "Xauthority",
                    \"swp", "swo", "DS_store", "docx", "ipynb", "npy", "avi", "jar", "min.js", "htoprc",
                    \"bash_history", "lesshst", "pyg", "tar", "tga", "ttf", "plist", "zcompdump", "julia_history",
                    \"histfile", "haskeline", "log", "zip", "bib", "out", "toc", "ppt", "mat", "sh_history",
                    \"arcrc", "pearrc", "nviminfo", "ico", "cdr", "iml", "iso", "serverauth.2686", "clang_complete", "xcf",
                    \"fasd", "floorc", "rnd", "aux", "nb", "xml", "bcf", "lof", "blg", "lot", "jpeg",
                    \"viminfo", "gitconfig", "serverauth*", "nav"]

    let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[/]('.join(ignore_dirs, '|').')$',
    \ 'file': '\v\.('.join(ignore_exts, '|').')$',
    \ }
    let g:ctrlp_cache_dir = g:home."/.vim/tmp/ctrlp"
    map <c-b> :CtrlPLine<CR>
    imap <c-b> <ESC><c-/>
endfunction
"}}}
"}}}

" Run the configuration "
if !exists("g:ran_setup")
    call VimSetup()
endif
