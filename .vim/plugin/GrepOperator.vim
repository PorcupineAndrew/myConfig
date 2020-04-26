" **********************************************************************
" * Description   : Vim global plugin for grep operator
" * Last change   : 10:44:09 2019-07-31
" * Author        : Yihao Chen
" * Email         : chenyiha17@mails.tsinghua.edu.cn
" * License       : www.opensource.org/licenses/bsd-license.php
" **********************************************************************

" Loading check ------------------------------------------------------- {{{
    if exists("loaded_GrepOperator")
        finish
    endif
    let loaded_GrepOperator = 1
" }}}


" Map \g to to GrepOperator ------------------------------------------- {{{
    nnoremap <silent><Leader>g :set operatorfunc=<SID>GrepOperator<CR>g@
    vnoremap <silent><Leader>g :<C-U>call <SID>GrepOperator(visualmode())<CR>
" }}}


" Define GrepOperator behavior ---------------------------------------- {{{
    function! s:GrepOperator(type)
        let l:reg_save = @@
        let l:sel_save = &selection
        let &selection = 'inclusive'

        if a:type ==# 'v'
            normal! `<v`>y
        elseif a:type ==# 'char'
            " normal! `[y`]
            normal! `[v`]y
        else
        " greping between lines doesn't make sense
            return
        endif

        " echom shellescape(@@) . " " . a:type
        silent! execute "grep! -RI " . shellescape(@@) . " ."
        cwindow
        execute "normal! \<C-L>"

        let @@ = l:reg_save
        let &selection = l:sel_save
    endfunction
" }}}
