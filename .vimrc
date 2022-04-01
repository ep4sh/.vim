" disable arrows
"
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" General settings
syntax on
filetype plugin indent on
set foldmethod=indent
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd Filetype tex setl updatetime=1
:au BufNewFile, BufRead *.py
au BufNewFile,BufRead Jenkinsfile setf groovy
set pastetoggle=<F6>
set noshowmatch
set hlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
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
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next',  'do': 'bash install.sh'  }
Plug 'flazz/vim-colorschemes'

Plug 'tweekmonster/gofmt.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'hashivim/vim-terraform'
Plug 'vim-scripts/groovy.vim'
Plug 'ollykel/v-vim'
call plug#end()

set t_Co=256
"colorscheme afterglow
colorscheme happy_hacking
"colorscheme nord
"colorscheme SerialExperimentsLain
"colorscheme PaperColor
"colorscheme hybrid_reverse
"set background=light
set background=dark

" Coc setting
"
let g:coc_global_extensions = ['coc-json', 'coc-sh', 'coc-docker', 'coc-go', 'coc-python', 'coc-rls']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>ax <Plug>(coc-codeaction-line)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" nerd tree settings
"
autocmd FileType nerdtree setlocal noreadonly

" v settings
"
" Disable highlight white space after "[]".
let g:v_highlight_array_whitespace_error = 0

" Disable highlight white space around the communications operator that don't follow the standard style.
let g:v_highlight_chan_whitespace_error = 1

" Disable highlight instances of tabs following spaces.
let g:v_highlight_space_tab_error = 1

" Disable highlight trailing white space.
let g:v_highlight_trailing_whitespace_error = 1

" Disable highlight function calls.
let g:v_highlight_function_calls = 1

let g:v_highlight_fields = 1

" Enable automatically formatting file via "v fmt -" before writing buffer.
let g:v_autofmt_bufwritepre = 1

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
let g:pymode_lint_write = 0
let pymode_lint_on_fly = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

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
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run-vertical)
autocmd FileType go nmap <leader>gi  <Plug>(go-implements)
autocmd FileType go nmap <leader>gf  <Plug>(go-referrers)
autocmd FileType go map <leader>gs :GoDebugStart<cr>
autocmd FileType go map <leader>gt :GoDebugStop<cr>
autocmd FileType go map <leader>gb :GoDebugBreakpoint<cr>
let g:go_debug_mappings = {
            \    '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
            \      '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
            \ '(go-debug-step)': {'key': 's'},
            \ '(go-debug-print)': {'key': 'p'},}
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
      \ }
      " \ 'goroutines':      'rightbelow 10new',

" terraform setting
"
"let g:terraform_align=1
let g:terraform_fold_sections=1
"let g:terraform_fmt_on_save=1

if executable('rg')
    let g:rg_derive_root='true'
endif

" rust settings
"
let g:rustfmt_autosave = 1

" Hacks
let loaded_matchparen = 1
nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pw :set wrap!<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>re :!find . -type f -not -path '*/\.*' -exec sed -i 's/%/%/g' {} +
nnoremap <Leader>= :vertical resize +20<CR>
nnoremap <Leader>- :vertical resize -20<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" netrw settings
"
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_winsize = 30


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

" Removing whitespaces on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()


"NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowCollapsible='-'
let g:NERDTreeDirArrowExpandable='+'
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" show tab index
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
        let s = '' " complete tabline goes here
        " loop through each tab page
        for t in range(tabpagenr('$'))
                " set highlight
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " set the tab page number (for mouse clicks)
                let s .= '%' . (t + 1) . 'T'
                let s .= ' '
                " set page number string
                let s .= t + 1 . ' '
                " get buffer names and statuses
                let n = ''      "temp string for buffer names while we loop and check buftype
                let m = 0       " &modified counter
                let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(t + 1)
                        " buffer types: quickfix gets a [Q], help gets [H]{base fname}
                        " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
                        if getbufvar( b, "&buftype" ) == 'help'
                                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                        elseif getbufvar( b, "&buftype" ) == 'quickfix'
                                let n .= '[Q]'
                        else
                                let n .= '📄 ' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                                "let n .= fnamemodify( bufname(b), '%:t' )
                        endif
                        " check and ++ tab's &modified count
                        if getbufvar( b, "&modified" )
                                let m += 1
                        endif
                        " no final ' ' added...formatting looks better done later
                        if bc > 1
                                let n .= ' '
                        endif
                        let bc -= 1
                endfor
                " add modified label [n+] where n pages in tab are modified
                if m > 0
                        let s .= '[' . m . '+]'
                endif
                " select the highlighting for the buffer names
                " my default highlighting only underlines the active tab
                " buffer names.
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " add buffer names
                if n == ''
                        let s.= '[New]'
                else
                        let s .= n
                endif
                " switch to no underlining and add final space to buffer list
                let s .= ' '
        endfor
        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'
        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
                let s .= '%=%#TabLineFill#%999Xclose'
        endif
        return s
endfunction



" Emoji past
ab :check: ✅
ab :todo: ⭕️
ab :ok: 👌
ab :love: ❤️
ab :mad: 🤬
