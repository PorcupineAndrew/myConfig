" **********************************************************************
" * Description   : Vim global plugin for common information
" * Last change   : 09:08:27 2019-08-05
" * Author        : Yihao Chen
" * Email         : chenyiha17@mails.tsinghua.edu.cn
" * License       : www.opensource.org/licenses/bsd-license.php
" **********************************************************************

" Loading check ------------------------------------------------------- {{{
    if exists("loaded_CommonInformation")
        finish
    endif
    let loaded_CommonInformation = 1
" }}}


" Map \i to function s:ScriptHeadNotation ----------------------------- {{{
    if !hasmapto('<Plug>ScriptHeadNotation')
        map <unique> <Leader>i <Plug>ScriptHeadNotation
    endif
    noremap <unique> <script> <Plug>ScriptHeadNotation <SID>ScriptHeadNotation
    noremap <SID>ScriptHeadNotation i<c-r>=<SID>ScriptHeadNotation()<CR>
" }}}


" call s:ModifyLastChange before save --------------------------------- {{{
    autocmd BufWritePre * call <SID>ModifyLastChange()
" }}}


" Get the notation mark according to filetype ------------------------- {{{
    function s:GetNotationMark()
        let l:notationMap = {
            \"vim": "\"",
            \"python": "#",
            \"sh": "#",
            \"java": "//",
        \}
        if has_key(l:notationMap, &filetype)
            return l:notationMap[&filetype]
        else
            return ""
        endif
    endfunction
" }}}


" Get current time of standard format --------------------------------- {{{
    function s:FormalTime()
        return strftime("%H:%M:%S %F")
    endfunction
" }}}


" Give split line ----------------------------------------------------- {{{
    function s:SplitLine()
        return "**********************************************************************"
    endfunction
" }}}


" Get personal info --------------------------------------------------- {{{
    function s:PersonalNotation()
        let l:info = [
            \"* Author        : Yihao Chen\n",
            \"* Email         : chenyiha17@mails.tsinghua.edu.cn\n",
        \]

        let l:toRet = ""
        for i in l:info
            let l:toRet .= s:GetNotationMark() . " " . i
        endfor

        return l:toRet
    endfunction
" }}}


" Get license --------------------------------------------------------- {{{
    function s:LicenseNotation()
        return s:GetNotationMark() . " " . "* License       : www.opensource.org/licenses/bsd-license.php\n"
    endfunction
" }}}


" Get script header --------------------------------------------------- {{{
    function s:ScriptHeadNotation()
        let l:toRet = s:GetNotationMark() . " " . s:SplitLine() . "\n"
        let l:toRet .= s:GetNotationMark() . " " . "* Description   : " . "\n"
        let l:toRet .= s:GetNotationMark() . " " . "* Last change   : " . s:FormalTime() . "\n"
        let l:toRet .= s:PersonalNotation() . s:LicenseNotation()
        let l:toRet .= s:GetNotationMark() . " " . s:SplitLine() . "\n"
        return l:toRet
    endfunction
" }}}


" modify last change time --------------------------------------------- {{{
    function s:ModifyLastChange()
        for line_number in range(1, line('$'))
            let l:oldline = getline(line_number)
            let l:pattern = '\(.*\)\(Last change   : \d\+:\d\+:\d\+ \d\+-\d\+-\d\+\)\(.*\)'
            let l:newline = substitute(l:oldline, l:pattern, '\1' . 'Last change   : ' . s:FormalTime() . '\3', "")
            if l:newline != l:oldline
                call setline(line_number, l:newline)
                break
            endif
        endfor
    endfunction
" }}}
