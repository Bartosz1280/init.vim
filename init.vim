let g:plugged_home = '~/.config/nvim'
let g:R_path = '/usr/bin/R'
let g:R_assign = 1
let R_auto_omni = 0
"let g:mapleader = '\'

call plug#begin(g:plugged_home)
	Plug 'JuliaEditorSupport/julia-vim' "julia support	
	Plug 'vim-airline/vim-airline' "info bars
	Plug 'andrewferrier/textobj-diagnostic.nvim'
	Plug 'iamcco/markdown-preview.nvim' "markdown support
	Plug 'ncm2/ncm2'
	Plug 'norcalli/nvim-colorizer.lua'	
	Plug 'roxma/nvim-yarp'
	Plug 'hrsh7th/nvim-cmp'
	"UTILITIES:
	Plug 'preservim/nerdtree' "trees directories
	"Plug 'neoclide/coc.nvim', {'branch': 'release'} "Text suggestions

	"PYTHON RELATED PLUGS:
	Plug 'Vimjas/vim-python-pep8-indent'  "better indenting for python
	Plug 'tweekmonster/impsort.vim'  " color and sort imports
	Plug 'ncm2/ncm2'  " awesome autocomplete plugin
	Plug 'Townk/vim-autoclose' " Automatically close parenthesis, etc
	Plug 'jeetsukumaran/vim-indentwise' " Indentation based movements
	Plug 'bfredl/nvim-ipy'

	"R RELATED PLUGS:
	Plug 'gaalcaras/ncm-R'
	Plug 'jalvesaq/colorout' " R syntax highlighting
	Plug 'jalvesaq/Nvim-R' "R support
	Plug 'gaalcaras/ncm-R'
	Plug 'jalvesaq/R-Vim-runtime'

	"THEMES:
	Plug 'morhetz/gruvbox'
	Plug 'betoissues/contrastneed-theme'
	Plug 'elliothatch/burgundy.vim'
	Plug 'yassinebridi/vim-purpura'
	Plug 'zoomiti/firewatch'
	Plug 'erickzanardo/fireslime.vim'
	Plug 'erizocosmico/vim-firewatch'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'bdesham/biogoo'
	Plug 'maximumtiu/true.vim'
	Plug 'jsit/toast.vim'
	Plug 'nathanlong/vim-colors-writer'
	Plug 'sabrinagannon/vim-garbage-oracle'
	Plug 'ayu-theme/ayu-vim'
	Plug 'ku-s-h/summerfruit256.vim'
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	Plug 'Mofiqul/dracula.nvim'
    
	" Required for vim 8
    Plug 'roxma/vim-hug-neovim-rpc'
    " Install this plugin
    Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }


    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'


call plug#end()

:colorscheme dracula
:set number
:set relativenumber
:set clipboard+=unnamedplus "Yanking between windows
:set shiftwidth=4 "Intendentation
