"My .vimrc         

" Plugins (after the mapleader, see :h mapleader that says:
"     Note that the value of "mapleader" is used at the moment the mapping is defined. Changing
"     "mapleader" after that has no effect for already defined mappings.

let mapleader="\<Space>" " '\' isn't very convenient..
let maplocalleader="\<Space>" " '\' isn't very convenient..

runtime plugins.vimrc  " For plugin gestion


filetype indent on " Enable loading the indent file for specific file  
" If filetype detection is not switched on yet, it will be as well.
filetype plugin on
set nocompatible            

if has("nvim")
set inccommand=split
endif

" for epub
au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))

" GENERALS MAPPINGS 
set pastetoggle=<F2> "avoid indentation when pasting a text
syntax on
set number
set mouse=a
set background=dark
" insensitive to case research if there is no uppercase letter,  
" and sensitive to case if there is one.
set smartcase


" COMMAND MODE MAPPING
" C-e is already for <End>
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>



" Allow to make single-line modification to each 
" line of a visual selection
" See Daniel Miessler tutorial 
vnoremap . :norm.<cr> 

if has('nvim')
    tnoremap  jk <C-\><C-n>
    nnoremap <leader>r :source ~/.config/nvim/init.vim<cr>
else
    nnoremap <leader>r :source ~/.vimrc<cr> 
endif

"Easier than using ESC to quit a command or insert mode
inoremap jk <ESC>
cnoremap jk <ESC>

" windows
" r is for resize.
nnoremap e<C-j> :res -5 <cr>
nnoremap e<C-k> :res +5 <cr>
nnoremap <C-E>_ <C-W>_
nnoremap <C-E>= <C-W>=
nnoremap <C-E>\| <C-W>\|
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" '%%' Copy the current directory in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" SEARCH 
set ignorecase
set hlsearch
" I use the vim-unimpaired plugin to play with the hlsearch option
"
set path+=** " use "find namefile" to open the first file that matches
" Display autocompletion matches when using TAB in command mode.
" See also wild mode for some options.
set wildmenu
" Don't offer to open certain files/directories
" tips seen in 
" https://gist.github.com/csswizardry/9a33342dace4786a9fee35c73fa5deeb
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd

" INDENTATION, TABULATION & COLUMN 
set tabstop=8 
set textwidth=100

" SPELL
" Add French and English to corrector
set spell spelllang=en,fr 
" f means first, replace the word by the first choice of correction of spell
nnoremap <leader>f 1z= 
" To activate and deactivate the spell; I use vim-unimpaired
 
" BUFFER 
" WARNING It's easy to forget that you have changes in hidden buffers.
"Think twice when using ":q!" or ":qa!".
set hidden

" CTAGS, UNIVERSAL CTAGS, TAGBAR, ctags, universal ctags, tagbar
" Quicker highlight the tags where I am
set updatetime=10

nnoremap <leader>t :TagbarToggle<cr>
" I found universal ctags in: https://github.com/universal-ctags/ctags 
" It can be install with autotools, in the autoconf package. Because the " ctags program already exist,
" i renamed this on exctags .

" VIMWIKI 
runtime tagbar.vimrc " to integrate tagbar and vimwiki
runtime vimwiki.vimrc

" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" now we can
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

let g:python_host_prog = '/usr/bin/python3'
let g:python3_host_prog = '/usr/bin/python3.7'
let g:python3_host_prog = '/usr/bin/python3.7'

" to not change appearance of tex code in vim
let g:tex_conceal = '' 

" see :h vimtex-requirement, used by vimtex
if empty(v:servername) && exists('*remote_startserver')
call remote_startserver('VIM')
endif

