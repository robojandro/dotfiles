set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Will still need to do :CocInstall coc-go to get working language reference
" pop-ups

" if vim-go expected behaviours aren't executing, or not found, ie:
"   vim-go: could not find 'goimports'.
" might need to:
"   Run :GoInstallBinaries to fix it

let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
let g:go_highlight_types = 1
"let g:go_auto_type_info = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/ultisnips']

" general settings

filetype plugin indent on
syntax on
set ruler
" set statusline=%f - doesn't seem to work
set hlsearch
set encoding=utf-8
set modeline
set backspace=indent,eol,start

" settings per file plugin: ftplugin

" or 'set dg', allows for combo type insertion of ✓ with capital o->BACKSPACE->capital k
" but then allows for too many typing mistakes to enter digraphs unintentionally
"set digraph

syntax include @GO syntax/go.vim
syntax region goSnip matchgroup=Snip start="@begin=go@" end="@end=go@" contains=@GO

"syntax include @JS syntax/javascript.vim
"syntax region jsSnip matchgroup=Snip start="@begin=js@" end="@end=js@" contains=@JS

" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set
"au BufRead,BufNewFile *.txt set filetype=go
" go syntax for the entire file is over zelous, colors unwanted chars, interferes with pasting
" au BufRead,BufNewFile *.txt set filetype=markdown
let g:markdown_fenced_languages = ['css', 'javascript', 'json=javascript', 'perl', 'xml', 'go', 'python', 'sql', 'make']

let mapleader = ","
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>i <Plug>(go-info)

au BufRead,BufNewFile *.vue set filetype=javascript
"au BufRead,BufNewFile *.txt set filetype=rst

autocmd FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 
autocmd FileType json,rst,markdown,text,perl,javascript setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType markdown,text,perl,javascript setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
set pastetoggle=π

"set paste
set ruler

" ctrl-f
nmap <C-f> i```<CR>```<CR>
"imap <C-f> i<C-\><C-N>```<CR>```<CR>

" spelling - ]s, [s to navigate, z= on highlighted word to bring up suggestions
" don't leave it one since code has too many things that aren't standard english words
" set spell spelllang=en_us
" set spell , also works
" set nospell to turn it off

