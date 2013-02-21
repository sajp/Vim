set nocompatible               " be iMproved
filetype off                   " required for Vundle, turn on later

set nu                          " set line numbers
set smartcase
set scrolloff=10
set wildmode=longest,list
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

" default printer
set pdev=g322pc

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
autocmd BufRead,BufNewFile *.pl,*.plx,*.pm command! -range=% -nargs=* Tidy <line1>,<line2>!perltidy -pbp -l=100
autocmd BufRead,BufNewFile *.pl,*.plx,*.pm noremap <F5> :Tidy<CR>

" folding
let perl_fold = 1
let ruby_fold = 1
set foldcolumn=0
set foldlevelstart=1
nnoremap <silent> <Leader>z za

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
noremap j gj
noremap k gk

" function movements
map [[ ?{<CR>w99[{ 
map ][ /}<CR>b99]} 
map ]] j0[[%/{<CR> 
map [] k$][%?}<CR> 

" Ctrlp
noremap <Leader>b :CtrlPBuffer<CR>
noremap <Leader>f :CtrlPCurWD<CR>

" Toggle Syntastic
noremap <F4> :SyntasticToggleMode<CR>

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
set path+=~/workspace/LIMS2-Webapp/lib
set path+=~/workspace/LIMS2-Exception/lib
set path+=~/workspace/Eng-Seq-Builder/lib
set path+=~/workspace/LIMS2-Utils/lib
set path+=~/workspace/LIMS2-Tasks/lib
set path+=~/workspace/htgt/lib
set path+=~/workspace/htgt-qc/lib

"
"PLUGINS
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'
Bundle 'vcscommand.vim'
Bundle "surround.vim"
Bundle "repeat.vim"
Bundle 'tpope/vim-fugitive'
Bundle "godlygeek/tabular"
Bundle "mileszs/ack.vim"
Bundle "Lokaltog/vim-powerline"
Bundle "kien/ctrlp.vim"
Bundle "spiiph/vim-space"
Bundle "Gundo"
"Bundle "benmills/vimux"
Bundle "Lokaltog/vim-easymotion"
Bundle "petdance/vim-perl"
Bundle "YankRing.vim"
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

" Syntax Files
Bundle "tpope/vim-markdown"
Bundle "wikipedia.vim"

" Colour Schemes
Bundle "altercation/vim-colors-solarized"

" snipmate plus dependencies:
Bundle "git://github.com/MarcWeber/vim-addon-mw-utils.git"
Bundle "git://github.com/tomtom/tlib_vim.git"
Bundle "git://github.com/honza/snipmate-snippets.git"
Bundle "git://github.com/garbas/vim-snipmate.git"

syntax on                       " enable syntax highlighting
filetype on                     " enable vim filetype detection
filetype plugin on
filetype indent on

" stop snipmate overiding delimimate shift tab behaviour
imap <S-Tab> <Plug>delimitMateS-Tab

" NERDTree
let NERDTreeShowBookmarks=1                  " Show the bookmarks table on startup
let NERDTreeQuitOnOpen=1                     " Close nerd tree after opening a file

" Syntastic
set statusline+=%#warningmsg#                " Set statusline
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1               " Use sign interface to mark errors
let g:syntastic_auto_loc_list=1              " Error window auto closes when no errors, also auto opens when errors found

" delimitMate Setup
let delimitMate_expand_space = 1             " expand <space> inside empty delimiters
let delimitMate_expand_cr = 1                " expand <cr> inside empty delimiters

" vcscommand
let g:VCSCommandMapPrefix='<Leader>x'        " because Nerdcommenter users <Leader>c as well

" Powerline
let g:Powerline_symbols="unicode"

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

" Yankring
let yankring_min_element_lenth=2

" Gist
let g:gist_detect_filetype = 1
let g:gist_post_private = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>rn :call RenameFile()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>ed :edit <C-R>=expand("%:p:h") . "/"<CR>
