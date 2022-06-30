syntax on
set encoding=UTF-8
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
:set shortmess-=S   " Show matched number

" General setting
:let mapleader = ","
map <C-a> <Home>
map <C-e> <End>

" Copy file_name / abs_path
nnoremap yf :let @f=expand("%:t")<CR>
nnoremap yp :let @p=expand("%:p")<CR>
" Cancel seaching result highlight
nnoremap <silent> <Esc><Esc> :noh<CR>
" Tab navigation
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt

""" Plug-related

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'wincent/terminus'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'matze/vim-move'
Plug 'inside/vim-search-pulse'
Plug 'ptzz/lf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" vim-floaterm
let g:floaterm_keymap_new       = '<leader>c'
let g:floaterm_keymap_next      = '<leader>n'
let g:floaterm_keymap_kill      = '<leader>k'
let g:floaterm_keymap_toggle    = '<leader>t'

" nerdtree
map <C-n> :NERDTreeToggle<CR>
"   Use lf instead to open dirs
let g:NERDTreeHijackNetrw = 0  
let g:NERDTreeShowHidden = 1
"   Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"   Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" vim-move
let g:move_key_modifier = 'S'
let g:move_key_modifier_visualmode = 'S'

" vim-search-pulse
let g:vim_search_pulse_mode = 'pattern'

" lf.vim    - <leader>f
let g:lf_replace_netrw = 0      " use lf to open dir

" fzf.vim
"   [Files]
nmap <C-g> :Files<CR>
"   [Buffers]
let g:fzf_buffers_jump = 1      " Jump to the existing window if possible
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
"   [[B]Commits]  Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"   [Tags]
let g:fzf_tags_command = 'ctags -R' " Command to generate tags file
"   [Commands]  --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
