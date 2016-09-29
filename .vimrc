" $Id: //depot/tools/aticad/1.0/src/zoo/xfeng/.vimrc#10 $
"
" vimrc file for Unix and OS/2 ~/.vimrc
" author : xfeng
"
" Vundle settings start
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'morhetz/gruvbox'

Plugin 'scrooloose/nerdtree'

Plugin 'godlygeek/tabular'

"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'

call vundle#end()
filetype plugin indent on
" Vundle settings stop

set nowrap            " Don't wrap long lines
set nocindent         " But don't do wacky C style indenting
set bs=2              " allow backspacing over everything in insert mode
set showmatch         " always set showmatch on
set expandtab         " Use spaces instead of tabs
set softtabstop=4     " Use spaces instead of tabs
set tabstop=4         " If you insist on using tabs, use the same tabstop
"set backup           " keep a backup file (defaults to .filename~)
set viminfo='20,\"50  " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50        " keep 50 lines of command line history
set ruler             " show the cursor position all the time
set expandtab         " Use the appropriate number of spaces to insert a <Tab>

if has("gui_running")
    syntax on
    set hlsearch
else
    syntax off
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
"endif

if has("autocmd")
    autocmd BufNewFile,BufRead Makefile set noexpandtab " Makefiles ensure that we don't expand tabs since tabs are special
endif

" workaround to fix the issue that arrow chars display incorrectly in NERDTree
if has('gui_running')
    set encoding=utf-8
endif

" use color scheme gruvbox dark
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'


" setting for vim-indent-guides
"let g:indent_guides_guide_size = 1
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_color_change_percent = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=orange ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" settings for indentLine
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 0
let g:indentLine_color_term = 239
let g:indentLine_color_gui = "#A4E57E"
let g:indentLine_char = '|'

" hidden tool bar and menu bar
set guioptions-=m
set guioptions-=T

" key mapping
let mapleader = ','
map <leader>h  :nohlsearch <CR>         " clear highlight search
map <leader>ig :IndentLinesToggle<CR>   " enable/disable indent lines
map <leader>nt :NERDTreeToggle<CR>      " enable/disable NERDTree
map <leader>nu :set invnumber<CR>       " enable/disable line nmuber
map <leader>sw :set wrap!<CR>           " enable/disable auto text wrapping
map <leader>so :if exists("g:syntax_on") <Bar>
    \               syntax off <Bar>
    \           else <Bar>
    \               syntax enable <Bar>
    \           endif <CR><CR>

filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete

" disable comment auto-complete
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" function to highlight space chars in the end of lines
let g:toggleHighlightWhitespace = 0
function! ToggleHighlightWhitespace()
    let g:toggleHighlightWhitespace = 1 - g:toggleHighlightWhitespace
    call RefreshHighlightWhitespace()
endfunction

function! RefreshHighlightWhitespace()
    if g:toggleHighlightWhitespace == 1 " normal action, do the hi
        highlight ExtraWhitespace ctermbg=green guibg=green
        match ExtraWhitespace /\s\+$/
    else
        call clearmatches()
    endif
endfunction

nnoremap <leader>ss :call ToggleHighlightWhitespace()<CR>
