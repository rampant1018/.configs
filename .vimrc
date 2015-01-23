" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

"------------------------------------------------------------------------------
" Install vundle automatically
" http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
"------------------------------------------------------------------------------
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
	echo "Installing vundle.."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	let iCanHazVundle=0
endif

"------------------------------------------------------------------------------
" Vundle settings
"------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/The-NERD-tree' " File explorer
Plugin 'cscope_macros.vim' " Basic cscope settings and key mappings
Plugin 'taglist.vim' " Source code browser

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------------------------------------------------------------------------
" Install vundle plugins automatically
"------------------------------------------------------------------------------
if iCanHazVundle == 0
	echo "Installing Plugins, please ignore key map error messages"
	echo ""
	:PluginInstall
	:qall
endif

"------------------------------------------------------------------------------
" General Settings
"------------------------------------------------------------------------------
" Enable syntax highlighting
syntax on

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype on		" Enable filetype detection
filetype indent on	" Enable filetype-specific indenting
filetype plugin on	" Enable filetype-specific plugins

" Generic settings
set bs=2		" Allow backspaceing over everything in insert mode
set autoread		" Read when file is changed from outside automatically
set autowrite		" Automatically save before commands like :next and :make
set mouse=a		" Enable mouse usage (all modes)
set list listchars=tab:\ \ ,trail:·

" Visual support settings
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set number		" Show line number
set ruler		" Show the cursor position all the time
set cursorline		" Show the current line ruler
if exists('+colorcolumn')
	set colorcolumn=80 " Show a red line at column 80
endif

" Seatch settings
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search

" Backup settings
if !filereadable('~/.vim/backup')
	silent !mkdir -p ~/.vim/backup
endif
if !filereadable('~/.vim/swap')
	silent !mkdir -p ~/.vim/swap
endif
if !filereadable('~/.vim/undo')
	silent !mkdir -p ~/.vim/undo
endif
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Indent settings
set shiftwidth=8	" Intent columns with the reindent operations(<< and >>)
set tabstop=8		" Set columns a tab counts when display
set softtabstop=8	" Set columns a tab counts when hit
set noexpandtab		" No replace tab with space

" Taglist settings
let Tlist_Use_Right_Window = 1	" Open Taglist on right side

" Color settings
hi cursorline guibg=#333333 
hi CursorColumn guibg=#333333
hi Comment      term=bold ctermfg=darkcyan
hi Constant     term=underline ctermfg=Red
hi Special      term=bold ctermfg=Magenta
hi Identifier   term=underline ctermfg=cyan
hi Statement    term=bold ctermfg=Brown
hi PreProc      term=bold ctermfg=DarkYellow
hi Type         term=bold ctermfg=DarkGreen
hi Ignore       ctermfg=white
hi Error        term=reverse ctermbg=Red ctermfg=White
hi Todo         term=standout ctermbg=Yellow ctermfg=Red
hi Search       term=standout ctermbg=Yellow ctermfg=Black
hi ErrorMsg     term=reverse ctermbg=Red ctermfg=White
hi StatusLine   ctermfg=darkblue  ctermbg=gray
hi StatusLineNC ctermfg=brown   ctermbg=darkblue
hi SpecialKey	guifg=LightRed
autocmd InsertLeave * hi clear
autocmd InsertEnter * hi cursorline term=none cterm=none ctermbg=DarkBlue
set background=dark

" Key mapping
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> <F6> :TlistToggle<CR>
