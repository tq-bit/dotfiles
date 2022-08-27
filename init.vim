"Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set hidden
set inccommand=split
set mouse=a
set number
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Auto commands
autocmd BufEnter * lcd %:p:h

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent

" UI Rules
set ruler

" Plugins:
call plug#begin()
    " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'joshdick/onedark.vim' 
    
    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'

    " Completion / linters / formatters
    Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
    Plug 'plasticboy/vim-markdown'
    Plug 'yuezk/vim-js'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'maxmellon/vim-jsx-pretty'
    
    " Git
    Plug 'airblade/vim-gitgutter'
call plug#end()

" Appearance
syntax on
colorscheme onedark

" Nerdtree plugin args
autocmd VimEnter * NERDTree | wincmd p

"""""""""
"""CoC"""
"""""""""

" Trigger code completion with <TAB>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Switch tabs with ALT+Right/Left
nnoremap <A-Right> :tabnext<CR>
nnoremap <A-Left> :tabprevious<CR>

" Open code completion suggestions with <CTRL+Space>
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Enable CoC extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']
let g:airline#extensions#tabline#enabled = 1
