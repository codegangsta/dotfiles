" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
"
" Quickly remove search highlights
nmap <F9> :nohl

" Yank to system clipboard
set clipboard=unnamed

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward

nmap H :back
nmap L :forward

" Follow links with gf and gd
exmap follow obcommand editor:follow-link
nmap gf :follow
nmap gd :follow

" Creating and following links with <CR>
exmap followLink jsfile Scripts/vim-helpers.js {followLink()}
nunmap <CR>
vunmap <CR>
map <CR> :followLink

" Navigation between panes
exmap focustop obcommand editor:focus-top
exmap focusbottom obcommand editor:focus-bottom
exmap focusleft obcommand editor:focus-left
exmap focusright obcommand editor:focus-right

nmap <C-k> :focustop
nmap <C-j> :focusbottom
nmap <C-h> :focusleft
nmap <C-l> :focusright

" Splits
exmap vspl obcommand workspace:split-vertical

" Surround
exmap surround_wiki surround [[ ]]
map [[ :surround_wiki
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

map [[ :surround_wiki
nunmap s
vunmap s
map s" :surround_double_quotes
map s' :surround_single_quotes
map sb :surround_brackets
map s( :surround_brackets
map s) :surround_brackets
map s[ :surround_square_brackets
map s[ :surround_square_brackets
map s{ :surround_curly_brackets
map s} :surround_curly_brackets

" Toggle tags
exmap toggle_tag_2m      jsfile Scripts/vim-helpers.js {toggleTag("2m")}
exmap toggle_tag_5m      jsfile Scripts/vim-helpers.js {toggleTag("5m")}
exmap toggle_tag_15m     jsfile Scripts/vim-helpers.js {toggleTag("15m")}
exmap toggle_tag_30m     jsfile Scripts/vim-helpers.js {toggleTag("30m")}
exmap toggle_tag_1h      jsfile Scripts/vim-helpers.js {toggleTag("1h")}
exmap toggle_tag_waiting jsfile Scripts/vim-helpers.js {toggleTag("waiting")}

map <C-0> :toggle_tag_2m
map <C-1> :toggle_tag_5m
map <C-2> :toggle_tag_15m
map <C-3> :toggle_tag_30m
map <C-4> :toggle_tag_1h
