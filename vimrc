" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/AutoClose'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'edsono/vim-matchit'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rails.vim'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'bufexplorer.zip'

let mapleader = ","                                   " , is the leader character 

" Editing
set autowrite autoindent
set expandtab tabstop=2 softtabstop=2 shiftwidth=2    " use spaces instead of tabs
set number                                            " print the line number in front of each line
set formatoptions+=tcrqw fo-=o
set showmatch matchtime=5                             " show matching brackets
set whichwrap=<,>,h,l                                 " wrap to next/previous line when navigating
set cursorline                                        " highlight current line
set nofoldenable
set backspace=indent,eol,start                        " allow backspacing over everything in insert mode
set history=50                                        " keep 50 lines of command line history
set ruler                                             " show the cursor position all the time
set showcmd                                           " display incomplete commands

" Don't backup files as everything is in git
set nobackup
set nowritebackup
set noswapfile

" Store .swp files in /var/tmp with mangled names
set directory=/var/tmp//

" Searching
set incsearch                                         " incremental searching
set hlsearch                                          " highlight searching
nmap <silent> ,h <Esc>:set invhls<CR>:set hls?<CR>    " toggle highlight search
set ignorecase smartcase                              " case only matters with mixed case expressions

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t
let g:CommandTAcceptSelectionSplitMap='<C-w>'

" Filetypes
filetype off                                          " forces reload
filetype plugin indent on                             " enable filetype plugin

" Learn vim movement properly by disabling arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Windows
nmap <C-N> <C-W>w                                     " Ctrl-n : next window
nmap <C-P> <C-W>W                                     " Ctrl-p : previous window
nmap <Leader>n <C-W>w                                 " ,n     : next window
nmap <Leader>p <C-W>W                                 " ,p     : previous window
nmap <Leader>H <C-W>H                                 " ,H     : move the current window to the left
nmap <Leader>J <C-W>J                                 " ,J     : move the current window to the bottom
nmap <Leader>K <C-W>K                                 " ,K     : move the current window to the top
nmap <Leader>L <C-W>L                                 " ,L     : move the current window to the right
nmap <Leader>= <C-W>=                                 " ,=     : make all windows the same size
nmap <Leader>T <C-W>T                                 " ,T     : move current window to new tab
nmap <Leader>r <C-W>r                                 " ,r     : rotate windows down/right
nmap <Leader>R <C-W>R                                 " ,R     : rotate windows up/left
set hidden                                            " enable unsaved buffers
set equalalways                                       " resize windows to equal size when splitting/closing
set splitbelow splitright                             " split windows below on to the right
set mouse=a                                           " enable the mouse

" Buffers - explore/next/previous/close: Alt-Tab, CMD-k, CMD-j, Alt-q.
nnoremap <silent> <A-Tab> :BufExplorer<CR>
nnoremap <silent> <D-k> :bnext<CR>
nnoremap <silent> <D-j> :bprevious<CR>
nnoremap <silent> <A-q> :bd<CR>

" Map Ctrl-s to write current buffer
map <C-s> :w<CR>
imap <C-s> <C-O><C-s>
imap <C-s> <Esc><C-s>

" NERD-Tree
nmap <Leader>f :NERDTreeToggle<CR>                    " ,f     : toggle NERDTree

" Let %% expands to directory of %
cabbr <expr> %% expand('%:h')

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Always display the status line
set laststatus=2

" Leader shortcuts for Rails commands
map <Leader>rm :Rmodel
map <Leader>rc :Rcontroller
map <Leader>rv :Rview
map <Leader>ru :Runittest
map <Leader>rf :Rfunctionaltest
map <Leader>tm :RTmodel
map <Leader>tc :RTcontroller
map <Leader>tv :RTview
map <Leader>tu :RTunittest
map <Leader>tf :RTfunctionaltest
map <Leader>sm :RSmodel
map <Leader>sc :RScontroller
map <Leader>sv :RSview
map <Leader>su :RSunittest
map <Leader>sf :RSfunctionaltest

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" For Haml
au! BufRead,BufNewFile *.haml         setfiletype haml

" Maps autocomplete to tab
imap <Tab> <C-N>

" Use TextMate's keymappings for tabbing, CMD-] and CMD-[
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Ctrl-l to type HashRocket in Ruby
imap <C-L> <Space>=><Space>

" Display extra whitespace
set list listchars=tab:»·,trail:·
" show whitespace at the end of lines
highlight WhitespaceEOL ctermbg=blue guibg=blue
match WhitespaceEOL /\s\+$/

" Edit routes
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

" Color scheme
syntax on
colorscheme solarized
set background="dark"
:so ~/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim

" Style
highlight CursorLine cterm=bold
highlight MatchParen cterm=none ctermbg=none ctermfg=yellow
