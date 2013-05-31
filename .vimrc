" Essentials at the top so can easy copy and paste
syntax on

set backspace=indent,eol,start " =2
set ff=unix
"set foldmethod=marker
set ignorecase
set indentkeys=   " stops clever auto-indent when typing
set iskeyword+=:  " include Perls :: seperators
set modeline
set noautoindent
set nosmartindent
set ruler
set wrap
" indenting can suck
set expandtab      " This forces tabs expansion even when wanted in Makefiles.
set softtabstop=4  " feels like tabs but uses both. use with expandtab to have no tabs. 
set shiftwidth=4    " # of spaces to use for each stop of indent.
set tabstop=4       " set to same as shiftwidth
" set nolist  " don't show hidden chars (like tabs)

" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" I have fat fingers.
map :W :w
map :Q :q
map :wQ :wq


" Paste mode toggle with <F12>
nnoremap <F12> :set invpaste paste?<CR>
imap <F12> <C-O><F12>
set pastetoggle=<F12>


" Run perltidy over a block
map ,pt <Esc>:'<,'>! perltidy<CR>

" Run over file
map <F4> !perltidy -q -pbp<CR>

""""""""""""""""""""""
"    Luxury items    "
""""""""""""""""""""""

" enable 256 colours 
set t_Co=256 

" How many colours should I use.
"
if $TERM =~ '^xterm'
        set t_Co=256
elseif $TERM =~ '^screen'
        set t_Co=256            " just guessing
elseif $TERM =~ '^rxvt'
        set t_Co=88
elseif $TERM =~ '^linux'
        set t_Co=8
else
        set t_Co=16
endif

set background=dark
"colorscheme solarized          " http://ethanschoonover.com/solarized
"colorscheme desert             " 16 colour
"colorscheme ps_color
"colorscheme xoria256           " 256 colour
colorscheme desert256           " 256 colour
"colorscheme zenburn             " 256 colour
"colorscheme gardener            " 256 colour
"colorscheme inkpot              " 256 colour
"colorscheme blacklight          " 256 colour

"let g:zenburn_high_Contrast = 1
"let g:zenburn_alternate_Visual = 1


"au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 
au BufNewFile,BufRead *Elements/* set filetype=mason
au BufNewFile,BufRead autohandler set filetype=mason
au BufNewFile,BufRead syshandler set filetype=mason
au BufNewFile,BufRead dhandler set filetype=mason
au BufNewFile,BufRead *.html set filetype=mason
au BufNewFile,BufRead *.sql set filetype=mysql

" Map shift-arrow movement to scroll up/down
map <s-down> <c-e>
map <s-up> <c-y>

" Toggle some beginning of line comments
map <F9> :s/^/#XXX /<CR>
map <F10> :s/^#XXX //<CR>

" Perl Vim folding: http://www.linux.com/articles/114138
function GetPerlFold()
    if getline(v:lnum) =~ '^\s*sub '
        return ">1"
    elseif getline(v:lnum + 2) =~ '^\s*sub ' && getline(v:lnum + 1) =~ '^\s*$'
        return "<1"
    else
        return "="
    endif
endfunction
"setlocal foldexpr=GetPerlFold()
"setlocal foldmethod=expr 

" VCS Plugin.
nmap ,cd <Plug>VCSVimDiff
nmap ,cb <Plug>VCSAnnotate!

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

