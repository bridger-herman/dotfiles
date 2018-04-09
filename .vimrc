" Load pathogen packages
execute pathogen#infect()

" ---------- Custom highlighting ----------
" Set terminal Colors
set t_Co=256

colorscheme atom_nuevo

syntax on
filetype plugin indent on

set number " Show line numbers
set showmatch " Bracket Matching

set hlsearch " Highlight search matches

" ---------- Language Settings ----------
set tabstop=2 " Number of visual spaces per tab
set shiftwidth=2 " Shift width
set softtabstop=2 " Number of spaces in tab when editing
set expandtab " Spaces instead of tabs

autocmd FileType python setlocal softtabstop=4 shiftwidth=4 " Python specific settings
autocmd FileType matlab setlocal softtabstop=4 shiftwidth=4 " MATLAB specific settings

au BufReadPost *.make set syntax=make
autocmd FileType make setlocal noexpandtab " MakeFile specific settings

" Spell checker
autocmd FileType markdown setlocal spell spelllang=en
autocmd FileType tex setlocal spell spelllang=en

" ImageJ (Javascript-like, hack for now)
au BufReadPost *.ijm set syntax=java

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
",space:·
set list

" ---------- Keyboard shortcut remaps ----------
" Move to beginning/end of line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
vnoremap B ^
vnoremap E $
vnoremap $ <nop>
vnoremap ^ <nop>

" Atom/gedit shortcuts I'm used to
nmap <c-d> dd
nnoremap <CR> o
nmap <c-a-q> gq

" Insert a line but don't edit it
nmap o o<Esc>

" Escape in insert mode
imap jk <Esc><Right>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

let mapleader = ","

" ---------- Miscellaneous Settings ----------

" Basic autoindentation
set autoindent

" Splitting
set splitright
set splitbelow

set textwidth=78

" ---------- Plugin Settings ----------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Disable Markdown folding
" let g:vim_markdown_folding_disabled = 1

" Disable callbacks for now
let g:vimtex_latexmk_callback = 0

" Enable Markdown YCM
let g:ycm_filetype_blacklist = {}

" Close scratch window
let g:ycm_autoclose_preview_window_after_insertion = 1

" gitignore for ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" avoid vimtex error message
let g:vimtex_compiler_latexmk = {'callback' : 0}

" Always autosave workspace
let g:workspace_autosave_always = 1

" Avoid 'still no compile flags' error TODO doesn't work
" let g:ycm_global_ycm_extra_conf = '/home/bridger/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"
"
" External commands
set exrc
set secure
