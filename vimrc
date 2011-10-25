set nocompatible               " be iMproved
filetype off                   " required for Vundle, turn on later

set nu                          " set line numbers
set incsearch
set ignorecase                  " Ignore case when searching
set smartcase
set scrolloff=4
set wildmode=longest,list

set cpoptions+=$                " Show $ sign when changing
set mouse=a
set history=1000                " how many lines of history to remember
set showmode
" Set text wrapping toggles
nmap  <Leader>w :set invwrap<CR>:set wrap?<CR>
" give me more colours
set term=xterm-256color

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> <Leader>ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> <Leader>sv :so $MYVIMRC<cr>

" Set the status line the way i like it
set stl=%f\ %m\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Tabs / Indents
set autoindent                  " indent at the same level of the previous line
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent

" auto complete options for [Ctrl]-n and [Ctrl]-p
set complete=.,w,b,t

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" perltidy
autocmd BufRead,BufNewFile *.pl,*.plx,*.pm command! -range=% -nargs=* Tidy <line1>,<line2>!perltidy -pbp -l=100
autocmd BufRead,BufNewFile *.pl,*.plx,*.pm noremap <F5> :Tidy<CR>

" mappings
" insert newline and leave insert mode
map <F8> o<Esc>
" indent line
map <Tab> >>
" outdent line
map <S-Tab> <<

" Maps to make handling windows a bit easier
noremap <silent> <Leader>h :wincmd h<CR>
noremap <silent> <Leader>j :wincmd j<CR>
noremap <silent> <Leader>k :wincmd k<CR>
noremap <silent> <Leader>l :wincmd l<CR>
noremap <silent> <Leader>ml <C-W>L
noremap <silent> <Leader>mk <C-W>K
noremap <silent> <Leader>mh <C-W>H
noremap <silent> <Leader>mj <C-W>J

" Alright... let's try this out
imap jj <esc>

"PLUGINS
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'vcscommand.vim'

syntax on                       " enable syntax highlighting
filetype on                     " enable vim filetype detection
filetype plugin on
filetype indent on

" Nerdtree toggle
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1     " Show the bookmarks table on startup

" Syntastic
set statusline+=%#warningmsg#                " Set statusline 
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*                           
let g:syntastic_enable_signs=1               " Use sign interface to mark errors
let g:syntastic_auto_loc_list=1              " Error window auto closes when no errors, also auto opens when errors found

" delimitMate Setup
let delimitMate_expand_space = 1            " expand <space> inside empty delimiters
let delimitMate_expand_cr = 1                " expand <cr> inside empty delimiters

