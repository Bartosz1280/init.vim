let g:plugged_home = '~/.config/nvim'
let g:R_path = '/usr/bin/'
let g:R_assign = 1

"PLUG-CALL
call plug#begin(g:plugged_home)
    Plug 'JuliaEditorSupport/julia-vim' "julia support	
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'dense-analysis/ale'
    Plug 'junegunn/fzf'
    
    "UTILITIES:
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'preservim/nerdtree'
    Plug 'mhinz/vim-startify' "Start-up screen
    Plug 'jbyuki/nabla.nvim' "Math LateX support
    Plug 'vim-pandoc/vim-pandoc'
    "Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    "Barbar
    Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
    Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
    Plug 'romgrk/barbar.nvim'
    
    "PYTHON RELATED PLUGS:
    Plug 'Townk/vim-autoclose' " Automatically close parenthesis, etc
    Plug 'jeetsukumaran/vim-indentwise' " Indentation based movements
    Plug 'lukas-reineke/indent-blankline.nvim'

    "HTML CSS RELATED PLUGS:
    Plug 'alvan/vim-closetag'
    Plug 'andymass/vim-matchup'
    Plug 'AndrewRadev/tagalong.vim'
    Plug 'mattn/emmet-vim'


    "Plug 'hrsh7th/nvim-cmp'       " optional, for completion
    
    "R RELATED PLUGS:
    Plug 'jalvesaq/Nvim-R' "R support
    
    "Completition manager
    " assuming you're using vim-plug: https://github.com/junegunn/vim-plug
    Plug 'roxma/nvim-yarp'
    
    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    "Plug 'ncm2/ncm2-bufword'
    "Plug 'ncm2/ncm2-path'
   " Plug 'prabirshrestha/vim-lsp'
    "Plug 'ncm2/ncm2-vim-lsp'
    " based on ultisnips
    "Plug 'ncm2/ncm2-ultisnips'
    "Plug 'SirVer/ultisnips'
    
    "THEMES:
    Plug 'morhetz/gruvbox'
    Plug 'srcery-colors/srcery-vim'
    Plug 'kooparse/vim-color-deser-night'
call plug#end()

" START UP COINFIGS:
if (has("termguicolors"))
 set termguicolors
endif
" an example
colorscheme gruvbox
let g:shades_of_purple_airline = 1
set completeopt=noinsert,menuone,noselect
set background=dark
set number
set relativenumber
set clipboard+=unnamedplus "Yanking between windows
set shiftwidth=4 "Intendentation
" Overides the pink syntax suggestion menu to the default one
highlight Pmenu guibg=#080e6e

"SPELL CHECK SETTINGS:
" spell languages
set spelllang=en,cjk
" Show nine spell checking candidates at most
set spellsuggest=best,9
" spell file
setlocal spell spelllang=en_us

syntax on    

" When python filetype is detected, F5 can be used to execute script 
" let R_auto_omni = ["r",  "rmd", "rnoweb", "rhelp", "rrst"]
let g:python3_host_prog="/home/hermit/anaconda3/bin/python3"

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" ColorsOveridde
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set nocompatible
filetype plugin on

" CONFIGS:
"
" COC NVIM CONFIGS:
let g:coc_global_extensions = ['coc-json','coc-python', 'coc-r-lsp','coc-yaml','coc-css','coc-yaml','coc-sh','coc-markdownlint']
autocmd FileType r COCConfig
autocmd FileType * call coc#refresh()

" ALE CONFIGS:
" let g:ale_fixers = {‘html’: [‘prettier’],‘css’: [‘stylelint’],}
" let g:ale_linters = {‘html’: [‘htmlhint’],‘css’: [‘stylelint’],}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:loaded_matchit = 1

" TAGALONG CONFIGS:
let g:tagalong_verbose = 1

" CUTSOM FUNCTIONS:
    " Pasting empty Rmd chunk
    function! PasteRCode()
	normal! i```{r,eval=TRUE,include=TRUE,echo=TRUE,message=TRUE,warning=TRUE}
	normal! o # Empty  code chunk
	normal! o```
	normal! k
    endfunction
    
    " Define the custom command
    command! -nargs=0 PasteRCode call PasteRCode()
    
    " Pasting empty Rmd chunk for figures
    function! PasteRFigureChunk()
	normal! i```{r PlotName ,eval=TRUE,include=TRUE,echo=FALSE,message=FALSE,out.width='auto', out.height='auto',fig.cap=""}
	normal! o # Empty figure chunk
	normal! o```
	normal! k
    endfunction
    
    command! -nargs=0 PasteRFigureChunk call PasteRFigureChunk()
    
    " Pasting empty Rmd chunk for tables
    function! PasteRKableTableChunk()
	normal! i```{r,eval=TRUE,include=TRUE,echo=FALSE,message=FALSE}
	normal! o # %>% kbl(caption="") %>%kable_classic("striped",full_width=F)
	normal! o```
	normal! k
    endfunction
    
    command! -nargs=0 PasteRKableTableChunk call PasteRKableTableChunk()

    function! LoremIpsum()
	normal! i Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    endfunction

    command! -nargs=0 LoremIpsum call LoremIpsum()

   function! BootstrapLink() 
       normal! i <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
   endfunction

   command! -nargs=0 BootstrapLink call BootstrapLink()
"VIM CLOSETAG:
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

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
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" REMAPS:
"

nnoremap <silent> <F2> :set spell!<cr>
inoremap <silent> <F2> <C-O>:set spell!<cr>

nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

nnoremap <silent> <Leader>nc :PasteRCode<CR>
nnoremap <silent> <Leader>nf :PasteRFigureChunk<CR>
nnoremap <silent> <Leader>nt :PasteRKableTableChunk<CR>
nnoremap <leader>p :lua require("nabla").popup()<CR>

tnoremap <C-n> <C-\><C-n>
imap <S-kminus> _

" Pandoc remaping
nmap zq zo
nmap zs z=
nnoremap <silent> <leader>s :syntax off<CR>:syntax on<CR>

"Barbar Config
" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" Restore buffer
nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>

" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButVisible
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight

" Magic buffer-picking mode
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
nnoremap <silent> <C-p>    <Cmd>BufferPickDelete<CR>

" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

" Key mapping to open the coc.nvim menu
nmap <silent> <space>ca :<C-u>CocAction<CR>

" Key mapping to trigger code completion
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
