" Check if tagbar is installed under plugins or is directly under rtp
" this covers pathgen + Vundle/Bundle
"
" Also make sure the ctags command exists
"
if !executable('ctags')
    finish
elseif globpath(&rtp, 'plugin/tagbar.vim') == ""
    finish
endif

if !exists("g:tagbar_type_go")
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : expand(g:go_gotags_bin),
        \ 'ctagsargs' : '-sort -silent'
    \ }
endif
