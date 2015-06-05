" Whitespace
set expandtab
set tabstop=4
set sw=4
set ts=4
set smartindent
set nowrap

" mac osx
set backspace+=indent,eol,start

" Display
set background=dark
colorscheme molokai
let g:molokai_original = 0 
set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set nofoldenable
syntax on

" Execute python file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

set t_Co=256

ab pymain if __name__ == '__main__':

" F5 Paste shortcut
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>

" Set color column to column 80 for easy code wrapping
" set colorcolumn=80
let &colorcolumn="80,".join(range(120,999),",")
hi ColorColumn ctermbg=235 guibg=#AE81FF 

" map ; to :
map ; :
" map jj to escape
imap jj 
" map :syn sync fromstart to :sfs
cmap sfs syn sync fromstart
cmap fixtabs set expandtab | set tabstop=8 | retab | set tabstop=4
" map leader from , to space
let mapleader = "\<Space>"

" Groovy
au BufNewFile,BufRead *.groovy setf groovy
if did_filetype()
  finish
endif
if getline(1) =~ '^#!.*[/\\]groovy\>'
  setf groovy
endif

" Vundle plugins:
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'pangloss/vim-javascript'
Bundle 'jQuery'
Bundle 'groovy.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'kien/ctrlp.vim'
Bundle 'atweiden/vim-dragvisuals'
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'wesQ3/vim-windowswap'
Bundle 'godlygeek/tabular'
Bundle 'jimenezrick/vimerl'
Bundle 'mattn/flappyvird-vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'Lokaltog/vim-easymotion'

filetype plugin indent on
filetype plugin on

set wildignore+=*.class,.git,.hg,.svn,**/target/classes/**,**/target/test-classes/**,**/target/test-reports/**.html,**/target/test-reports/**.xml,**/build/**

let g:ctrlp_custom_ignore = '(JS|js|markdown|iml|yaml|yml|coffee|rb|d|TXT|h|gradle|ini|el|cfg|html|html|MakeFile|xml|html5|properties|c|txt|java|py|json|pl|gsp|groovy|conf|csv|css|php)$'

" vim-dragvisuals setup
runtime bundle/vim-dragvisuals/dragvisuals.vim

vmap <expr> <LEFT>  DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN>  DVB_Drag('down')
vmap <expr> <UP>    DVB_Drag('up')
vmap <expr> D       DVB_Duplicate()

let g:DVB_TrimWS = 1

nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <leader>b :TagbarToggle<cr>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

function FixTabs()
    :set expandtab
    :set tabstop=8
    :retab
    :set tabstop=4
endfunction
cmap fixtabs call FixTabs()

" EasyMotion config stuff
let g:EasyMotion_do_mapping = 0 " Disable default mappings

map <Leader>s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" bind moves
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>
inoremap <A-k> <Esc>:m .-2<CR>
vnoremap <A-j> :m '>+1<CR>
vnoremap <A-k> :m '<-2<CR>
