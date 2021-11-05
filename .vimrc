set encoding=utf-8

" Show line numbers.
set number

" Save backup files outside of project directory.
set backupdir=$TEMP//
set directory=$TEMP//

" Use ctrl-[hjkl] to select the active split.
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
"Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'digitaltoad/vim-pug'

Plug 'valloric/youcompleteme'

Plug 'scrooloose/syntastic'
"Plug 'burntsushi/ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'heavenshell/vim-jsdoc', {
"  \ 'for': ['javascript', 'javascript.jsx','typescript'],
"  \ 'do': 'make install'
"\}

" Themes
Plug 'flazz/vim-colorschemes'

Plug 'ghifarit53/tokyonight-vim'

"Plug 'chriskempson/base16-vim'

" " List ends here. Plugins become visible to Vim after this call.
call plug#end()

"let g:jsdoc_lehre_path = 'C:\\Users\\C\\AppData\\Roaming\\npm\\node_modules\\lehre\\bin\\lehre'

let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 0

let g:airline_theme = 'badwolf'
"let g:airline_theme = 'jellybeans'
"let g:airline_theme = 'bubblegum'

" Set color scheme.
" Favorites = tokyonight, spacegray, vimspectr, aylin, gruvbox, vim-mellow,
" carbonized, vim-synthwave84, synthwave, neuromancer, vimtom, subatomic256,
" candle, tempus-themes-vim, vim-ariake-dark, vim-space, night-owl,
" mojave-vim, vim-moonlight2, badwolf, quantum, miramare, one-dark.vim,
" vim-nefertiti, iroh-vim, ego.vim, vim-handmade-hero, vim-fresh, apprentice
colorscheme tokyonight

:set wildignore+=node_modules/**
:set wildignore+=mongodata/**
:set wildignore+=docs/**

" Tell Ctrl-P to ignore things.
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules$',
	\ }

" Syntastic options.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" FZF options.
function! s:build_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
	copen
	cc
endfunction

let g:fzf_action = {
	\ 'ctrl-q': function('s:build_quickfix_list'),
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'split' }

