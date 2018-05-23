syntax enable		" Active la coloration syntaxique
syntax sync minlines=100
set synmaxcol=100
set regexpengine=1
noremap <C-N> :Ex<CR>
set mouse=a			" Permet d'utiliser la souris
set title			" Met a jour le titre du terminal
set number			" Affiche le numero de ligne
"set paste			" mode copie qui indent comme il faut
set ruler			" Affiche la position actuelle du curseur
set wrap			" Affiche les lignes trop longues sur plusieur lignes
set linebreak		" Ne coupe pas les mots
set scrolloff=50	" Affiche un minimum de 5 lignes autour du curseur
set shiftwidth=4	" Regle les tabulations automatiques sur 4 espaces
set tabstop=4		" Regle l'affichage des tabulations sur 4 espaces
set splitright		" Ouvre les verticalsplit sur la droite
:let mapleader = " "  " Use space as <mapleader> key
set laststatus=2	" Affiche la bar de status
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
nnoremap <leader>p :set paste<cr>
nnoremap <leader>P :set nopaste<cr>
set noswapfile
autocmd VimEnter * echo "sup"

set background=dark	" Utilise des couleurs adaptees pour fond noir
colorscheme one-dark
hi	ColorColumn ctermbg=darkgrey
set cc=80			" Change la couleur de fond a 80 colonnes
