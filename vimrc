set nocompatible                                     " This must be first, because it changes other options as a side effect.

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
Bundle 'git://github.com/mileszs/ack.vim.git'
Bundle 'cucumber.zip'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'

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
set nowrap                                            " don't wrap lines

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
" Use ack for searching
let g:ackhighlight = 1
map <D-F> :Ack<space>

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t
let g:CommandTAcceptSelectionSplitMap='<C-w>'

" Map Command-T to Command-T
map <D-t> :CommandT<CR>
imap <D-t> <Esc>:CommandT<CR>

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Filetypes
filetype off                                          " forces reload
filetype plugin indent on                             " enable filetype plugin

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

" Use cursor keys to navigate buffers.
map  <Right> :bnext<CR>
map  <Left>  :bprev<CR>
imap <Right> <ESC>:bnext<CR>
imap <Left>  <ESC>:bprev<CR>
map  <Del>   :bd<CR>

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

" .vimrc editing
nmap <leader>v :tabedit $MYVIMRC<CR>
" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
