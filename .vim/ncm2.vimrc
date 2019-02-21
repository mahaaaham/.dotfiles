"completion
Plug 'ncm2/ncm2'

" enable ncm2 for all buffers
" IMPORTANT: :help Ncm2PopupOpen for more information
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
set shortmess+=c
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'


" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'yuki-ycino/ncm2-dictionary'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-pyclang'


" let g:ncm2_pyclang#library_path = '/usr/lib/x86_64-linux-gnu/libclang-6.0.so.1'
let g:ncm2_pyclang#library_path = '/usr/lib/llvm-6.0/lib'
