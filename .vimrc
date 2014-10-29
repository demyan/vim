set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nu

"" start Vundle
"" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"" :BundleInstall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on
"" end Vundle

" https://github.com/Yggdroot/indentLine 
Bundle 'Yggdroot/indentLine'
let g:indentLine_char = '┊'

nmap <C-\> :vsplit<CR>:let word=expand("<cword>")<CR><C-W><C-W>:exec "tag" word<CR>
map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" resize current buffer by +/- 5 
nnoremap <silent> <A-left> :vertical resize -5<cr>
nnoremap <silent> <A-down> :resize +5<cr>
nnoremap <silent> <A-up> :resize -5<cr>
nnoremap <silent> <A-right> :vertical resize +5<cr>

" highlights the background in a subtle red for text that goes over the 80 column limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/
