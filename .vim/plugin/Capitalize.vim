" **********************************************************************
" * Description   : Vim global plugin for capitalizing
" * Last change   : 16:42:54 2019-07-30
" * Author        : Yihao Chen
" * Email         : chenyiha17@mails.tsinghua.edu.cn
" * License       : www.opensource.org/licenses/bsd-license.php
" **********************************************************************

" Loading check ------------------------------------------------------- {{{
    if exists("loaded_Capitalize")
        finish
    endif
    let loaded_Capitalize = 1
" }}}


" Map \c to function s:CapitalizeFirstLetter -------------------------- {{{
    if !hasmapto('<Plug>CapitalizeFirstLetter')
        map <unique> <Leader>h <Plug>CapitalizeFirstLetter
    endif
    noremap <unique> <script> <Plug>CapitalizeFirstLetter <SID>CapitalizeFirstLetter
    noremap <SID>CapitalizeFirstLetter :call <SID>CapitalizeFirstLetter()<CR>
" }}}


" Capitalize the first letter of each word ---------------- ----------- {{{
    function s:CapitalizeFirstLetter() range
        for line_number in range(a:firstline, a:lastline)
            let line_content = getline(line_number)
            let line_content = substitute(line_content, "\\w\\+", "\\u\\0", "g")
            call setline(line_number, line_content)
        endfor
    endfunction
" }}}
