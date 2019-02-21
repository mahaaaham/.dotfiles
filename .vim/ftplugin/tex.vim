let b:ale_linters = {'latex': ['chktex']}
let b:ale_fixers = {'latex': ['chktex']}

let b:did_indent = 1
let g:tex_indent_brace=0 
let g:tex_indent_items=0 
let g:tex_itemize_env = "" " Environments that allow item indentation.
let g:tex_indent_and = ""  
setlocal textwidth=120

" g:tex_indent_brace: Toggle smartindent-like style for {} and [].
" g:tex_indent_items: Indent continuation lines after \items.
" g:tex_items: Tokens to be recognized as \items.
" g:tex_itemize_env: Environments that allow item indentation.
" g:tex_noindent_env: Environments that should not be indented.
" g:tex_indent_and: Whether to align the line with the first &, i.e. in tables and align environments.
