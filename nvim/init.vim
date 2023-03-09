" Line Numbers
:set number
:set relativenumber

" Tabbing and formating
:set noexpandtab
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set autoindent

" Persistant undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline' " Status bar
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto complete
" Plug 'neoclide/coc-vimtex' " Latex completion
Plug 'dpelle/vim-LanguageTool'
Plug 'lervag/vimtex' " Latex completion
Plug '907th/vim-auto-save' " Auto save
Plug 'junegunn/fzf'	" Fuzzy finder
Plug 'junegunn/fzf.vim' " Fuzzy finder
Plug 'ap/vim-buftabline' " Buffer tabs
Plug 'voldikss/vim-floaterm' " Floating terminal
Plug 'preservim/nerdtree' " Nerdtree

call plug#end()

" LanguageTool
let g:languagetool_jar = "~/.config/nvim/LanguageTool-5.2/languagetool.jar"

" Nerdtree
let g:NERDTreeWinPos="left"
let NERDTreeQuitOnOpen=1 " Closes nerdtree when you open a file with it

" Auto save
let g:auto_save=1

" Leader
let mapleader = " "

" Some latex stuff
let g:tex_flavor = "latex"
let g:vimtex_view_method = "zathura"

" Mappings
	" Edit Snips
	nnoremap <leader>snip :CocCommand snippets.editSnippets<cr>
	" Snippet things, Tab/S-Tab through placeholders. Enter to expand snippet
	let g:coc_snippet_next = '<cr>'
	let g:coc_snippet_prev = '<S-cr>'
	inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<cr>"
	" Tab completion for coc
	inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
	inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
	" fzf
	nnoremap <leader>ff :Files<cr>
	nnoremap <leader>fs :Rg<cr>
	" buffers
	nnoremap <tab> :bn<cr>
	nnoremap <S-tab> :bp<cr>
	nnoremap <leader>bd :bd<cr>
	" Snippet jumper
	nnoremap <leader><leader> /(<>)<cr>ggndf>i
	" Floatterm
	nnoremap <leader>tt :FloatermToggle<cr>
	" Nerdtree
	nnoremap <leader>ft :NERDTreeToggle<cr>
