set nocompatible

execute pathogen#infect()

"" Clint's Customization
set number
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set modeline
set modelines=5 " default

set cursorline

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set mouse=a


let mapleader=" "
noremap <Leader>w <C-w>
noremap <Leader>h <C-w>h
noremap <Leader>j <C-w>j
noremap <Leader>k <C-w>k
noremap <Leader>l <C-w>l

noremap <Leader>q :q!<CR>
noremap <Leader>wq :wq<CR>
" Ctrl-s is save
noremap <C-s> :w<CR>

noremap <Leader>b :b#<CR>


"" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<CR>
" auto open if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if only NERDTree left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"" Appearance
set background=light
colorscheme lucius
"set background=dark
"colorscheme slate


"" Statusline
set statusline =[%t]    " tail of the filename
set statusline+=%*

" display a warning if fileformat isn't unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" display a warning if file encoding isn't utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

" modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

" read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

set statusline+=%{fugitive#statusline()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%=      " left/right separator
set statusline+=%c      " cursor column
set laststatus=2


"" Syntastic "beginner" settings
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

noremap <Leader>e :Errors<CR>
noremap <Leader>el :lclose<CR>


"" Taglist
noremap <Leader>t :TlistToggle<CR>


"" neocomplete settings
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" tab completion
inoremap<expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif


"" Vim Fugitive
noremap <Leader>ga :Git add %:p<CR><CR>
noremap <Leader>gw :Gwrite<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>gb :Git branch<Space>
noremap <Leader>gc :Git checkout<Space>
" use the following to use Fugitive as the git mergetool
"git config --global mergetool.fugitive.cmd 'vim -f -c "Gdiff" "$MERGED"'
"git config --global merge.tool fugitive


"" Language specific settings

" Clojure 
" support for taglist.vim
let tlist_clojure_settings = 'clojure;n:namespace;d:definition;f:function;p:private function;m:macro;i:inline;a:multimethod definition;b:multimethod instance;c:definition (once);s:struct;v:intern'

