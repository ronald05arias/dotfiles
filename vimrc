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

" \ is the leader character
let mapleader = ","

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
set nobackup
set nowritebackup
set history=50                                        " keep 50 lines of command line history
set ruler		                                          " show the cursor position all the time
set showcmd		                                        " display incomplete commands

" Map <c-s> to write current buffer
map <c-s> :w<cr>
imap <c-s> <c-o><c-s>
imap <c-s> <esc><c-s>

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

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
filetype off " forces reload
filetype plugin indent on

" Windows
nmap <C-N> <C-W>w
nmap <C-P> <C-W>W
nmap ,n <C-W>w
nmap ,p <C-W>W
nmap ,H <C-W>H
nmap ,J <C-W>J
nmap ,K <C-W>K
nmap ,L <C-W>L
nmap ,= <C-W>=
nmap ,T <C-W>T
nmap ,r <C-W>r
nmap ,R <C-W>R
set hidden
set equalalways
set splitbelow splitright
set mouse=a

" NERD-Tree
nmap <Leader>f :NERDTreeToggle<CR>

" Let %% expands to directory of %
cabbr <expr> %% expand('%:h')

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Always display the status line
set laststatus=2

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
map <Leader>u :Runittest 
map <Leader>f :Rfunctionaltest 
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

imap <C-L> <Space>=><Space>

" Display extra whitespace
" set list listchars=tab:»·,trail:·
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
:so ~/vimfiles/vim/bundle/vim-colors-solarized/autoload/togglebg.vim

" Style
highlight CursorLine cterm=bold
highlight MatchParen cterm=none ctermbg=none ctermfg=yellow