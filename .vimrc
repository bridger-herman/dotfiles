" Load pathogen packages
execute pathogen#infect()

" Set terminal Colors
set t_Co=256
" Colorscheme atom-dark
"colorscheme atom-dark-256
"colorscheme atom_bridger

" Custom highlighting
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

" highlight Type ctermfg=227
" highlight StorageClass ctermfg=227
" highlight Structure ctermfg=227
" highlight Typedef ctermfg=227

syntax on
filetype plugin indent on

set tabstop=2 " Number of visual spaces per tab
set shiftwidth=2 " Shift width
set softtabstop=2 " Number of spaces in tab when editing
set expandtab " Spaces instead of tabs

autocmd FileType python setlocal softtabstop=4 shiftwidth=4 " Python specific settings
autocmd FileType make setlocal set noexpandtab " MakeFile specific settings

set number " Show line numbers
set showmatch " Bracket Matching

set hlsearch " Highlight search matches

" Move to beginning/end of line
nnoremap B ^
nnoremap E $

nnoremap $ <nop>
nnoremap ^ <nop>

" Escape in insert mode
imap jk <Esc>

" Basic autoindentation
set autoindent
