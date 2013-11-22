" load plugins
filetype off
filetype plugin indent on
call pathogen#infect()
call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()

syntax on
" don't care about this working on very old terminals
set nocompatible
" prevent exploits
set modelines=0

" tab prefs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab

" general prefs
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmode=longest,list,full
set wildmenu
set nocursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"set relativenumber
set nu
set directory=/tmp " swp files
"set autochdir
"set guifont=Menlo:h13
"set guicursor=a:blinkon0
set guioptions-=r
set guioptions-=L
set guioptions-=T       " Hide menu
set mousehide           " Hide the mouse when typing text
set noerrorbells
set visualbell
set t_vb=
set lazyredraw
set title


let mapleader = "," " default is \ which is far

" regex sanity
nnoremap / /\v
vnoremap / /\v

" search prefs
set ignorecase " All lower case is case insenstive otherwise, case sensitive
set smartcase
set incsearch
set showmatch
set hlsearch
"set gdefault " always /g when substituting, /g suffix to not

" clear search with space comma
nnoremap <leader><space> :noh<cr> 
" match pairs
nnoremap <tab> %
vnoremap <tab> %

" long line handling
set nowrap
set textwidth=80
set formatoptions=qrn1
"set colorcolumn=85

" remove help key mapping
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" buffer change with ctrl
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-X> :bd<CR>

nnoremap ; :

if has('mouse')
  set mouse=a
endif


if has("gui_running")
  set transparency=5
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" NERD Tree
let NERDTreeChDirMode=2
map <F1> :NERDTreeToggle .<cr>


" enable repaste
xnoremap p pgvy

" swap to header and back
map ,a :A<cr>

" update vim settings
map ,s :source ~/.vimrc<cr>
map ,v :e ~/.vimrc<cr>

" pick a random colorscheme from the custom colors foloder
"let mycolors = split(globpath("~/.vim","**/colors/*.vim"),"\n") 
"  exe 'so ' . mycolors[localtime() % len(mycolors)]
"unlet mycolors

if has("autocmd") " Only do this part when compiled with support for 'autocommands'.
        autocmd FileType python,sql set ts=4 sw=4 et            " Python
        autocmd FileType ruby,php set ts=2 sw=2 et              " Ruby
        autocmd FileType c,cpp  set ts=4 sw=4 cindent           " C & C++
        autocmd FileType rst,javascript,js,java,docbk,html,xhtml,xml set ts=2 sw=2 et
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
        " auto change directory
        "autocmd BufEnter * lcd %:p:h
        " If you prefer the Omni-Completion tip window to close when a selection is
        " made, these lines close it on movement in insert mode or when leaving
        " insert mode
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif
endif " has("autocmd")


"" OmniCppComplete
"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"set completeopt=menuone,menu,longest,preview


" SuperTab
"let g:SuperTabDefaultCompletionType = "context"

set tags=tags;$HOME

set tags=~/.vim/tags/cpp
function! SetProj(proj)
        if a:proj == "village"
                noremap <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/Development/village/tags ~/Development/village <CR>
                set tags+=~/Development/village/tags
                cd ~/Development/village
        elseif a:proj == "cmonsters"
                noremap <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/Development/cmonsters/tags ~/Development/cmonsters <CR>
                set tags+=~/Development/cmonsters/tags
                cd ~/Development/cmonsters
        elseif a:proj == "bluesteel"
                noremap <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/Development/bluesteel/tags ~/Development/bluesteel <CR>
                set tags+=~/Development/bluesteel/tags
                cd ~/Development/bluesteel
        elseif a:proj == "bluesteelserver"
                noremap <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/Development/bluesteelserver/tags ~/Development/bluesteelserver <CR>
                set tags+=~/Development/bluesteelserver/tags
                cd ~/Development/bluesteelserver
        elseif a:proj == "dummy"
                noremap <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/Development/dummy/tags ~/Development/dummy <CR>
                set tags+=~/Development/dummy/tags
                cd ~/Development/dummy
        elseif a:proj == "nova"
                noremap <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/Development/rednova/tags ~/Development/rednova <CR>
                set tags+=~/Development/rednova/tags
                cd ~/Development/rednova
        elseif a:proj == "fg"
                noremap <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/Development/rednova/tags ~/Development/fg <CR>
                set tags+=~/Development/fg/tags
                cd ~/Development/fg
        else
        endif
endfunction

call SetProj("fg")

" CommandT
let g:CommandTMaxFiles=100000
"set wildignore+=Frameworks/**,lib/griffin/shared/boost*/**,*.o.d,*.o,*.obj,.git,*.png,*.jpg,*.jpeg,*.swf,*.dds,*.png,*.ccz,*.psd,*.plist,*.fnt,*.mp3,*.class,*.wav,*.ttf,*.otf,*.lta
set wildignore+=Frameworks/**,lib/griffin/shared/boost*/**,Resource/**,android/assets**,android/bin/**,android/gen/**,android/obj/**,android/libs/**,android/revisions/**,android/res/**
"source ~/.vim/plugin/autotag.vim

" made these changes to match weechat's status line
"hi StatusLine ctermbg=23 ctermfg=yellow cterm=none
"hi StatusLineNC ctermbg=23 ctermfg=grey cterm=none
"hi Visual ctermbg=yellow ctermfg=black cterm=none


set t_Co=256
set background=dark
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
"colorscheme desert-warm-256
colorscheme solarized
