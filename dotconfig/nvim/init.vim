call plug#begin(stdpath('data') . '/plugged')

" File Browsing/Management
Plug 'kien/ctrlp.vim'
Plug 'tpop/vim-fugitive'
Plug 'preservim/nerdtree'

" Look & Feel
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'

" Language Support
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'evanleck/vim-svelte'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ryanoasis/vim-devicons'

call plug#end()

" Look

set number
set nowrap

let &colorcolumn="80,".join(range(120,999),",")
let &colorcolumn="80,".join(range(120,999),",")

colorscheme nord

let g:airline_powerline_fonts = 1

set encoding=UTF-8

" Feel

set expandtab
set ts=4 sw=4
set smartindent

nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>

map ; :
imap jj 
let mapleader = "\<Space>"

nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <leader>b :TagbarToggle<cr>
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']

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

cmap sfs syn sync fromstart

set wildignore+=*.class,.git,.hg,.svn,**/target/classes/**,**/target/test-classes/**,**/target/test-reports/**.html,**/target/test-reports/**.xml,**/build/**

" Language Support

let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_required = 0
filetype plugin indent on

" CoC
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

set statusline^=%{coc#status()}

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
