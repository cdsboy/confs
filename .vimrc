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
set colorcolumn=80
" hi ColorColumn ctermbg=#AE81FF guibg=#AE81FF 

" map ; to :
map ; :
" map jj to escape
imap jj 
" map :syn sync fromstart to :sfs
cmap sfs syn sync fromstart

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
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'derekwyatt/vim-scala'

filetype plugin indent on
