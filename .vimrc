" **********************************************************************
" * Description   : Vim configuration
" * Last change   : 12:08:55 2020-08-04
" * Author        : Yihao Chen
" * Email         : chenyiha17@mails.tsinghua.edu.cn
" * License       : www.opensource.org/licenses/bsd-license.php
" **********************************************************************


" Basic settings ------------------------------------------------------ {{{
    syntax on
    colorscheme default
    set number
    set expandtab
    set autoindent
    set showcmd " turn this off if work on small display
    set showmode
    set ruler
    set tabstop=4
    set shiftwidth=4
    set showmatch
    set incsearch
    set ignorecase
    set smartcase
    set autoread

    set laststatus=2
    set statusline=%!StatusLine()
    function! StatusLine()
        let l:w = min([20, winwidth(0)/2-3])
        return '%f %h%w%m%r%=%-' . l:w . '.([%n] %l-%L,%c%V%) %P'
    endfunction

    set scrolloff=5
    set encoding=utf-8
    set wildmenu
    " set vb t_vb=[?5h$<100>[?5l
    set hlsearch
    nnoremap <silent><CR> :nohlsearch<CR><CR>
" }}}


" Regular map settings ------------------------------------------------ {{{
    nnoremap j gj
    nnoremap gj j
    nnoremap k gk
    nnoremap gk k
    nnoremap H ^
    nnoremap L $
    vnoremap H ^
    vnoremap L $

    nnoremap <c-s> :w<CR>
    inoremap <c-s> <Esc>:w<CR>

    nnoremap / /\v
    nnoremap ? ?\v

    " nnoremap <c-]> :sp<CR><c-]>
    " nnoremap <c-]> :execute 'ptag ' . expand('<cword>')<CR>
    " nnoremap <c-t> :execute 'pclose' <CR><c-t>
" }}}


