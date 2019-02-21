"
" include new syntax highlighting
"

augroup filetypedetect

" If filetypes.vim already exists, just copy the following lines
" to your filetypes.vim file, see "help new-filetype",  part C.

" Promela
au BufNewFile,BufRead *.prom,*.prm,*.promela	setfiletype promela

" Sage, the solution of the double file is for tagbar..
au BufNewFile,BufRead *.sage	setfiletype python.sage

" Ocaml
au BufNewFile,BufRead *.ml	setfiletype ocaml

" text
au BufNewFile,BufRead *.txt	setfiletype text

augroup END
