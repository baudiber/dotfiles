syntax enable		" Active la coloration syntaxique
set backspace=indent,eol,start
set synmaxcol=100
set regexpengine=1
noremap <C-N> :Ex<CR>
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
:let mapleader = " "  " Use space as <mapleader> key
set laststatus=2	" Affiche la bar de status
set cc=80			" Change la couleur de fond a 80 colonnes
set showcmd		" Affiche les commandes incompletes
"set wildmenu		" Show autocompletion possibles
"set noshowmode		" Dont show -- INSERT --, -- VISUAL -- whene changing mode
set cursorline
"set cursorcolumn
set ignorecase		" Ignore la casse lors d'une recherche
set smartcase		" Sauf si la recherche contient une majuscule
set incsearch		" Surligne le resultat pendant la saisie
set cindent			" smart indentation for C language
nnoremap <leader>S :set scrolloff=50<cr>
nnoremap <leader>s :set scrolloff=1<cr>
nnoremap <leader>N :set relativenumber!<cr>
nnoremap <leader>n :set number!<cr>
set noswapfile
autocmd VimEnter * echo "sup"

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
