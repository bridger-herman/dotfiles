" //Load pathogen packages
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

autocmd FileType rust setlocal textwidth=80 " Rust-specific settings

" Spell checker
autocmd FileType html setlocal spell spelllang=en
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
vnoremap B ^
vnoremap E $

" Atom/gedit shortcuts I'm used to
nmap <c-d> dd
nmap <c-a-q> gq

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

" Airline Powerline fonts
let g:airline_powerline_fonts = 1

" Disable callbacks for now
let g:vimtex_latexmk_callback = 0

" Enable Markdown YCM
let g:ycm_filetype_blacklist = {}

" Close scratch window
let g:ycm_autoclose_preview_window_after_insertion = 1

" Rust source path
let g:ycm_rust_src_path = '/home/bridger/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" gitignore for ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" avoid vimtex error message
let g:vimtex_compiler_latexmk = {'callback' : 0}

" vim-workspace tweaks
let g:workspace_autosave_always = 1
