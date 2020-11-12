set clipboard=unnamedplus

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'haya14busa/is.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

let g:python3_host_prog='/usr/local/bin/python3'
let g:highlightedyank_highlight_duration = 250
" highlight HighlightedyankRegion cterm=white guibg=white
" copy relative path
nmap cr :let @+ = expand("%p")<cr>
" copy full path
nmap cp :let @+ = expand("%:p")<cr>
" copy file name
nmap cf :let @+ = expand("%:t")<cr>
" g Leader key
let mapleader=" "
nnoremap <Space> <Nop>

vmap y ygv<Esc>

nnoremap <silent> <M-e> :call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
xnoremap <silent> <M-e> :call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>


" Markdown Prview
let g:mkdp_markdown_css = '~/.config/nvim/github-markdown.css'
