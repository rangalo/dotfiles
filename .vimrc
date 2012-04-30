if has("terminfo")
  set t_Co=8
  set t_Sf=[3%p1%dm
  set t_Sb=[4%p1%dm
  fixdel
else
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif
if &term == "Eterm"
    set t_kD=[3~
    set t_kb=
endif
if &term == "screen"
    set t_kD=[3~
    set t_kb=
endif
set background=dark
highlight Normal guibg=Black guifg=White

hi Comment ctermfg=darkcyan
hi Identifier ctermfg=lightgreen
hi PreProc cterm=underline
hi Search ctermbg=darkblue cterm=underline
" hi Pmenu ctermfg=White ctermbg=LightMagenta  cterm=Bold
hi PmenuSel ctermfg=White ctermbg=Black  cterm=Bold
syntax on
set nocompatible
set bs=2
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set noerrorbells
set exrc
set autowrite
set showmatch
set smartindent
set autoindent
set showcmd
set wildmenu 
" set mouse=a

filetype plugin indent on 
" Enable the ruler with the format:
" {buffer number}{modified/readonly flag}: {file type} [current line,
" current column] {position percentage in file}
set rulerformat=%25(%n%m%r:\ %Y\ [%l,%v]\ %p%%%)
set ruler
set nobackup
set number

" Do not highlight the string we searched.
set nohlsearch 
" Highlight the searched string, while typing.
set incsearch

set viminfo=c,h,'10,\"100,:20,%,n~/.viminfo

" mappings
:nmap ,ta :tabnew <cr>
:nmap ,tn :tabnext <cr>
:nmap ,tp :tabprevious <cr>
:nmap ,td :tabclose <cr>
:nmap <C-N><C-N> :set invnumber <CR>
imap ,,, <esc>diwi<<esc>pa><cr></<esc>pa><esc>kA

" Fuzy finder 
nmap ,ff :FufCoverageFile<CR>
nmap ,ft :tabnew<CR>:FufCoverageFile<CR>
nmap ,fb :FufBuffer<CR>

" copy/paste to/from system clipboard
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-v> <Esc><C-v>a


let g:pydiction_location = "/home/hardik/.vim/pydiction/complete-dict"

" closetags script
au Filetype html,xml,xsl,erb source ~/.vim/scripts/closetag.vim

autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd BufRead *.upl set syntax=html
autocmd BufRead *.cgi set syntax=per
autocmd BufRead *.grm set syntax=yacc

