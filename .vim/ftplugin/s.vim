" Vim filetype plugin file for GNU-C coding style
" Language:	Motoroloa 68000 assembler
" Maintainer:	Dean Scarff <p00ya @AT users.sf .DOT net>
" Last Change:	2005 Feb 09
" USAGE: Copy to an ftplugin directory, see |ftplugin-overrule|.


" Overrules any previous ftplugin, and flags to not load further ftplugins
let b:did_ftplugin = 1
set smartindent

setlocal tabstop=8 " no used because of expandtab
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent

