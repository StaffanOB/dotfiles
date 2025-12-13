" [toorzen.vim] - Toor-Zen colorscheme for Vim
" Based on onedark.vim by joshdick
" Colors matched to tmux-toor-zen-theme

let s:overrides = get(g:, "toorzen_color_overrides", {})

let s:colors = {
      \ "red": get(s:overrides, "red", { "gui": "#e06c75", "cterm": "204", "cterm16": "1" }),
      \ "dark_red": get(s:overrides, "dark_red", { "gui": "#BE5046", "cterm": "196", "cterm16": "9" }),
      \ "green": get(s:overrides, "green", { "gui": "#98c379", "cterm": "114", "cterm16": "2" }),
      \ "yellow": get(s:overrides, "yellow", { "gui": "#e5c07b", "cterm": "180", "cterm16": "3" }),
      \ "dark_yellow": get(s:overrides, "dark_yellow", { "gui": "#D19A66", "cterm": "173", "cterm16": "11" }),
      \ "blue": get(s:overrides, "blue", { "gui": "#2e9ef4", "cterm": "39", "cterm16": "4" }),
      \ "purple": get(s:overrides, "purple", { "gui": "#C678DD", "cterm": "170", "cterm16": "5" }),
      \ "cyan": get(s:overrides, "cyan", { "gui": "#56B6C2", "cterm": "38", "cterm16": "6" }),
      \ "white": get(s:overrides, "white", { "gui": "#cccccc", "cterm": "252", "cterm16": "15" }),
      \ "black": get(s:overrides, "black", { "gui": "#181818", "cterm": "234", "cterm16": "0" }),
      \ "foreground": get(s:overrides, "foreground", { "gui": "#cccccc", "cterm": "252", "cterm16": "NONE" }),
      \ "background": get(s:overrides, "background", { "gui": "#181818", "cterm": "234", "cterm16": "NONE" }),
      \ "comment_grey": get(s:overrides, "comment_grey", { "gui": "#cccccc", "cterm": "252", "cterm16": "7" }),
      \ "gutter_fg_grey": get(s:overrides, "gutter_fg_grey", { "gui": "#31312E", "cterm": "236", "cterm16": "8" }),
      \ "cursor_grey": get(s:overrides, "cursor_grey", { "gui": "#2C323C", "cterm": "236", "cterm16": "0" }),
      \ "visual_grey": get(s:overrides, "visual_grey", { "gui": "#363636", "cterm": "237", "cterm16": "8" }),
      \ "menu_grey": get(s:overrides, "menu_grey", { "gui": "#31312E", "cterm": "236", "cterm16": "7" }),
      \ "special_grey": get(s:overrides, "special_grey", { "gui": "#31312E", "cterm": "236", "cterm16": "7" }),
      \ "vertsplit": get(s:overrides, "vertsplit", { "gui": "#363636", "cterm": "237", "cterm16": "7" })
      \}

function! toorzen#GetColors()
  return s:colors
endfunction
