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

" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType tt2 setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

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
let ruby_fold = 1
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

" Ctrlp
"noremap <Leader>b :CtrlPBuffer<CR>
"noremap <Leader>f :CtrlPCurWD<CR>

" Unite

" search files in current dir, use project file to populate list ( e.g git svn )
nnoremap <Leader>ff :Unite -buffer-name=files -start-insert file_rec/async:!<CR>
" as above but search files manually
nnoremap <Leader>fa :Unite -buffer-name=files -start-insert file_rec/async<CR>
" search buffers
nnoremap <Leader>fb :Unite -buffer-name=buffer buffer<CR>
" search most recently user files
nnoremap <Leader>fm :Unite -buffer-name=mru file_mru<CR>
" resume Unite window
nnoremap <Leader>fr :Unite -buffer-name=resume resume<CR>
" search tabs
nnoremap <Leader>ft :Unite -buffer-name=tabs -quick-match tab<CR>
" Grep current directory - uses ack
nnoremap <silent> <Leader>fg :<C-u>Unite -buffer-name=grep -vertical grep:.<CR>
" search commands
nnoremap <Leader>fc :Unite -buffer-name=commands command<CR>
" search yank history
nnoremap <Leader>fy :Unite -buffer-name=yank history/yank<CR>
" Quickly switch lcd
nnoremap <Leader>fd :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>
" Quick outline
nnoremap <silent> <Leader>fo :<C-u>Unite -buffer-name=outline -vertical outline<CR>


" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" Nerdtree toggle
noremap <F2> :NERDTreeToggle<CR>

" Tabular
if exists(":Tabularize")
    nmap <Leader>tb :Tabularize /=><CR>
    vmap <Leader>tb :Tabularize /=><CR>
endif

"Yankring
nnoremap <silent> <F10> :YRShow<CR>

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
"Bundle 'vcscommand.vim'
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
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite-outline'
Bundle 'Shougo/neomru.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'edkolev/promptline.vim'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

" Only load Ultisnips for vim version 7.4 or above
if v:version >= 704
    Bundle 'SirVer/ultisnips'
    " ultisnips
    let g:UltiSnipsUsePythonVersion = 2
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
    let g:UltiSnipsSnippetsDir="~/.vim/my_snippets"
endif

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

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_regexp'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_split_rule = "botright"
" Search using ack
if executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -w'
  let g:unite_source_grep_recursive_opt = ''
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

" Ctrl-p
let g:ctrlp_dotfiles = 1
let g:ctrlp_max_files = 3000
let g:ctrlp_max_depth = 10
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_open_multiple_files = '3vr'

" Gundo
nnoremap <F6> :GundoToggle<CR>
" open on the right
let g:gundo_right = 1
" a little wider for wider screens
let g:gundo_width = 60

" Gist
let g:gist_detect_filetype = 1
let g:gist_post_private = 1

" Vimux
 " Run the current file with prove
 map <Leader>vp :call VimuxRunCommand("clear; prove " . bufname("%"))<CR>
 " Prompt for a command to run map
 map <Leader>vc :VimuxPromptCommand<CR>
 " Run last command executed by VimuxRunCommand
 map <Leader>vl :VimuxRunLastCommand<CR>
 " Inspect runner pane map
 map <Leader>vi :VimuxInspectRunner<CR>
 " Close vim tmux runner opened by VimuxRunCommand
 map <Leader>vq :VimuxCloseRunner<CR>

 " Enable tabline ( part of airline )
let g:airline#extensions#tabline#enabled = 1

" promptline
let g:promptline_preset = {
        \'a'    : [ promptline#slices#user() ],
        \'b'    : [ promptline#slices#cwd() ],
        \'c'    : [ promptline#slices#vcs_branch() ],
        \'y'    : [ '$( echo "$DANCER_ENVIRONMENT \n$")' ] }
let g:airline#extensions#branch#format = 1
let g:airline_section_y =''
let g:airline_section_c ='%t'

" default to GH flavoured markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>ed :edit <C-R>=expand("%:p:h") . "/"<CR>
