hi clear
syntax reset
let g:colors_name = "colours"
if &background == "light"
elseif &background == "dark"
    " background 7 means TODO
    hi Boolean cterm=NONE ctermfg=114 ctermbg=NONE gui=NONE guifg=#90d590 guibg=NONE
    hi Character cterm=NONE ctermfg=155 ctermbg=NONE gui=NONE guifg=#a8ff61 guibg=NONE
    hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=234 gui=NONE guifg=NONE guibg=#1a1a1a
    hi Comment cterm=NONE ctermfg=245 ctermbg=NONE gui=NONE guifg=#8a8a8a guibg=NONE
    hi Conceal cterm=NONE ctermfg=244 ctermbg=NONE gui=NONE guifg=#808080 guibg=NONE
    hi Conditional cterm=NONE ctermfg=75 ctermbg=NONE gui=NONE guifg=#70baff guibg=NONE
    hi Constant cterm=NONE ctermfg=244 ctermbg=NONE gui=NONE guifg=#808080 guibg=NONE
    hi Cursor cterm=reverse ctermfg=NONE ctermbg=NONE gui=reverse guifg=NONE guibg=NONE
    hi CursorColumn cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=#0a0a0a
    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=#0a0a0a
    hi CursorLineNr cterm=NONE ctermfg=255 ctermbg=236 gui=NONE guifg=#f0f0f0 guibg=#2e2e2e
    hi Debug cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi Define cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi Delimiter cterm=NONE ctermfg=253 ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
    hi DiffAdd cterm=NONE ctermfg=NONE ctermbg=234 gui=NONE guifg=NONE guibg=#082608
    hi DiffChange cterm=NONE ctermfg=NONE ctermbg=234 gui=NONE guifg=NONE guibg=#1a1a1a
    hi DiffDelete cterm=NONE ctermfg=NONE ctermbg=233 gui=NONE guifg=NONE guibg=#260808
    hi DiffText cterm=NONE ctermfg=NONE ctermbg=236 gui=NONE guifg=NONE guibg=#333333
    hi Directory cterm=NONE ctermfg=245 ctermbg=NONE gui=NONE guifg=#8f8f8f guibg=NONE
    hi Error cterm=NONE ctermfg=NONE ctermbg=52 gui=NONE guifg=NONE guibg=#710e0e
    hi ErrorMsg cterm=NONE ctermfg=NONE ctermbg=233 gui=NONE guifg=NONE guibg=#260808
    hi Exception cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi FoldColumn cterm=NONE ctermfg=241 ctermbg=NONE gui=NONE guifg=#616161 guibg=NONE
    hi Folded cterm=NONE ctermfg=242 ctermbg=NONE gui=NONE guifg=#707070 guibg=NONE
    hi Function cterm=NONE ctermfg=223 ctermbg=NONE gui=NONE guifg=#ffd2a7 guibg=NONE
    hi Ignore cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi IncSearch cterm=NONE ctermfg=47 ctermbg=233 gui=NONE guifg=#00ff62 guibg=#002910
    hi Keyword cterm=NONE ctermfg=75 ctermbg=NONE gui=NONE guifg=#5fafff guibg=#002910
    hi LineNr cterm=NONE ctermfg=245 ctermbg=233 gui=NONE guifg=#8a8a8a guibg=#121212
    hi Label cterm=NONE ctermfg=75 ctermbg=NONE gui=NONE guibg=NONE guifg=NONE
    hi Macro cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
    hi MatchParen cterm=NONE ctermfg=232 ctermbg=39 gui=NONE guifg=#0a0a0a guibg=#00a6ff
    hi ModeMsg cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi MoreMsg cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi NonText cterm=NONE ctermfg=241 ctermbg=NONE gui=NONE guifg=#616161 guibg=NONE
    hi Normal cterm=NONE ctermfg=255 ctermbg=NONE gui=NONE guifg=#e8e8e8 guibg=#0a0a0a
    hi Number cterm=NONE ctermfg=213 ctermbg=NONE gui=NONE guifg=#ff75fd guibg=NONE
    hi Operator cterm=bold ctermfg=231 ctermbg=NONE gui=bold guifg=#ffffff guibg=NONE
    hi Pmenu cterm=NONE ctermfg=NONE ctermbg=234 gui=NONE guifg=NONE guibg=#1a1a1a
    hi PmenuSbar cterm=NONE ctermfg=NONE ctermbg=235 gui=NONE guifg=NONE guibg=#262626
    hi PmenuSel cterm=NONE ctermfg=NONE ctermbg=236 gui=NONE guifg=NONE guibg=#333333
    hi PmenuThumb cterm=NONE ctermfg=NONE ctermbg=238 gui=NONE guifg=NONE guibg=#424242
    hi PreCondit cterm=NONE ctermbg=NONE ctermfg=48 gui=NONE guibg=NONE guifg=#00ff87
    hi Question cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi Repeat cterm=NONE ctermfg=75 ctermbg=NONE gui=NONE guifg=#5fafff guibg=NONE
    hi Search cterm=NONE ctermfg=47 ctermbg=233 gui=NONE guifg=#00ff62 guibg=#002910
    hi SignColumn cterm=NONE ctermfg=241 ctermbg=NONE gui=NONE guifg=#616161 guibg=NONE
    hi Special cterm=NONE ctermfg=147 ctermbg=NONE gui=NONE guifg=#b4b3ff guibg=NONE
    hi SpecialChar cterm=NONE ctermfg=114 ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
    hi SpecialComment cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi SpecialKey cterm=NONE ctermfg=241 ctermbg=NONE gui=NONE guifg=#616161 guibg=NONE
    hi SpellBad cterm=NONE ctermfg=fg ctermbg=52 gui=undercurl guisp=NONE guifg=NONE guibg=#260808
    hi SpellCap cterm=NONE ctermfg=fg ctermbg=23 gui=undercurl guisp=NONE guifg=NONE guibg=NONE
    hi SpellLocal cterm=NONE ctermfg=fg ctermbg=NONE gui=undercurl guisp=NONE guifg=NONE guibg=#082608
    hi SpellRare cterm=NONE ctermfg=fg ctermbg=17 gui=undercurl guisp=NONE guifg=NONE guibg=#082226
    hi Statement cterm=NONE ctermfg=186 ctermbg=NONE gui=NONE guifg=#cfcb90 guibg=NONE
    hi StatusLine cterm=NONE ctermfg=251 ctermbg=235 gui=NONE guifg=#c2c2c2 guibg=#262626
    hi StatusLineNC cterm=NONE ctermfg=242 ctermbg=235 gui=NONE guifg=#707070 guibg=#262626
    hi StorageClass cterm=NONE ctermfg=75 ctermbg=NONE gui=NONE guifg=#5fafff guibg=NONE
    hi String cterm=NONE ctermfg=155 ctermbg=NONE gui=NONE guifg=#a8ff61 guibg=#FFFFB6
    hi Structure cterm=underline ctermfg=229 ctermbg=NONE gui=underline guifg=NONE guibg=NONE
    hi TabLine cterm=NONE ctermfg=242 ctermbg=235 gui=NONE guifg=#707070 guibg=#262626
    hi TabLineFill cterm=NONE ctermfg=NONE ctermbg=235 gui=NONE guifg=NONE guibg=#262626
    hi TabLineSel cterm=NONE ctermfg=251 ctermbg=235 gui=NONE guifg=#c2c2c2 guibg=#262626
    hi Tag cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi Title cterm=NONE ctermfg=255 ctermbg=NONE gui=NONE guifg=#ededed guibg=NONE
    hi Todo cterm=bold ctermfg=185 ctermbg=NONE gui=bold guifg=#cec764 guibg=NONE
    hi Type cterm=NONE ctermfg=186 ctermbg=NONE gui=NONE guifg=#e0d97b guibg=NONE
    hi Typedef cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi Underlined cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi VertSplit cterm=NONE ctermfg=235 ctermbg=235 gui=NONE guifg=#262626 guibg=#262626
    hi Visual cterm=NONE ctermfg=NONE ctermbg=236 gui=NONE guifg=NONE guibg=#333333
    hi VisualNOS cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg cterm=NONE ctermfg=NONE ctermbg=233 gui=NONE guifg=NONE guibg=#260808
    hi WildMenu cterm=NONE ctermfg=NONE ctermbg=239 gui=NONE guifg=NONE guibg=#525252
    hi lCursor cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
    hi Identifier cterm=NONE ctermfg=NONE ctermbg=7 gui=NONE guifg=NONE guibg=NONE
    hi PreProc cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
endif
