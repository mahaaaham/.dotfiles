let b:did_ftplugin = 1

set smartindent

setlocal tabstop=4 " no used because of expandtab
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent

set commentstring=#\ %s

" seen in https://wiki.sagemath.org/Tips n , . The makeprg line allows one to
" build and test a source file from within Vim simply by typing :make. 
 autocmd FileType sage set makeprg=sage\ -b\ &&\ sage\ -t\ %

 set dictionary+=~/.vim/dict/sage
 set dictionary+=~/.vim/dict/sagepoint
 " complete should set the dictionary completion with "CTRL-N" but this doesn't 
 " completely word.. for example, the word "matrix", in the dictionnary sage, 
 " isn't recognised.
 set complete+=k,.   

 " non defined term
" to many # in comment for the E266, undefined terme for F821
let g:syntastic_python_flake8_args = '--ignore=E266,F821'
