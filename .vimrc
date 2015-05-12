" https://github.com/fatih/dotfiles/blob/master/vimrc
"
" Vundle
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'fatih/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'

call vundle#end()
filetype plugin indent on

set t_Co=256
" let g:molokai_original=1
let g:rehash256 = 1
colorschem molokai

" ==================================================="
"                   SETTINGS                         "
" ==================================================="
set pastetoggle=<F10>
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start  " Makes backspace key more powerful.
set number                      " Show line numbers
set noerrorbells                " No beeps
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
" speed up syntax highlighting
set nocursorcolumn
set nocursorline
syntax sync minlines=256
set synmaxcol=128
set re=1

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

"
" mappings
"

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

nmap <C-\> :vsplit<CR>:let word=expand("<cword>")<CR><C-W><C-W>:exec "tag" word<CR>
map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" resize current buffer by +/- 5 
" nnoremap <silent> <A-left> :vertical resize -5<cr>
" nnoremap <silent> <A-down> :resize +5<cr>
" nnoremap <silent> <A-up> :resize -5<cr>
" nnoremap <silent> <A-right> :vertical resize +5<cr>
noremap <silent> <Leader>= :vertical resize +5<cr>
noremap <silent> <Leader>- :vertical resize -5<cr>

" Alt+leftarrow will go one window left, etc.
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>


" ----------------------------------------- "
"  File Type settings                       "
" ----------------------------------------- "

" highlights the background in a subtle red for text that goes over the 80 column limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/
augroup LongLines
    autocmd!
    autocmd FileType * match none
    autocmd FileType python,c,sh match OverLength /\%>80v.\+/
augroup END

au BufNewFile,BufRead *.vim setlocal noet ts=2 sw=2 sts=2
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4 
au BufNewFile,BufRead *.md setlocal noet ts=4 sw=4 

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
" Python settings
au BufNewFile,BufRead *.py setlocal et ts=8 sw=4 sts=4


" ------------------------------------------------ "
" Plugin configs                                   "
" ------------------------------------------------ "

" ====================indentLine==================
let g:indentLine_char = '┊'


" ==================== Vim-go ====================


" ================= YouCompleteMe ================
" let g:ycm_server_keep_logfile = 1
let g:ycm_autoclose_preview_window_after_completion = 1


" ==================== tagbar ====================
let g:tagbar_width = 30
let g:tagbar_iconchars = ['▶', '◢']
let g:tagbar_sort = 0
nmap <F8> :TagbarToggle<CR>


" ==================== Airline ===================
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_fugitive_prefix = '⎇ '


" ==================== NerdTree ==================
" Open nerdtree in current dir, write our own custom function because
" NerdTreeToggle just sucks and doesn't work for buffers
function! g:NerdTreeFindToggle()
    if nerdtree#isTreeOpen()
        exec 'NERDTreeClose'
    else
        exec 'NERDTreeFind'
    endif
endfunction
" For toggling
noremap <Leader>n :<C-u>call g:NerdTreeFindToggle()<cr> 
" For refreshing current file and showing current dir
noremap <Leader>j :NERDTreeFind<cr>
