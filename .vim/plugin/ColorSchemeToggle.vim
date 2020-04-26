" **********************************************************************
" * Description   : Vim plugin for colorscheme toggle
" * Last change   : 17:26:09 2019-07-30
" * Author        : Yihao Chen
" * Email         : chenyiha17@mails.tsinghua.edu.cn
" * License       : www.opensource.org/licenses/bsd-license.php
" **********************************************************************

" Loading check ------------------------------------------------------- {{{
    if exists("loaded_ColorSchemeToggle")
        finish
    endif
    let loaded_ColorSchemeToggle = 1
" }}}


" Map \z and \Z to function s:ColorSchemeToggle ----------------------- {{{
    if !hasmapto('<Plug>ColorSchemeToggleForward')
        map <unique> <Leader>z <Plug>ColorSchemeToggleForward
    endif

    if !hasmapto('<Plug>ColorSchemeToggleBackward')
        map <unique> <Leader>Z <Plug>ColorSchemeToggleBackward
    endif

    noremap <unique> <script> <Plug>ColorSchemeToggleForward <SID>ColorSchemeToggleForward
    noremap <SID>ColorSchemeToggleForward :call <SID>ColorSchemeToggle(1)<CR>
    noremap <unique> <script> <Plug>ColorSchemeToggleBackward <SID>ColorSchemeToggleBackward
    noremap <SID>ColorSchemeToggleBackward :call <SID>ColorSchemeToggle(-1)<CR>
" }}}


" Return the list of available color schemes -------------------------- {{{
    function! s:GetColorSchemes()
        return uniq(sort(map(
        \   globpath(&runtimepath, "colors/*.vim", 0, 1),
        \   'fnamemodify(v:val, ":t:r")'
        \   )))
    endfunction
" }}}


" Toggle among available color schemes -------------------------------- {{{
    function! s:ColorSchemeToggle(direction)
        let l:schemes = s:GetColorSchemes()
        let l:current_index = index(l:schemes, g:colors_name)
        if l:current_index >= 0
            let l:next_index = (l:current_index+a:direction)%len(l:schemes)
            silent! execute "normal! :colorscheme " . l:schemes[l:next_index] . "\r"
        else
            silent! execute "normal! :colorscheme " . get(l:schemes, 0, "default") . "\r"
        endif
    endfunction
" }}}
