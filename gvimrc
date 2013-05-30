if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
  set antialias                   " MacVim: smooth fonts.
  set encoding=utf-8              " MacVim: use UTF-8 everywhere.
endif

set guifont=Inconsolata\ for\ Powerline:h13       " Decent font.
