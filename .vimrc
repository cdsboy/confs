" Whitespace
set expandtab
set tabstop=2
set sw=2
set ts=2
set smartindent
set nowrap
filetype plugin indent on

" Display
set background=dark
colorscheme molokai
let g:molokai_original = 0 
set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set nofoldenable

" Execute python file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

set t_Co=256

ab pymain if __name__ == '__main__':

" F5 Paste shortcut
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>

" add jquery syntax highlighting
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Set color column to column 80 for easy code wrapping
set colorcolumn=80
" hi ColorColumn ctermbg=#AE81FF guibg=#AE81FF 