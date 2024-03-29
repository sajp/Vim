set nocompatible               " be iMproved

set nu                          " set line numbers
set ignorecase
set smartcase
set scrolloff=10
set wildmode=longest,list
set wildmenu
set encoding=utf-8
set wildignore+=*.swp,.git,*.svn,cover_db

set cpoptions+=$                " Show $ sign when changing
set mouse=a
set history=1000                " how many lines of history to remember
set showmode

set backupdir=~/.vim_backup

" alias unnamed register to '+' register to allow copying to clipboard
set clipboard=unnamedplus

" when selecting block in visual mode allow selection outside end of line
set virtualedit=block

" treat all numbers as decimals
set nrformats=

" set relative number
"set relativenumber

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" highlight searching
set hlsearch
" incremental search
set incsearch

" Tabs / Indents
set autoindent                  " indent at the same level of the previous line
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent

" stop splitting words when wrapping lines
set linebreak
" set backspace behaviour in insert mode
set backspace=2

" auto complete options for [Ctrl]-n and [Ctrl]-p
set complete=.,w,b,t

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

let g:VimuxOrientation = "h"
let g:VimuxHeight = "25"

" color scheme
if &diff
    colorscheme morning
else
    colorscheme Mustang
endif

" folding
let perl_fold = 1
set foldcolumn=2
set foldlevelstart=1
set foldmethod=indent
nnoremap <silent> <Leader>z za
autocmd FileType json setlocal foldmethod=syntax

" suffix
set suffixesadd=.pm,.pl,.t

"
" MAPPINGS
"

" insert newline and leave insert mode
noremap <Leader>o o<Esc>
" delete whitespace and end of lines
noremap <Leader>ws :%s/\s\+$//<CR>

set pastetoggle=<F3>

" Set text wrapping toggles
nmap  <Leader>w :set invwrap<CR>:set wrap?<CR>

" reselect just pasted text
nnoremap <leader>v V`]

" Let's make it easy to edit this file (mnemonic for the key sequence is 'e'dit 'v'imrc
nnoremap <Leader>ev :tabedit $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is 's'ource 'v'imrc)
nnoremap <Leader>sv :so $MYVIMRC<cr>

" open new vertical split
nnoremap <silent> vv <C-w>v
" open new horizontal split
nnoremap <silent> ss <C-w>s
" open new tab
nnoremap <silent> tt :tabnew<CR>
nnoremap <Leader>d :bd<CR>

" turn of search highlighting
nnoremap <Leader>a :nohls<CR>
" disable arrow keys to force me to use hjkl and stay in command mode
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Maps to make handling windows a bit easier
noremap <silent> <Leader>h :wincmd h<CR>
noremap <silent> <Leader>j :wincmd j<CR>
noremap <silent> <Leader>k :wincmd k<CR>
noremap <silent> <Leader>l :wincmd l<CR>
noremap <silent> <Leader>ml <C-W>L
noremap <silent> <Leader>mk <C-W>K
noremap <silent> <Leader>mh <C-W>H
noremap <silent> <Leader>mj <C-W>J

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <Leader>sh <C-W><
map <silent> <Leader>sj <C-W>-
map <silent> <Leader>sk <C-W>+
map <silent> <Leader>sl <C-W>>

" Maps for tab navigation
noremap <silent> <Leader>n :tabnext<CR>
noremap <silent> <Leader>p :tabprev<CR>

nnoremap <Leader>vv :TestFile<CR>
" Prompt for a command to run map

"fzf
"set rtp+=~/.fzf
set rtp+=/opt/homebrew/bin/fzf
nnoremap <silent> <Leader>ff :<C-u>GFiles<CR>
nnoremap <silent> <Leader>fa :<C-u>Files<CR>
nnoremap <silent> <Leader>fs :<C-u>GFiles?<CR>
nnoremap <silent> <Leader>fb :<C-u>Buffers<CR>
nnoremap <silent> <Leader>fg :<C-u>Rg <C-R><C-W><CR>
nnoremap <silent> <Leader>fc :<C-u>Commits <CR>
nnoremap <silent> <Leader>fw :<C-u>Windows <CR>
nnoremap <silent> <Leader>fl :<C-u>BLines <CR>

" Nerdtree toggle
noremap <F2> :NERDTreeToggle<CR>

"Increment / decrement remap
nnoremap <Leader>1 <C-a>
nnoremap <Leader>2 <C-x>

" make Y consistent with D and C
nnoremap Y y$

"
"PLUGINS - vim-plug
"
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'spiiph/vim-space'
Plug 'benmills/vimux'
Plug 'tmhedberg/SimpylFold'
Plug 'nvie/vim-flake8'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'tpope/vim-projectionist'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'w0rp/ale'
Plug 'janko/vim-test'

" Syntax Files
Plug 'tpope/vim-markdown'
Plug 'bioSyntax/bioSyntax-vim'
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plug 'jtratner/vim-flavored-markdown'

" Colour Schemes
Plug 'altercation/vim-colors-solarized'

call plug#end()

syntax on                       " enable syntax highlighting
filetype on                     " enable vim filetype detection
filetype plugin on
filetype indent on

" NERDTree
let NERDTreeShowBookmarks=1                  " Show the bookmarks table on startup
let NERDTreeQuitOnOpen=1                     " Close nerd tree after opening a file
let NERDTreeIgnore=['\.pyc$','\~$']

" delimitMate Setup
let delimitMate_expand_space = 1             " expand <space> inside empty delimiters
let delimitMate_expand_cr = 1                " expand <cr> inside empty delimiters

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

 " Enable tabline ( part of airline )
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#format = 1
let g:airline_section_y =''
let g:airline_section_c ='%t'

" default to GH flavoured markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" simple fold
let g:SimpylFold_docstring_preview = 1

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" peekabo
let g:peekaboo_window = 'split bo 20new'

" ale
" config in relevant config files
let g:ale_fixers = {'python': [ 'black', 'trim_whitespace']}
let g:ale_linters = {'python': [ 'pylint', 'mypy' ]}
let g:ale_python_black_options = '--target-version=py36 --line-length=120'
let g:ale_python_mypy_options = '--no-strict-optional --ignore-missing-imports'
"let g:ale_python_pylint_options = '--max-line-length=120 --disable=design --disable=missing-docstring --disable=bad-continuation --disable=max-module-lines --disable=useless-super-delegation --disable=import-error --disable=logging-fstring-interpolation --disable=invalid-name --disable=duplicate-code --disable=broad-except --disable=logging-format-interpolation'

" vim-test
let test#strategy = "vimux"
let test#perl#prove#options = '-v -I /app/lib -I /app/ext-lib -I /app/t/lib -I /app/pipeline/sapientia-task/lib'
let test#python#runner = 'pytest'
let g:test#perl#prove#file_pattern = '\v^t/.*\.t$'
let test#python#pytest#options = '-v --lf'
let test#filename_modifier = ':p' " Full file path 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>ed :edit <C-R>=expand("%:p:h") . "/"<CR>


" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
