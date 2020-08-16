syntax on
syntax enable
set number
set relativenumber
set noerrorbells
set expandtab
set smartindent
set tabstop=2 softtabstop=2
set shiftwidth=2
set cmdheight=1
set background=dark
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set nowritebackup
set hlsearch
set noshowmatch
set incsearch
set scrolloff=15
set updatetime=300
set shortmess+=c
set wildmenu
set termguicolors
set clipboard=unnamed
set cursorline
set hidden
set list
set ruler
set signcolumn=yes
set rtp+=/usr/local/opt/fzf
set noequalalways
set mouse=nv
set guicursor=n-v-c-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20
set autoread

call plug#begin('~/.config/nvim/plugged')

" Plug 'gruvbox-community/gruvbox'
Plug 'MoxHe/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sickill/vim-monokai'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'sainnhe/gruvbox-material'
" Plug 'lilydjwg/colorizer'
Plug 'haya14busa/is.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'djoshea/vim-autoread'
Plug 'mhinz/vim-startify'
" Plug 'jremmen/vim-ripgrep'

call plug#end()
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_palette = 'original'
" let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_transparent_background = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_invert_selection = 0
let g:gruvbox_italicize_comments = 1
let g:gruvbox_underline = 1
let g:gruvbox_sign_column = 'none'

:au VimLeave * set guicursor=a:ver25

colorscheme gruvbox

hi! signcolumn ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE

hi DiffAdd      gui=none    guifg=NONE          guibg=#4e533b
hi DiffChange   gui=none    guifg=NONE          guibg=#305863
hi DiffDelete   gui=none    guifg=NONE          guibg=#571319
hi DiffText     gui=bold    guifg=NONE          guibg=#1e3940

let g:python3_host_prog='/usr/local/bin/python3'
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:indentLine_char_list = ['⎸']
let g:indentLine_fileType = ['javascript', 'typescript', 'javascriptreact', 'json', 'yaml', 'typescriptreact']
let g:highlightedyank_highlight_duration = 250
let g:javascript_plugin_jsdoc = 1


" g Leader key
let mapleader=" "
nnoremap <Space> <Nop>

noremap <silent> <C-n> :bn<CR>
noremap <silent> <C-p> :bp<CR>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <M-BS> <C-W>
vmap y ygv<Esc>

" noremap c "_c
" noremap C "_C
" noremap cc "_cc

" noremap x "_x
" noremap X "_X


" " nerdtree configs
" " close nerdtree when automatically when no buff
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " limit nerdtree syntax highlight to improve performance
" let g:NERDTreeLimitedSyntax = 1
" " get rid of press ? for help at the top
" let NERDTreeMinimalUI=1
" " set nerd tree line number
" let NERDTreeShowLineNumbers=1

" let g:NERDTreeMapJumpNextSibling="☻"
" let g:NERDTreeMapJumpPrevSibling="☺"

" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "M",
"     \ "Staged"    : "S",
"     \ "Untracked" : "?",
"     \ "Renamed"   : "R",
"     \ "Unmerged"  : "U",
"     \ "Deleted"   : "D",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '!',
"     \ "Unknown"   : " "
"     \ }

" " check if nerdtree is open
" function! s:isNERDTreeOpen()
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" " calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
" function! s:syncTree()
"   if &modifiable && s:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff && bufname('%') !~# 'NERD_tree'
"     try
"       NERDTreeFind
"       if bufname('%') =~# 'NERD_tree'
"         wincmd p
"       endif
"     endtry
"   endif
" endfunction

" autocmd BufEnter * silent! call s:syncTree()

" nmap <silent> <M-n> :call CustomizedNERDTreeToggle()<cr>

" function! CustomizedNERDTreeToggle()
"   " If NERDTree is open in the current buffer
"   if (s:isNERDTreeOpen())
"     exe ":NERDTreeClose"
"   else
"     exe ":NERDTreeFind"
"   endif
" endfunction
"
let g:coc_global_extensions = [
\ 'coc-eslint',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml',
\ 'coc-highlight',
\ 'coc-pairs',
\ 'coc-vimlsp',
\ 'coc-xml',
\ 'coc-explorer',
\ 'coc-prettier',
\ 'coc-python',
\ 'coc-tsserver',
\ 'coc-sh'
\ ]


