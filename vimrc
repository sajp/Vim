set nocompatible               " be iMproved
filetype off                   " required for Vundle, turn on later

set nu                          " set line numbers
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
nnoremap <Leader>ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nnoremap <Leader>sv :so $MYVIMRC<cr>

" Set the status line the way i like it
set stl=%f\ %m\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\
" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" highlight searching
set hlsearch
nnoremap <Leader>a :nohls<CR>

" Tabs / Indents
set autoindent                  " indent at the same level of the previous line
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent

" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" auto complete options for [Ctrl]-n and [Ctrl]-p
set complete=.,w,b,t

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" color scheme
colorscheme Mustang

" perltidy
autocmd BufRead,BufNewFile *.pl,*.plx,*.pm command! -range=% -nargs=* Tidy <line1>,<line2>!perltidy -pbp -l=100
autocmd BufRead,BufNewFile *.pl,*.plx,*.pm noremap <F5> :Tidy<CR>

" folding
let perl_fold = 1
let ruby_fold = 1
set foldcolumn=0
set foldlevelstart=1
nnoremap <silent> <Leader>z za

" mappings
" insert newline and leave insert mode
noremap <Leader>o o<Esc>

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

" Maps for tab navigation
noremap <silent> <Leader>n :tabnext<CR>
noremap <silent> <Leader>p :tabprev<CR>

" swap ; and : around
nnoremap ; :
nnoremap : ;

imap jj <esc>


"PLUGINS
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
" snipmate plus dependencies:
Bundle "git://github.com/MarcWeber/vim-addon-mw-utils.git"
Bundle "git://github.com/tomtom/tlib_vim.git"
Bundle "git://github.com/honza/snipmate-snippets.git"
Bundle "git://github.com/garbas/vim-snipmate.git"

syntax on                       " enable syntax highlighting
filetype on                     " enable vim filetype detection
filetype plugin on
filetype indent on

" Nerdtree toggle
noremap <F2> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1     " Show the bookmarks table on startup

" Syntastic
set statusline+=%#warningmsg#                " Set statusline 
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*                           
let g:syntastic_enable_signs=1               " Use sign interface to mark errors
let g:syntastic_auto_loc_list=1              " Error window auto closes when no errors, also auto opens when errors found

" delimitMate Setup
let delimitMate_expand_space = 1            " expand <space> inside empty delimiters
let delimitMate_expand_cr = 1               " expand <cr> inside empty delimiters
" stop snipmate overiding delimimate shift tab behaviour
imap <S-Tab> <Plug>delimitMateS-Tab

" vcscommand
let g:VCSCommandMapPrefix='<Leader>x' " because Nerdcommenter users <Leader>c as well

