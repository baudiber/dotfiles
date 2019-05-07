"VIM RUN COMMANDS baudiber March 2019
"to reload without restart = :source $MYVIMRC

"------------------------------------------------------------------------------
"==========================     VIM PLUG INSTALL    ===========================

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"------------------------------------------------------------------------------
"==========================     VIM PLUG PLUGINS    ===========================

call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'joshdick/onedark.vim'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

"to install plugins, resource vimrc and :PlugInstall

"------------------------------------------------------------------------------
"==========================     VIM MODS            ===========================

"execute pathogen#infect()
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

"------------------------------------------------------------------------------
"==========================     KEY PLUGINS         ===========================

:let mapleader = " "  " Use space as <mapleader> key
nnoremap <leader>e :Ex<CR>
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
nnoremap <leader>S :set scrolloff=50<cr>
nnoremap <leader>D :set scrolloff=20<cr>
nnoremap <leader>s :set scrolloff=1<cr>
nnoremap <leader>N :set relativenumber!<cr>
nnoremap <leader>n :set number!<cr>
nnoremap <leader>l :set list!<cr>
nnoremap <leader>w <C-w>
nnoremap <leader>g :Goyo<cr>
nmap <silent> <RIGHT>			:cnext<CR>
nmap <silent> <RIGHT><RIGHT>	:cnfile<CR><C-G>
nmap <silent> <LEFT>			:cprev<CR>
nmap <silent> <LEFT><LEFT>		:cpfile<CR><C-G>
nnoremap / /\v
nmap <silent> <BS> :nohlsearch<CR>

"------------------------------------------------------------------------------
"==========================     VIM SETTINGS        ===========================

syntax enable		" Active la coloration syntaxique
set backspace=indent,eol,start
set mouse=a			" Permet d'utiliser la souris
set title			" Met a jour le titre du terminal
set number			" Affiche le numero de ligne
set ruler			" Affiche la position actuelle du curseur
set wrap			" Affiche les lignes trop longues sur plusieur lignes
set linebreak		" Ne coupe pas les mots
set scrolloff=50	" Affiche un minimum de 5 lignes autour du curseur
set shiftwidth=4	" Regle les tabulations automatiques sur 4 espaces
set tabstop=4		" Regle l'affichage des tabulations sur 4 espaces
set splitright		" Ouvre les verticalsplit sur la droite
set laststatus=2	" Affiche la bar de status
set cc=80			" Change la couleur de fond a 80 colonnes
set showcmd			" Affiche les commandes incompletes
set wildmenu		" Show autocompletion possibles
"set noshowmode		" Dont show -- INSERT --, -- VISUAL -- whene changing mode
set ignorecase		" Ignore la casse lors d'une recherche
set smartcase		" Sauf si la recherche contient une majuscule
set incsearch		" Surligne le resultat pendant la saisie
set cindent			" smart indentation for C language
set noswapfile		" vim no longer creates .swp files
set listchars=tab:→\ ,trail:·,eol:¬,extends:…,precedes:…
set hlsearch
set cursorline
"set cursorcolumn
set matchpairs+=<:>,=:;
syntax sync minlines=300 " syntax to be processed for only 300 lines at a time
set synmaxcol=100        " syntax max X 
set regexpengine=1

"------------------------------------------------------------------------------
"==========================     VIM HELLO LINE      ===========================

autocmd VimEnter * echo "OwO What's this?"

"------------------------------------------------------------------------------
"==========================     VIM THEME           ===========================

set background=dark	" Utilise des couleurs adaptees pour fond noir
let g:onedark_termcolors=256
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
"if (has("autocmd") && !has("gui_running"))     remove !  to cancel if condition
if (has("autocmd") && !has("gui_running"))
	augroup colorset
		autocmd!
		let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
		autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
	augroup END
endif
colorscheme onedark
"set background=light	" Utilise des couleurs adaptees pour fond clair
"colorscheme PaperColor

"------------------------------------------------------------------------------
"==========================     HELP IN NEW TAB     ===========================

"Only apply to .txt files...
augroup HelpInTabs
	autocmd!
	autocmd BufEnter	*.txt	call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
	if &buftype == 'help'
		"Convert the help window to a tab...
		execute "normal \<C-W>T"
	endif
endfunction

"------------------------------------------------------------------------------
"==========================     PERSISTENT UNDO     ===========================

if has('persistent_undo')
	set undofile
	set undodir=$HOME/.VIM_UNDO_FILES
endif