" Leader map settings ------------------------------------------------- {{{
    nnoremap <Leader>d ^c$
    nnoremap <Leader>j ddp
    nnoremap <Leader>k ddgkP
    nnoremap <Leader>" viw<Esc>a"<Esc>bi"<Esc>lel
    nnoremap <Leader>' viw<Esc>a'<Esc>bi'<Esc>lel
    nnoremap <Leader>` viw<Esc>a`<Esc>bi`<Esc>lel
    nnoremap <Leader>) viw<Esc>a)<Esc>bi(<Esc>lel
    nnoremap <Leader>] viw<Esc>a]<Esc>bi[<Esc>lel
    nnoremap <Leader>} viw<Esc>a}<Esc>bi{<Esc>lel
    nnoremap <Leader>> viw<Esc>a><Esc>bi<<Esc>lel
    nnoremap <Leader><space> viw<Esc>a<space><Esc>bi<space><Esc>lel
    nnoremap <Leader><c-]> :execute 'ptag ' . expand('<cword>')<CR>
    " nnoremap <Leader>q :silent! bufdo q<CR>
    " function! BufQuit()
    "     if &buftype == 'terminal'
    "         silent! execute '\<C-W>N'
    "     endif
    " endfunction

    vnoremap <Leader>" <Esc>`>a"<Esc>`<i"<Esc><C-O>
    vnoremap <Leader>' <Esc>`>a'<Esc>`<i'<Esc><C-O>
    vnoremap <Leader>` <Esc>`>a`<Esc>`<i`<Esc><C-O>
    vnoremap <Leader>) <Esc>`>a)<Esc>`<i(<Esc><C-O>
    vnoremap <Leader>} <Esc>`>a}<Esc>`<i{<Esc><C-O>
    vnoremap <Leader>] <Esc>`>a]<Esc>`<i[<Esc><C-O>
    vnoremap <Leader>> <Esc>`>a><Esc>`<i<<Esc><C-O>
    vnoremap <Leader><space> <Esc>`>a<space><Esc>`<i<space><Esc><C-O>

    nnoremap <Leader>ev :split $MYVIMRC<CR>
    nnoremap <Leader>sv :source $MYVIMRC<CR>:echo "source" $MYVIMRC<CR>

    nnoremap <Leader># :silent! execute "normal! :leftabove split #\r"<CR>
    nnoremap <Leader>v# :silent! execute "normal! :leftabove vsplit #\r"<CR>
    nnoremap <Leader>t# :silent! execute "normal! :leftabove tabedit #\r"<CR>

    inoremap <Leader>{ {}<Left><CR><Esc>O<Tab>
    inoremap <Leader>[ []<Left>
    inoremap <Leader>( ()<Left>
" }}}


" Operator map settings ----------------------------------------------- {{{
    onoremap in( :<C-U>normal! f(vi(<CR>
    onoremap il) :<C-U>normal! F)vi(<CR>
    onoremap in[ :<C-U>normal! f[vi[<CR>
    onoremap il] :<C-U>normal! F]vi[<CR>
    onoremap in{ :<C-U>normal! f{vi{<CR>
    onoremap il} :<C-U>normal! F}vi{<CR>
    onoremap in< :<C-U>normal! f<vi<<CR>
    onoremap il> :<C-U>normal! F>vi<<CR>
    onoremap in' :<C-U>normal! f'vi'<CR>
    onoremap il' :<C-U>normal! F'vi'<CR>
    onoremap in" :<C-U>normal! f"vi"<CR>
    onoremap il" :<C-U>normal! F"vi"<CR>
    onoremap in` :<C-U>normal! f`vi`<CR>
    onoremap il` :<C-U>normal! F`vi`<CR>

    onoremap an( :<C-U>normal! f(va(<CR>
    onoremap al) :<C-U>normal! F)va(<CR>
    onoremap an[ :<C-U>normal! f[va[<CR>
    onoremap al] :<C-U>normal! F]va[<CR>
    onoremap an{ :<C-U>normal! f{va{<CR>
    onoremap al} :<C-U>normal! F}va{<CR>
    onoremap an< :<C-U>normal! f<va<<CR>
    onoremap al> :<C-U>normal! F>va<<CR>
    onoremap an' :<C-U>normal! f'va'<CR>
    onoremap al' :<C-U>normal! F'va'<CR>
    onoremap an" :<C-U>normal! f"va"<CR>
    onoremap al" :<C-U>normal! F"va"<CR>
    onoremap an` :<C-U>normal! f`va`<CR>
    onoremap al` :<C-U>normal! F`va`<CR>

    onoremap <silent>i@ :<C-U>silent! execute "normal! /\\w\\+@\\w\\+\\.[1-8a-zA-Z.]\\+\r:nohlsearch\rvf@h"<CR>
    onoremap <silent>il@ :<C-U>silent! execute "normal! ?\\w\\+@\\w\\+\\.[0-9a-zA-Z.]\\+\r:nohlsearch\rvf@h"<CR>
    onoremap <silent>a@ :<C-U>silent! execute "normal! /\\w\\+@\\w\\+\\.[0-9a-zA-Z.]\\+\r:nohlsearch\rgn"<CR>
    onoremap <silent>al@ :<C-U>silent! execute "normal! ?\\w\\+@\\w\\+\\.[0-9a-zA-Z.]\\+\r:nohlsearch\rgn"<CR>
" }}}


" Fold settings ------------------------------------------------------- {{{
    set foldmethod=indent
    nnoremap <space> za
    augroup FoldSet
        autocmd! BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
    augroup END
" }}}


" Toggle settings ---------------------------------------------------- {{{
" }}}


" CursorLine settings ------------------------------------------------- {{{
    " TODO: Netrw line, ` bold
    set cursorline
    hi clear CursorLine
    augroup CLClear
        autocmd! ColorScheme * hi clear CursorLine
    augroup END

    hi CursorLineNR cterm=bold
    augroup CLNRSet
        autocmd! ColorScheme * hi CursorLineNR cterm=bold
    augroup END
" }}}


" Conceal display ----------------------------------------------------- {{{
    function! ConcealDisplay()
        if !exists('b:cd')
            autocmd! ColorScheme * highlight Conceal ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
            highlight Conceal ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
            highlight link WhiteSpace Conceal
            let b:cd = 1
        endif
        
        syntax clear WhiteSpace
        syntax match WhiteSpace / / containedin=ALL conceal cchar=·
        setlocal conceallevel=2 concealcursor=c
    endfunction
" }}}


" Python file settings ------------------------------------------------ {{{
    augroup PythonGroup
        autocmd!
        autocmd FileType python nnoremap <buffer> <LocalLeader>c I#<Space><Esc>
        autocmd FileType python vnoremap <buffer> <LocalLeader>c I#<Space><Esc>
        autocmd FileType python :iabbr <buffer> iff if:<Left>
        autocmd BufEnter,WinEnter *.py call ConcealDisplay()
    augroup END
" }}}


" Vimscript file settings --------------------------------------------- {{{
    augroup VimGroup
        autocmd!
        autocmd FileType vim nnoremap <buffer> <LocalLeader>c I"<Space><Esc>
        autocmd FileType vim vnoremap <buffer> <LocalLeader>c I"<Space><Esc>
        autocmd FileType vim setlocal foldmethod=marker
        autocmd BufEnter,WinEnter *.vim,.vimrc call ConcealDisplay()
    augroup END
" }}}


" Shellscript file settings ------------------------------------------- {{{
    augroup ShGroup
        autocmd!
        autocmd FileType sh nnoremap <buffer> <LocalLeader>c I#<Space><Esc>
        autocmd FileType sh vnoremap <buffer> <LocalLeader>c I#<Space><Esc>
        autocmd BufEnter,WinEnter *.sh call ConcealDisplay()
    augroup END
" }}}


" Java file settings ------------------------------------------- {{{
    augroup JavaGroup
        autocmd!
        autocmd FileType java nnoremap <buffer> <LocalLeader>c I//<Space><Esc>
        autocmd FileType java vnoremap <buffer> <LocalLeader>c I//<Space><Esc>
        autocmd BufEnter,WinEnter *.java call ConcealDisplay()
    augroup END
" }}}

" Javascript file settings ------------------------------------------- {{{
    augroup JSGroup
        autocmd!
        autocmd FileType javascript set formatprg=prettier\ --parser\ typescript\ --tab-width\ 4 "\ --stdin
        autocmd BufWritePre *.js :silent! execute ":normal! gggqG\<c-o>\<c-o>"
        " autocmd BufWritePre *.js :normal gggqG
        autocmd FileType javascript nnoremap <buffer> <LocalLeader>c I//<Space><Esc>
        autocmd FileType javascript vnoremap <buffer> <LocalLeader>c I//<Space><Esc>
        autocmd BufEnter,WinEnter *.js call ConcealDisplay()
    augroup END
" }}}


" Markdown file settings ---------------------------------------------- {{{
    augroup MDGroup
        autocmd!
        autocmd FileType markdown set formatprg=prettier\ --parser\ markdown\ --tab-width\ 4 "\ --stdin
        autocmd BufWritePre *.md :silent! execute ":normal! gggqG\<c-o>\<c-o>"
        autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^[-=]\\{2,\\}$\r:nohlsearch\rkvg_"<CR>
        autocmd FileType markdown onoremap inh :<c-u>execute "normal! /^[-=]\\{2,\\}$\r:nohlsearch\rkvg_"<CR>
        autocmd FileType markdown onoremap ah :<c-u>execute "normal! ?^[-=]\\{2,\\}$\r:nohlsearch\rg_vk0"<CR>
        autocmd FileType markdown onoremap anh :<c-u>execute "normal! /^[-=]\\{2,\\}$\r:nohlsearch\rg_vk0"<CR>
    augroup END
" }}}


" Abbreviation settings ----------------------------------------------- {{{
    abbr teh the
    abbr tehn then
    abbr waht what
    abbr tempalte template
    abbr cahr char
    abbr retrun return
    abbr itn int
    abbr ehco echo
    abbr calss class
    iabbr @@@ chenyiha17@mails.tsinghua.edu.cn
" }}}


" May be used --------------------------------------------------------- {{{
    " autocmd VimEnter * echom ">^.^<"

    " this is to move in the vim way
    " inoremap <Left> <nop>
    " inoremap <Up> <nop>
    " inoremap <Right> <nop>
    " inoremap <Down> <nop>

    " autocmd BufNewFile *.py,*.vim,*.sh :normal \i
    " inoremap ()<Leader> ()<Left>
    " inoremap {}<Leader> {}<Left>
    " inoremap []<Leader> []<Left>

    " nnoremap <Leader>e dawf<space>pb
    " nnoremap <Leader>q daw2F<space>pb
    " nnoremap <Leader>D ddi<C-G>u<Esc>dd
" }}}
