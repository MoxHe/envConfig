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
set clipboard=unnamedplus
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
" trailing space is on purpose for the next line
set fcs=eob:\ 

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
" Plug 'dyng/ctrlsf.vim'
Plug 'djoshea/vim-autoread'
Plug 'mhinz/vim-startify'
Plug 'alvan/vim-closetag'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

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
let g:tex_flavor = 'latex'

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
let g:indentLine_fileType = ['javascript', 'java', 'typescript', 'javascriptreact', 'json', 'yaml', 'typescriptreact', 'zsh', 'vim', 'html', 'python', 'c']
let g:highlightedyank_highlight_duration = 250
let g:javascript_plugin_jsdoc = 1

" let java_highlight_functions = 1
let java_highlight_all = 1

" copy relative path
nmap cr :let @+ = expand("%p")<cr>
" copy full path
nmap cp :let @+ = expand("%:p")<cr>
" copy file name
nmap cf :let @+ = expand("%:t")<cr>
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

let g:coc_global_extensions = [
      \ 'coc-clangd',
      \ 'coc-docthis',
      \ 'coc-vimtex',
      \ 'coc-pairs',
      \ 'coc-java',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-yaml',
      \ 'coc-highlight',
      \ 'coc-vimlsp',
      \ 'coc-xml',
      \ 'coc-explorer',
      \ 'coc-prettier',
      \ 'coc-tsserver',
      \ 'coc-sh',
      \ 'coc-pyright'
      \ ]


" Coc Explorer
nmap <silent> <M-e> :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | set guicursor=a:ver25 | q | endif

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


  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
  inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" " navigate pop up with <C-j> and <C-k>
  inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
  inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
  inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
  inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
  inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0) : "\<down>"
  inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(0) : "\<up>"

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

xmap <leader>m  :s#[\-_]\([0-1a-zA-Z]\)#\u\1#g<CR>
nmap <leader>m  :s#[\-_]\([0-1a-zA-Z]\)#\u\1#g<CR>

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
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize +2<CR>
nnoremap <silent> <M-k>    :resize -2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>
nnoremap <C-w>h <C-w>s

nnoremap <leader>fn :FZF<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles --cache --others --exclude-standard<CR>
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



" closeTag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx,*js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,*js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Markdown Prview
let g:mkdp_markdown_css = '~/.config/nvim/github-markdown.css'
