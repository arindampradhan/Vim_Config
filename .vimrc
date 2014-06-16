execute pathogen#infect()
runtime bundle/vim-pathogen/autoload/pathogen.vim
set wmh=0


syntax on
set number

"backup
set swapfile
set dir=~/tmp


"No backup
set nobackup      " #no backup files
set nowritebackup  " #only in case you don't want a backup file while editing
set noswapfile     " #no swap files



nnoremap H :set cursorline! cursorcolumn!<CR>
map  <F5> <Esc>:echo expand('%:p')<Return>


set backspace=2 " make backspace work like most other apps
set ttymouse=xterm2
set backspace=indent,eol,start
set history=100
set wildignore=*.swp,*.bak,*pyc,*.class
autocmd filetype html,xml set listchars-=tab:>.


autocmd!
filetype off
filetype plugin indent on
call pathogen#helptags()


set smartcase
set ignorecase
set nopaste
set tabstop=3
set softtabstop=3
set magic "activate regex
	
set linebreak
set autoindent
set encoding=utf-8



"USING MOUSE
set mouse=a

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction


"Applying schemes
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
"enable color scheme 
colo mustang


"syntax highlighting 
if &t_Co >= 256 || has("gui_running")
   colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
      " switch syntax highlighting on, when the terminal has colors
syntax on
endif


"syntastic
"display together the errors
let g:syntastic_aggregate_errors = 1


"splits
set splitbelow
set splitright


"
set smartindent
set tabstop=5
set shiftwidth=5
set expandtab

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>"

"SOURCE FILES
source ~/.vim/startup/mapping.vim
source ~/.vim/startup/airline.vim
source ~/.vim/startup/auto-pairs.vim
source ~/.vim/startup/neocamp.vim


set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

