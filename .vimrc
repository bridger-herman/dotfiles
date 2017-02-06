" Set terminal Colors
set t_Co=256
" Colorscheme atom-dark
colorscheme atom-dark-256
syntax on
highlight LineNr ctermfg=white

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
