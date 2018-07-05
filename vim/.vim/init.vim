set nocompatible              " Don't be compatible with vi
set hidden                    " Lusty plugin prefers this

let mapleader = ' '
" Use \ to complement ; for reverse character search
let maplocalleader=','
"PATHOGEN
filetype off
execute pathogen#infect()
execute pathogen#helptags()

"BASICS
syntax on
"filetype on
filetype plugin indent on

" SCREEN Colors and colorscheme
"set background=light
set background=dark
let g:solarized_termcolors=256
"colorscheme solarized
colorscheme pencil
let g:pencil_higher_contrast_ui=1

"colorscheme mod_apprentice

" OPTIONS
set encoding=utf-8
set autoindent
set expandtab
set list
set shiftwidth=4
set scrolloff=3
set softtabstop=4
set hidden
set relativenumber
set showmatch
set matchtime=2
set number
set numberwidth=1
set title
set wildmenu
set pastetoggle=<F2>
set ls=2
set statusline=%<%f\ (%{&ft})%=%-19(%3l,%02c%03V%)
set vb t_vb=

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>p <C-W><C-W>

" Above line disables bells
hi MatchParen cterm=underline ctermbg=none ctermfg=magenta



" MAPPINGS
inoremap kj <Esc>
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>r :CtrlPMRU<CR>
nnoremap <leader>w :w<CR>
" Folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" FastFold
"let g:tex_fold_enabled=1
"let g:python_fold_enabled=1

" SimplyFold
let g:SimpylFold_docstring_preview = 1


"Ctrl p commands
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.eps,*.pyc
let g:ctrlp_mruf_max = 30
let g:ctrlp_mruf_default_order = 1
let g:ctrlp_working_path_mode = 'ra'

"jedi-vim
let g:jedi#auto_initialization = 1
let g:jedi#show_call_signatures = 1
let g:jedi#use_tabs_not_buffers = 0
let g:pymode_rope = 0

"latex-box
let g:LatexBox_Folding = 0
let g:LatexBox_latexmk_async=0
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_fold_automatic=0
let g:LatexBox_quickfix=2
let g:LatexBox_completion_close_braces = 0

" Conceal, typical use for latex
"set conceallevel=2
"set concealcursor=nvc
"let g:tex_conceal="adgms"

"WordNet - dictionary
let g:wordnet_path = "/usr/local/bin/"
nmap <leader>d <F7>
nmap <leader>s <S-F7>


"vim-thesarus
let g:online_thesaurus_map_keys = 0
nnoremap <leader>t :OnlineThesaurusCurrentWord<CR>

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["python"],
    \ "passive_filetypes": ["latex", "tex"] }

"let g:LatexBox_Folding = 1

"VimRoom
let g:vimroom_sidebar_height=0
"
"Word Processing mode
func WordProcessorMode()
  setlocal formatoptions=1
  setlocal expandtab
  " setlocal textwidth=80
  setlocal linebreak
  setlocal wrap
  map j gj
  map k gk
  map $ g$
  map 0 g0
  setlocal smartindent
  " setlocal formatprg=par
  setlocal spell spelllang=en_us
  setlocal spellfile=$HOME/.vim/spell/en.utf-8.add
  setlocal cc=
  setlocal guifont=*
  setlocal guifont=Source\ Code\ Pro:h14
  setlocal linespace=4
  setlocal norelativenumber
  setlocal nonumber
  highlight Cursor guifg=#002B36 guibg=#268DB2
  highlight iCursor guifg=#268DB2 guibg=#002B36
  " disable syntastic error checking
  " SyntasticToggleMode
endfu
com! WP call WordProcessorMode()

function LatexMode()
    setlocal background=light
    :WP
    :Goyo 70%
    :Voom latex
endfunction
command! LT call LatexMode()


" vim-slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
