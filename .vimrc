" Whitespace
set expandtab
set tabstop=4
set sw=4
set ts=4
set smartindent
set nowrap

nmap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" mac osx
set backspace+=indent,eol,start

" Display
set background=dark
set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set nofoldenable
syntax on

set t_Co=256

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

" Vundle plugins:
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jQuery'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'wesQ3/vim-windowswap'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mxw/vim-jsx'
Plugin 'vim-python/python-syntax'
Plugin 'chrisbra/csv.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'arcticicestudio/nord-vim'

call vundle#end()

let g:javascript_enable_domhtmlcss = 1

filetype plugin indent on

colorscheme nord
let g:airline_powerline_fonts = 1

set wildignore+=*.class,.git,.hg,.svn,**/target/classes/**,**/target/test-classes/**,**/target/test-reports/**.html,**/target/test-reports/**.xml,**/build/**
let g:ctrlp_custom_ignore = '(JS|js|markdown|iml|yaml|yml|coffee|rb|d|TXT|h|gradle|ini|el|cfg|html|html|MakeFile|xml|html5|properties|c|txt|java|py|json|pl|gsp|groovy|conf|csv|css|php)$'

nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <leader>b :TagbarToggle<cr>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

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

" EasyMotion config stuff
let g:EasyMotion_do_mapping = 0 " Disable default mappings

map <Leader>s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
