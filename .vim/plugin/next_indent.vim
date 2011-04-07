"
" next_indent.vim
"
" Vim 6.0 plugin script to jump to the previous/next indent.
"
" Use the following keys:
"
" [l - Jump to last line with the same indent as the current line
" ]l - Jump to next line with the same indent as the current line
" [L - Jump to last line with the indent less than that of the current line
" ]L - Jump to next line with the indent less than that of the current line
"
" The above keys work in normal mode, visual mode and operator pending mode
"

if exists("loaded_next_indent")
    finish
endif
let loaded_next_indent = 1

" --------------------- Do not edit after this line ------------------------

"
" NextIndent()
"
" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool):   true:  Motion is exclusive
"                     false: Motion is inclusive
" fwd (bool):         true:  Go to next line
"                     false: Go to previous line
" lowerlevel (bool):  true:  Go to line with lower indentation level
"                     false: Go to line with the same indentation level
" skipblanks (bool):  true:  Skip blank lines
"                     false: Don't skip blank lines
function! s:NextIndent(exclusive, fwd, lowerlevel, skipblanks)
    let line = line('.')
    let lastline = line('$')
    let indent = indent(line)
    let stepvalue = a:fwd ? 1 : -1

    while (line > 0 && line < lastline)
        let line = line + stepvalue
        if (! a:lowerlevel && indent(line) == indent ||
            \ a:lowerlevel && indent(line) < indent)
            if (! a:skipblanks || strlen(getline(line)) > 0)
                if (a:exclusive)
                    let line = line - stepvalue
                endif
                exe line
                return
            endif
        endif
    endwhile
endfunc

" Normal mode key mappings
nnoremap <silent> <unique> [l :call <SID>NextIndent(0, 0, 0, 1)<cr>
nnoremap <silent> <unique> ]l :call <SID>NextIndent(0, 1, 0, 1)<cr>
nnoremap <silent> <unique> [L :call <SID>NextIndent(0, 0, 1, 1)<cr>
nnoremap <silent> <unique> ]L :call <SID>NextIndent(0, 1, 1, 1)<cr>

" Visual mode key mappings
vnoremap <silent> <unique> [l <esc>:call <SID>NextIndent(0, 0, 0, 1)<cr>m'gv''
vnoremap <silent> <unique> ]l <esc>:call <SID>NextIndent(0, 1, 0, 1)<cr>m'gv''
vnoremap <silent> <unique> [L <esc>:call <SID>NextIndent(0, 0, 1, 1)<cr>m'gv''
vnoremap <silent> <unique> ]L <esc>:call <SID>NextIndent(0, 1, 1, 1)<cr>m'gv''

" Operator pending mode key mappings
onoremap <silent> <unique> [l :call <SID>NextIndent(1, 0, 0, 1)<cr>
onoremap <silent> <unique> ]l :call <SID>NextIndent(1, 1, 0, 1)<cr>
onoremap <silent> <unique> [L :call <SID>NextIndent(1, 0, 1, 1)<cr>
onoremap <silent> <unique> ]L :call <SID>NextIndent(1, 1, 1, 1)<cr>

