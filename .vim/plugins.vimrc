" automated instalation of vim-plug, curl needed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" the tpope ones!
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'mbbill/undotree'

" for programmation
Plug 'w0rp/ale'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-grepper'

Plug 'junegunn/fzf', { 'dir': '~/.git/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug

Plug 'roxma/nvim-yarp'

" for completion 
runtime ncm2.vimrc

" for epub
" Plug 'https://github.com/etnadji/vim-epub'

" To aesthetic
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" "frontend" for terminal command
Plug 'vim-utils/vim-man'

" others
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
" Plug 'junegunn/vim-easy-align'

" Initialize plugin system
call plug#end()

" Configuration of plugins: 

" path to directory where libclang.so can be found
let g:ncm2_pyclang#library_path = '/usr/bin'

" easymotion
" let g:EasyMotion_do_mapping = 0 " Disable default mappings

 " Jump to anywhere you want with minimal keystrokes, with just one key binding.
 " `s{char}{label}`
 " nmap s <Plug>(easymotion-overwin-f)
 " or
 " `s{char}{char}{label}`
 " Need one more keystroke, but on average, it may be more comfortable.
 nnoremap <leader>s <Plug>(easymotion-overwin-f2)
 " Turn on case insensitive feature
 let g:EasyMotion_smartcase = 1

 "  colorscheme
set t_Co=256
let g:zenburn_high_Contrast = 0
let g:zenburn_old_Visual = 1
colors zenburn

" vimtex
let g:vimtex_view_method = 'mupdf'
" we disable the overfull and underfull warnings
" 0      The quickfix window is never opened/closed automatically.
" 1      The quickfix window is opened automatically when there are errors,
"
let g:vimtex_compiler_progname = '/home/maha/.local/bin/nvr'
let g:vimtex_quickfix_mode = 0
let g:vimtex_quickfix_latexlog = {
  \ 'default' : 1,
  \ 'general' : 1,
  \ 'references' : 1,
  \ 'overfull' : 0,
  \ 'underfull' : 0,
  \ 'font' : 1,
  \ 'packages' : {
  \   'default' : 1,
  \   'natbib' : 1,
  \   'biblatex' : 1,
  \   'babel' : 1,
  \   'hyperref' : 1,
  \   'scrreprt' : 1,
  \   'fixltx2e' : 1,
  \   'titlesec' : 1,
  \ },
  \}


" let g:vimtex_complete_enabled = 1

" for ocaml, see 
" https://www.cs.kent.ac.uk/people/staff/sao/articles/osx_vim_ocaml.html
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
"set rtp+=/home/maha/.opam/system/share/merlin/vim
" let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
" execute "set rtp+=".s:ocamlmerlin."/vim"
" execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"

"
"
" vim-airline
let g:airline#extensions#tabline#enabled = 1


" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline_theme ='base16_bright'

" ncm2 and vimtex
au BufEnter * call ncm2#enable_for_buffer()
au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'vimtex',
            \ 'priority': 1,
            \ 'subscope_enable': 1,
            \ 'complete_length': 1,
            \ 'scope': ['tex'],
            \ 'matcher': {'name': 'combine',
            \           'matchers': [
            \               {'name': 'abbrfuzzy', 'key': 'menu'},
            \               {'name': 'prefix', 'key': 'word'},
            \           ]},
            \ 'mark': 'tex',
            \ 'word_pattern': '\w+',
            \ 'complete_pattern': g:vimtex#re#ncm,
            \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
            \ })
set completeopt=noinsert,menuone,noselect

set noshowmode


" easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

 " ALE 
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)


" let b:ale_linters = {'python': ['flake8']}
" let b:ale_linter_aliases = {'sage': 'python'}

let b:ale_fixers = {'sage': ['remove_trailing_lines', 'trim_whitespace']}
let b:ale_fixers = {'sage': ['autopep8']}
let b:ale_fixers = {'python': ['autopep8']}
let b:ale_linters = {'ocaml': ['merlin']}
let b:ale_fixers = {'text': ['remove_trailing_lines', 'trim_whitespace']}
  let g:ale_fixers = {
  \   'sage': [
  \       'autopep8',
  \   ],
  \}

" fzf mappings
nnoremap <C-p> :<C-u>FZF<CR>

" " grepper mappings
let g:grepper = {}
let g:grepper.tools  = ['rg' ,'grep']

" " Search for the current word
nnoremap <leader>g :Grepper<CR>
nnoremap <leader>* :Grepper -cword -noprompt<CR>

" " Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
