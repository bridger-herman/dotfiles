" Load pathogen packages
execute pathogen#infect()

" ---------- Custom highlighting ----------
" Set terminal Colors
set t_Co=256

" TODO
" highlight SpecialComment ctermfg=83

highlight LineNr ctermfg=15

highlight Number ctermfg=213
highlight String ctermfg=118

highlight Statement ctermfg=81
highlight Conditional ctermfg=81
highlight Repeat ctermfg=81
highlight Label ctermfg=81
highlight Keyword ctermfg=81
highlight Exception ctermfg=81
highlight Operator ctermfg=15 cterm=bold

highlight Function ctermfg=222

highlight Pmenu ctermbg=239 ctermfg=46
highlight PmenuSel ctermbg=46 ctermfg=239

highlight SpellBad ctermbg=124
highlight SpellCap ctermbg=71
highlight SpellRare ctermbg=53
highlight SpellLocal ctermbg=24

" TODO
" highlight Type ctermfg=227
" highlight StorageClass ctermfg=227
" highlight Structure ctermfg=227
" highlight Typedef ctermfg=227

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
autocmd FileType make setlocal set noexpandtab " MakeFile specific settings

" Spell checker
autocmd FileType markdown setlocal spell spelllang=en
autocmd FileType tex setlocal spell spelllang=en

" ImageJ (Javascript-like, hack for now)
au BufReadPost *.ijm set syntax=java

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

" ---------- Miscellaneous Settings ---------- 

" Basic autoindentation
set autoindent

" Splitting
set splitright
set splitbelow

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