" Coc Explorer
nmap <silent> <M-n> :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


noremap <silent> <C-c> <Esc>
cnoremap <C-c> <Esc>
nnoremap r<C-c> <Nop>

inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <M-f> <Esc>wi
inoremap <M-b> <Esc>bi

" Map option-Backspace to delete the previous word in insert mode.
imap <M-BS> <C-W>

vnoremap < <gv
vnoremap > >gv
noremap Y y$

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
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

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" add an additional line in () or [] or so on
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize +2<CR>
nnoremap <silent> <M-k>    :resize -2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>
nnoremap <C-w>h <C-w>s

nnoremap <leader>fn :FZF<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles --cache --others<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>fr :Rg<CR>
" nnoremap <leader>fc :GGrep<CR>

let g:fzf_colors = {
      \ 'fg':      ['fg', 'GruvboxFg1'],
      \ 'bg':      ['fg', 'none'],
      \ 'hl':      ['fg', 'GruvboxYellow'],
      \ 'fg+':     ['fg', 'GruvboxFg1'],
      \ 'bg+':     ['fg', 'none'],
      \ 'hl+':     ['fg', 'GruvboxYellow'],
      \ 'info':    ['fg', 'GruvboxBlue'],
      \ 'prompt':  ['fg', 'GruvboxFg4'],
      \ 'pointer': ['fg', 'GruvboxBlue'],
      \ 'marker':  ['fg', 'GruvboxOrange'],
      \ 'spinner': ['fg', 'GruvboxYellow'],
      \ 'header':  ['fg', 'GruvboxBg3']
      \ }
"
let g:fzf_preview ='--color=always'
let g:fzf_preview_window = 'right:60%'

" This is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }
let g:fzf_layout = { 'down': '30%' }
let g:fzf_prefer_tmux = 1

" command! -bang -nargs=* GGrep
"   \ call fzf#vim#grep(
"   \   'git grep --line-number --color --break -- '.shellescape(<q-args>), 0,
"   \   fzf#vim#with_preview({'options': '--no-sort --no-extended --exact --layout=reverse  --delimiter : --nth 2..', 'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
"
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg   --no-heading --sort path --hidden --line-number --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--no-sort --no-extended --exact --layout=reverse  --delimiter : --nth 2..', 'down': '100%'}), <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options':['--tiebreak=end']}), <bang>0)

command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'options': '--tiebreak=end'}), <bang>0)

command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({'options': ['--tiebreak=end']}), <bang>0)

" Git Gutter
highlight GitGutterAdd    guifg=#008000 ctermfg=green
highlight GitGutterChange guifg=#00809e ctermfg=blue
highlight GitGutterDelete guifg=#ff0000 ctermfg=red
" let g:gitgutter_set_sign_backgrounds = 1
" highlight clear SignColumn
let g:gitgutter_map_keys = 0
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#branch#enabled = 1
" vim repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" Fugitive

function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        " vertical Gstatus | vertical resize 53
        below Gstatus | resize -10

    endif
endfunction

  " let s:gStatusOepn = 0
  " for l:winnr in range(1, winnr('$'))
  "   if !empty(getwinvar(l:winnr, 'fugitive_status'))
  "     echo 'Gstaus'
  "     s:gStatusOepn = 1
  "   endif
  " endfor
  " if s:gStatusOepn == 0
  "   wincmd=
  " endif

function! EqualWindow()
  if !buflisted(bufname('.git/index'))
    wincmd =
  endif
endfunction

autocmd BufEnter * silent! call s:EqualWindow()
autocmd BufLeave * silent! call s:EqualWindow()

nmap <silent> <M-s> :call ToggleGStatus()<CR>

" ctrlFS
" let g:ctrlsf_auto_preview = 1
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

nmap     <M-f>f :CtrlSF ''<left>
vmap     <M-f>f <Plug>CtrlSFVwordPath
vmap     <M-f>F <Plug>CtrlSFVwordExec
nmap     <M-f>n <Plug>CtrlSFCwordPath
nmap     <M-f>p <Plug>CtrlSFPwordPath
nnoremap <M-f>o :CtrlSFOpen<CR>
nnoremap <M-f>t :CtrlSFToggle<CR>
inoremap <M-f>t <Esc>:CtrlSFToggle<CR>
