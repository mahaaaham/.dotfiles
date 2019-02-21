" Vim filetype plugin file for GNU-C coding style
" Language:	C++

" Overrules any previous ftplugin, and flags to not load further ftplugins
set smartindent
let b:did_ftplugin = 1
" Set various width parameters
setlocal sw=2 ts=8 tw=78
setlocal cinoptions=>2s,e-s,n-s,f0,{s,^-s,:s,=s,g0,+.5s,p2s,t0,(0 cindent

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croql
" Set 'comments' to format dashed lists in comments.
setlocal comments=sO:*\ -,mO:\ \ \ ,exO:*/,s1:/*,mb:\ ,ex:*/
set cpo-=CC
" Win32 can filter files in the browse dialog
if has("gui_win32") && !exists("b:browsefilter")
  let b:browsefilter = "C++ Source Files (*.cc)\t*.cc\n" .
  \ "C++ Header Files (*.h)\t*.h\n" .
  \ "All Files (*.*)\t*.*\n"
endif
