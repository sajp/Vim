set nocompatible               " be iMproved
filetype off                   " required for Vundle, turn on later

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

" when selecting block in visual mode allow selection outside end of line
set virtualedit=block

" treat all numbers as decimals
set nrformats=

" set relative number
set relativenumber

" give me more colours
set term=xterm-256color

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

" color scheme
if &diff
    colorscheme morning
else
    colorscheme Mustang
endif

" perltidy
autocmd BufRead,BufNewFile *.pl,*.plx,*.pm command! -range=% -nargs=* Tidy <line1>,<line2>!perltidy -pbp -l=120
autocmd BufRead,BufNewFile *.pl,*.plx,*.pm noremap <F5> :Tidy<CR>

" folding
let perl_fold = 1
set foldcolumn=0
set foldlevelstart=1
nnoremap <silent> <Leader>z za

" suffix
set suffixesadd=.pm,.pl,.t

" Persistance Undo Keep undo history across sessions, by storing in file.
"set undodir=~/.vim/backups
"set undofile
"set undolevels = 1000 "maximum number of changes that can be undone
"set undoreload = 10000 "maximum number lines to save for undo on a buffer reload

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

" always move down one screen line
"noremap j gj
"noremap k gk

" Vimux
function! VimuxSetupRunner()
  call VimuxSendText("cd ~/workspace/sapientia-web/docker-compose/pipeline-dev/")
  call VimuxSendKeys("Enter")
  call VimuxSendText("./docker-pipeline")
  call VimuxSendKeys("Enter")
endfunction

nnoremap <Leader>vs :call VimuxSetupRunner()<CR>

let g:VimuxOrientation = "h"
let g:VimuxHeight = "33"
" setup a tmux pane to run test ( fire up a docker container )
nnoremap <Leader>vs :call VimuxRunCommand("cd ~/workspace/sapientia-web/docker-compose/saj-dev;bash ./docker-pipeline")<CR>
" Run the current file with prove
nnoremap <Leader>vp :call VimuxRunCommand("clear; prove -I /app/lib -I /app/ext-lib -I /app/t/lib -I /app/pipeline/sapientia-task/lib " . bufname("%"))<CR>
" Run the current file with prove verbose
nnoremap <Leader>vv :call VimuxRunCommand("clear; prove -v -I /app/lib -I /app/ext-lib -I /app/t/lib -I /app/pipeline/sapientia-task/lib " . bufname("%"))<CR>
" Prompt for a command to run map
nnoremap <Leader>vc :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
" Zoom vim tmux runner opened by VimuxRunCommand
nnoremap <Leader>vz :VimuxZoomRunner<CR>
" Inspect runner pane map
nnoremap <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
nnoremap <Leader>vq :VimuxCloseRunner<CR>

" Denite Mappings
" search files in current dir, use project file to populate list ( e.g git svn )
nnoremap <Leader>ff :Denite file_rec/git -buffer-name=files<CR>
" search buffers
nnoremap <Leader>fb :Denite buffer -buffer-name=buffer<CR>
" Grep current directory - uses ack
nnoremap <silent> <Leader>fg :<C-u>Denite grep -buffer-name=search-buffer<CR>
nnoremap <silent> <Leader>fr :<C-u>Denite -resume grep -buffer-name=search-buffer<CR>
nnoremap <silent> <Leader>fn :<C-u>Denite -resume grep -buffer-name=search-buffer -select=+1 -immediately<CR>
" search most recently user files
nnoremap <Leader>fm :Denite file_mru -buffer-name=mru<CR>
" Quick outline
nnoremap <silent> <Leader>fo :<C-u>Denite unite:outline -buffer-name=outline<CR>

" Nerdtree toggle
noremap <F2> :NERDTreeToggle<CR>

" Tabular
if exists(":Tabularize")
    nmap <Leader>tb :Tabularize /=><CR>
    vmap <Leader>tb :Tabularize /=><CR>
endif

"Increment / decrement remap
nnoremap <Leader>1 <C-a>
nnoremap <Leader>2 <C-x>

" make Y consistent with D and C
nnoremap Y y$

" Add folders to path
set path+=~/workspace/sapientia-web/lib
set path+=~/workspace/sapientia-web/pipeline/sapientia-task/lib

"
"PLUGINS
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Raimondi/delimitMate'
Bundle "surround.vim"
Bundle "repeat.vim"
Bundle 'tpope/vim-fugitive'
Bundle "godlygeek/tabular"
Bundle "mileszs/ack.vim"
Bundle "bling/vim-airline"
Bundle "kien/ctrlp.vim"
Bundle "spiiph/vim-space"
Bundle "Gundo"
Bundle "benmills/vimux"
Bundle "Lokaltog/vim-easymotion"
Bundle "petdance/vim-perl"
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'Shougo/denite.nvim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite-outline'
Bundle 'Shougo/neomru.vim'
"Bundle 'edkolev/tmuxline.vim' # create fancy tmux status bars
"Bundle 'edkolev/promptline.vim' # create fancy prompt lines
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Bundle 'tmhedberg/SimpylFold'
Plugin 'nvie/vim-flake8'
Plugin 'w0rp/ale'

" Syntax Files
Bundle "tpope/vim-markdown"
Bundle "wikipedia.vim"

" Colour Schemes
Bundle "altercation/vim-colors-solarized"

call vundle#end()

syntax on                       " enable syntax highlighting
filetype on                     " enable vim filetype detection
filetype plugin on
filetype indent on

" Denite
"
call denite#custom#option('default', 'short_source_names', 1)
call denite#custom#option('grep', 'empty', 0)
call denite#custom#option('grep', 'auto_highlight', 1)

highlight deniteMatched ctermfg=243 guifg=#999999
highlight deniteMatchedChar ctermfg=221 guifg=#f0c674
highlight link deniteGrepInput Constant

" add git ls as a source
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
	\ ['git', 'ls-files', '-co', '--exclude-standard'])

" Change mappings in insert mode
call denite#custom#map( 'insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map( 'insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

" Ack command on grep source
if executable('ack')
    call denite#custom#var('grep', 'command', ['ack'])
    call denite#custom#var('grep', 'default_opts',
            \ ['-H', '--nopager', '--nocolor', '--nogroup', '--column'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--match'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
endif

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

" Gundo
nnoremap <F6> :GundoToggle<CR>
" open on the right
let g:gundo_right = 1
" a little wider for wider screens
let g:gundo_width = 60

" Gist
let g:gist_detect_filetype = 1
let g:gist_post_private = 1


 " Enable tabline ( part of airline )
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#format = 1
let g:airline_section_y =''
let g:airline_section_c ='%t'

" promptline - used to create nice prompt
"let g:promptline_preset = {
        "\'a'    : [ promptline#slices#user() ],
        "\'b'    : [ promptline#slices#cwd() ],
        "\'c'    : [ promptline#slices#vcs_branch() ],
        "\'y'    : [ '$( echo "$DANCER_ENVIRONMENT \n$")' ] }

" default to GH flavoured markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" simple fold
let g:SimpylFold_docstring_preview = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>ed :edit <C-R>=expand("%:p:h") . "/"<CR>
