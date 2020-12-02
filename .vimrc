" disable arrows
"
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

syntax on
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd Filetype tex setl updatetime=1
:au BufNewFile, BufRead *.py
set pastetoggle=<F6>
set noshowmatch
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set backspace=indent,eol,start
set clipboard=unnamedplus,unnamed
set autochdir

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'preservim/nerdtree'
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'mitsuhiko/vim-jinja'
Plug 'mitsuhiko/vim-python-combined'
Plug 'editorconfig/editorconfig-vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call plug#end()

colorscheme happy_hacking
set background=dark

" latex settings
"
let g:livepreview_previewer = 'open -a Preview'
nnoremap <Leader>pl :LLPStartPreview<CR>



" python settings
"
let g:pymode_virtualenv_path = "venv"
let g:pymode_virtualenv = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_indent = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_run_bind = '<leader>p'
let g:pymode_lint_write = 1
let pymode_lint_on_fly = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" go settings
"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1


" terraform setting
"
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
let g:pymode_virtualenv = 0
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pw :set wrap!<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>+ :vertical resize +20<CR>
nnoremap <Leader>- :vertical resize -20<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>r :GoRun<CR>
nnoremap <leader>d :GoDef<CR>

" Crystal-lang maapings
"
nnoremap <leader>cf :CrystalFormat<CR>
nnoremap <leader>cd :CrystalDef<CR>
command CR !crystal run %

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Sweet Sweet FuGITive
"nmap <leader>gh :diffget //3<CR>
"nmap <leader>gd :diffget //2<CR>
"nmap <leader>gs :G<CR>
 nnoremap <leader>gd :Gdiff<CR>
 nmap <leader>gs :G<CR>
 nnoremap <leader>gc :Gcommit -v -q<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowCollapsible='+'
let g:NERDTreeDirArrowExpandable='|'
