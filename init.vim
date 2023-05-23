let g:plugged_home = '~/.config/nvim'
let g:R_path = '/usr/bin/'
let g:R_assign = 1
let R_auto_omni = 0
"let g:mapleader = '\'

call plug#begin(g:plugged_home)
	Plug 'JuliaEditorSupport/julia-vim' "julia support	

	Plug 'roxma/nvim-yarp'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
	Plug 'hrsh7th/nvim-cmp'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    " main one

	"UTILITIES:
    " Language client
    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf'
    "VIM SNIPPETS:
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

	"PYTHON RELATED PLUGS:
	Plug 'Vimjas/vim-python-pep8-indent'  "better indenting for python
	Plug 'tweekmonster/impsort.vim'  " color and sort imports
"	Plug 'ncm2/ncm2'  " awesome autocomplete plugin
	Plug 'Townk/vim-autoclose' " Automatically close parenthesis, etc
	Plug 'jeetsukumaran/vim-indentwise' " Indentation based movements
	Plug 'bfredl/nvim-ipy'
    Plug 'lukas-reineke/indent-blankline.nvim'

	"R RELATED PLUGS:
"	Plug 'gaalcaras/ncm-R'
	Plug 'jalvesaq/colorout' " R syntax highlighting
	Plug 'jalvesaq/Nvim-R' "R support
	Plug 'gaalcaras/ncm-R'
    Plug 'jalvesaq/cmp-nvim-r' 
	Plug 'jalvesaq/R-Vim-runtime'
    Plug 'neovim/nvim-lspconfig'
    Plug 'jalvesaq/cmp-nvim-r'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

	"THEMES:
	Plug 'morhetz/gruvbox'
	Plug 'betoissues/contrastneed-theme'
	Plug 'elliothatch/burgundy.vim'
	Plug 'yassinebridi/vim-purpura'
	Plug 'ayu-theme/ayu-vim'
	Plug 'ku-s-h/summerfruit256.vim'
	Plug 'Mofiqul/dracula.nvim'
    
	" Required for vim 8
    Plug 'roxma/vim-hug-neovim-rpc'
    " Install this plugin
  "  Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }


       " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'


call plug#end()
 " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect


:colorscheme burgundy
:set number
:set relativenumber
:set clipboard+=unnamedplus "Yanking between windows
:set shiftwidth=4 "Intendentation
:tnoremap <C-n> <C-\><C-n>

" Python 
syntax on                       "syntax highlighting, see :help syntax
filetype plugin indent on       "file type detection, see :help filetype
set number                      "display line number
set relativenumber              "display relative line numbers
set path+=**                    "improves searching, see :help path
set noswapfile                  "disable use of swap files
"set wildmenu                    "completion menu
set backspace=indent,eol,start  "ensure proper backspace functionality
set undodir=~/.cache/nvim/undo  "undo ability will persist after exiting file
set undofile                    "see :help undodir and :help undofile
set incsearch                   "see results while search is being typed, see :help incsearch
set smartindent                 "auto indent on new lines, see :help smartindent
set ic                          "ignore case when searching
"set colorcolumn=80              "display color when line reaches pep8 standards
set expandtab                   "expanding tab to spaces
set tabstop=4                   "setting tab to 4 columns
set shiftwidth=4                "setting tab to 4 columns
set softtabstop=4               "setting tab to 4 columns
set showmatch                   "display matching bracket or parenthesis
set hlsearch incsearch          "highlight all pervious search pattern with incsearch

highlight ColorColumn ctermbg=9 "display ugly bright red bar at color column number

" Keybind Ctrl+l to clear search
nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

" When python filetype is detected, F5 can be used to execute script 
autocmd FileType python nnoremap <buffer> <F5> :w<cr>:exec '!clear'<cr>:exec '!python3' shellescape(expand('%:p'), 1)<cr>
let R_auto_omni = ["r",  "rmd", "rnoweb", "rhelp", "rrst"]
