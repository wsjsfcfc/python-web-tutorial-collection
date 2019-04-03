syntax on
" set termguicolors
set splitbelow
set splitright
set t_Co=256
set clipboard=unnamed
set mouse=a
set modifiable
set cmdheight=2
set hlsearch
set cursorline
set foldmethod=marker
set foldlevel=99
set number
set pastetoggle=<F2>
set novisualbell
set backspace=indent,eol,start
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>
map <F1> <nop>
map <A-Right> gt
map <A-Left> gT
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>j <Plug>(easymotion-j)
map <leader><leader>h <Plug>(easymotion-linebackward)
map <leader><leader>l <Plug>(easymotion-lineforward)
map <F3> :SyntasticCheck<CR>
map <F8> :TagbarToggle<CR>
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gh  :YcmCompleter GoToDeclaration<CR>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap , :vertical resize +10<CR>
nnoremap . :vertical resize -10<CR>
nnoremap <space> za

" highlight BadWhitespace ctermbg=red guibg=darkred
colorscheme space-vim-dark
let g:space_vim_dark_background = 238
hi Comment cterm=italic
" color dracula

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.css,*.html,*.html,*.json,*.yml,*.yaml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set fileformat=unix |
    \ set autoindent

let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__', '.git/']


"12 可视化缩进
let g:indent_guides_enable_on_vim_startup = 1  " 默认关闭
let g:indent_guides_guide_size            = 1   " 指定对齐线的尺寸
let g:indent_guides_start_level 	  = 2  " 从第二层开始可视化显示缩进
let g:indent_guides_indent_levels         = 1

"ycm
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_path_to_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '/home/wby/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
set completeopt=menu,menuone
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_key_list_stop_completion = ['<CR>']
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_semantic_triggers = {'python': [ 're!\w{2}', '.', 're!from\s+\S+\s+import\s']}

"syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✖✖'
let g:syntastic_style_error_symbol = '►►'
let g:syntastic_warning_symbol = '!!'
let g:syntastic_style_warning_symbol = '≈≈'
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['flake8'] " 使用pyflakes,速度比pylint快
" highlight SyntasticErrorSign guifg=red guibg=red
let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let NERDSpaceDelims = 1
let g:indentLine_color_term = 2

"echodoc
let g:echodoc_enable_at_startup = 1

"airline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '>'
" let g:airline#extensions#tabline#formatter = 'default'

"ultisnips
" let g:UltiSnipsExpandTrigger="<leader>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:ycm_use_ultisnips_completer = 1
" let g:UltiSnipsListSnippets = "<c-g>"

call plug#begin('~/.vim/plugged')
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'shougo/echodoc'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'mfukar/robotframework-vim'
call plug#end()
