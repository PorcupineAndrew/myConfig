" **********************************************************************
" * Description   : Help functions for vimscript
" * Last change   : 13:56:51 2019-07-31
" * Author        : Yihao Chen
" * Email         : chenyiha17@mails.tsinghua.edu.cn
" * License       : www.opensource.org/licenses/bsd-license.php
" **********************************************************************

" List and Dictionary functions ------------------------------------------------------ {{{
    function! Sorted(l)
        let l:new_list = deepcopy(a:l)
        return sort(l:new_list)
    endfunction 

    function! Reversed(l)
        let l:new_list = deepcopy(a:l)
        return reverse(l:new_list)
    endfunction

    function! Append(l, val)
        let l:new_list = deepcopy(a:l)
        call add(l:new_list, a:val)
        return l:new_list
    endfunction

    function! Assoc(l, i, val)
    " Also used for Dictionary
        let l:new_list = deepcopy(a:l)
        let l:new_list[a:i] = a:val
        return l:new_list
    endfunction

    function! Pop(l, i)
    " Also used for Dictionary
        let l:new_list = deepcopy(a:l)
        call remove(l:new_list, a:i)
        return l:new_list
    endfunction

    function! Mapped(fn, l)
    " Also used for Dictionary
        let l:new_list = deepcopy(a:l)
        call map(l:new_list, string(a:fn) . '(v:val)')
        return l:new_list
    endfunction

    function! Filtered(fn, l)
    " Also used for Dictionary
        let l:new_list = deepcopy(a:l)
        call filter(l:new_list, string(a:fn) . '(v:val)')
        return l:new_list
    endfunction

    function! Removed(fn, l)
    " Also used for Dictionary
        let l:new_list = deepcopy(a:l)
        call filter(l:new_list, '!' . string(a:fn) . '(v:val)')
        return l:new_list
    endfunction

    function! Reduced(fn, l)
        let l:new_list = deepcopy(a:l)
        let l:result = l:new_list[0]
        for i in l:new_list[1:]
            let l:result = a:fn(l:result, i)
        endfor
        return l:result
    endfunction

    function! Sum(...)
        if a:0 == 1
            if type(a:1) == type([])
                execute "let l:sum = " . join(a:1, '+')
            elseif type(a:1) == type({})
                execute "let l:sum = " . join(values(a:1), '+')
            else
                let l:sum = a:1 + 0
            endif
        else
            execute "let l:sum = " . join(Mapped(function('string'), a:000), '+')
        endif
        return l:sum
    endfunction
" }}}
