"nvimrc with/without VimR

" VIM-PLUG---------------------------------------------------------------------
call plug#begin()

Plug 'vim-syntastic/syntastic'			" Avoid simple mistakes of syntax
Plug 'tpope/vim-surround'				" Plugin to help surrounding (){}[]...
Plug 'chrisbra/Recover.vim'				" recover .swp files
Plug 'ekalinin/Dockerfile.vim'			" syntax for Dockerfiles
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "FZF !
Plug 'tpope/vim-fugitive'				" git plugin
Plug 'junegunn/goyo.vim'				" Distraction free plugin
"Plug 'gilligan/vim-lldb'				" lldb
Plug 'sheerun/vim-polyglot'				" Better syntax
Plug 'flazz/vim-colorschemes'			" Colorshchemes collection
Plug 'felixhummel/setcolors.vim'		" Colorshchemes tester
Plug 'itchyny/lightline.vim'			" Airline manager

if has('nvim')
	Plug 'critiqjo/lldb.nvim'			" lldb integration needs python-client
endif

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

" Use space as <mapleader> key
:let mapleader = " "

" DISPLAY----------------------------------------------------------------------

syntax enable		" Active la coloration syntaxique
set mouse=a			" Permet d'utiliser la souris
set title			" Met a jour le titre du terminal
"set number			" Affiche le numero de ligne
set ruler			" Affiche la position actuelle du curseur
set wrap			" Affiche les lignes trop longues sur plusieur lignes
set linebreak		" Ne coupe pas les mots
set scrolloff=50	" Affiche un minimum de 5 lignes autour du curseur
set shiftwidth=4	" Regle les tabulations automatiques sur 4 espaces
set tabstop=4		" Regle l'affichage des tabulations sur 4 espaces
"set background=dark	" Utilise des couleurs adaptees pour fond noir
"set splitright		" Ouvre les verticalsplit sur la droite

"set laststatus=2	" Affiche la bar de status
set cc=80			" Change la couleur de fond a 80 colonnes
set showcmd			" Affiche les commandes incompletes
					" Set list set nolist nice caracteres
set wildmenu		" Show autocompletion possibles
set noshowmode		" Dont show -- INSERT --, -- VISUAL -- whene changing mode

set listchars=space:.,tab:▸\ ,eol:¬
set cursorline
"set cursorcolumn

" Set my colorscheme
colorscheme onedark

" SEARCH-----------------------------------------------------------------------

set ignorecase		" Ignore la casse lors d'une recherche
set smartcase		" Sauf si la recherche contient une majuscule
set incsearch		" Surligne le resultat pendant la saisie

" Cache les fichiers lors de l'ouverture d'un autre
"set hidden

" FUNCTIONS--------------------------------------------------------------------

" Raccourci pour passer la numérotation en mode relative "
nnoremap <leader>N :set relativenumber!<cr>
nnoremap <leader>n :set number!<cr>

" Raccourci clavier pour pouvoir coller du code sans problemes
"nnoremap <C-l> :set paste! <cr>

" Do not create swapfiles
:set noswapfile

" GOYO-------------------------------------------------------------------------

" Goyo shortcut
:nnoremap <leader>g <esc>:Goyo<cr>

let g:goyo_width=160
let g:goyo_height="80%"

" NEOVIM-----------------------------------------------------------------------

" Use escape to get out insert-mode in terminal
if has('nvim')
	:tnoremap <Esc> <C-\><C-n>
endif

" VIMSCRIPT--------------------------------------------------------------------

" Let Vim say something nice at startup
autocmd VimEnter * echo "cc"

" Use a shorcut to edit my vimrc
:nnoremap <leader>ev :sp $MYVIMRC<cr>

" Use a shorcut to source my vimrc
:nnoremap <leader>sv :so $MYVIMRC<cr>

" Abbreviation for main
:iabbrev mainc int		main(int argc, char **argv)<cr>{<cr>}<esc>ko

" Open the previous buffer when delete one
:command! Bd bp\|bd \#

" 42---------------------------------------------------------------------------

" Set formatted comment
set comments=sr:/*,mb:**,ex:*/
