set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Enable Line Numbers
set number

" Favorite Color Scheme
if has("gui_running")
   colorscheme torte
endif

; indenting is 2 spaces
set shiftwidth=2

" auto indent new lines
set autoindent

" does the right thing (mostly) in programs
set smartindent

" don't use actual tab character
set expandtab

" Only display 2 spaces for tabs
set tabstop=2

" To indent the current line, or a visual block:
"
" ctrl-t, ctrl-d  - indent current line forward, backwards 
"                   (insert mode)
" visual > or <   - indent block by sw (repeat with . )
" To stop indenting when pasting with the mouse, add this to your .vimrc:
" :set pastetoggle=<f5>
" then try hitting the F5 key while in insert mode (or just :set paste).


" dont keep a backup file
set nobackup
set nowritebackup

" show whitespace
" set list
" set listchars=tab:>.

" show hidden chars
set invlist

set diffexpr=MyDiff()

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq endfunction
