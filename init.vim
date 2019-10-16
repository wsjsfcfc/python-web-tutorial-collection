syntax on
set guifont=Source_Code_Pro
" filetype plugin on
syntax enable
set termguicolors
set splitbelow
set splitright
set t_Co=256
set clipboard=unnamed
set mouse=a
set modifiable
set hlsearch
set cursorline
" set foldmethod=marker
" set foldlevel=99
set number
" set pastetoggle=<F2>
set novisualbell
set backspace=indent,eol,start
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
map <A-Right> gt
map <A-Left> gT
nnoremap <F2> :Yapf --style facebook<cr>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>
map <F1> :CocCommand python.execInTerminal<CR>
map <F3> :SyntasticCheck<CR>
map <F8> :TagbarToggle<CR>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap , :vertical resize +10<CR>
nnoremap . :vertical resize -10<CR>
" nnoremap t :NERDTreeToggle<CR><C-W>W<CR>
nnoremap t :NERDTreeToggle<CR>
let g:NERDTreeWinSize=20

set rtp+=$GOROOT/misc/vim
filetype plugin indent on

" highlight BadWhitespace ctermbg=red guibg=darkred
" let g:space_vim_dark_background = 234
" colorscheme space-vim-dark
" colorscheme hybrid 
colorscheme gruvbox
" colorscheme solarized8

au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=100 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix

set tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.js,*.css,*.html,*.html,*.json,*.yml,*.yaml,*.tf,*.robot
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2 |
  \ set expandtab |
  \ set fileformat=unix |
  \ set autoindent
set list lcs=tab:\|\ 

let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__', '.git/', '\.tfstate*', '\.plan']

"12 可视化缩进
let g:indent_guides_enable_on_vim_startup = 1  " 默认关闭
let g:indent_guides_guide_size            = 1   " 指定对齐线的尺寸
let g:indent_guides_start_level		  = 2  " 从第二层开始可视化显示缩进
let g:indentLine_color_term               = 2
let g:indent_guides_indent_levels         = 1

" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✖✖'
let g:syntastic_warning_symbol = '!!'
let g:syntastic_style_error_symbol = 'SX'
let g:syntastic_style_warning_symbol = 'S!'
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
" highlight SyntasticErrorSign guifg=red guibg=red
let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let NERDSpaceDelims = 1

"airline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#checks = [ 'mixed-indent-file' ]
let g:airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj:'
let g:semshi#error_sign = 0
let g:terraform_fmt_on_save=1
let g:terraform_align=1
let g:terraform_fold_sections=1
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
	\ }
set nocompatible


call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython.vim'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'hashivim/vim-terraform'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'mfukar/robotframework-vim'
Plug 'mindriot101/vim-yapf'
call plug#end()
