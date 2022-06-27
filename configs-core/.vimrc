syntax on
set number          " Show line numbers.
set ruler           " Show the line and column number of the cursor position, separated by a comma.
set ignorecase      " Ignore case in search patterns.
set smartcase       " Override the 'ignorecase' option if the search pattern contains upper case characters.
set tabstop=4		" Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
set smarttab        " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
set autoindent      " Copy indent from current line when starting a new line
set showcmd         " Show (partial) command in status line.
set showmatch       " When a bracket is inserted, briefly jump to the matching one.
set hlsearch        " When there is a previous search pattern, highlight all its matches.
set incsearch       " While typing a search command, show immediately where the so far typed pattern matches.
set mouse=a         " Enable the use of the mouse.
set scrolloff=999   " Minimal number of screen lines to keep above and below the cursor.
set relativenumber  " Show the line number relative to the line with the cursor in front of each line.

map <C-n> :NERDTreeToggle<CR>
map <C-a> <Home>
map <C-e> <End>

" Copy file_name / abs_path
nnoremap yf :let @f=expand("%:t")<CR>
nnoremap yp :let @p=expand("%:p")<CR>
" Cancel seaching result highlight
nnoremap <silent> <Esc><Esc> :noh<CR>


" Plugins
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'voldikss/vim-floaterm'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" vim-floaterm
let g:floaterm_keymap_new       = '<F7>'
let g:floaterm_keymap_next      = '<F8>'
let g:floaterm_keymap_kill      = '<F9>'
let g:floaterm_keymap_toggle    = '<F12>'
