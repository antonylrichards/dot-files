set nocompatible
set showcmd
set backspace=indent,eol,start
"set cmdheight=2
set cmdheight=1
"set mouse=a
"set dictionary+=/usr/share/lib/dict/words
set formatoptions+=l
set wildmode=list:longest
"when open opening new file, use existing file's directory as starting point
set autochdir

"set titlestring=%(\ %{$CLEARCASE_ROOT}:\ %)%(\ %F%)
"set statusline=%<%f%h%m%r%=%{$CLEARCASE_ROOT}\ %l,%c%V\ %P

".swp files go into the same directory
set directory=.


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set background="light"
  syntax enable
  " IOS Reg files
  au BufNewFile,BufRead *.mkelem                   so $VIM/syntax/c.vim
  au BufNewFile,BufRead *.lis                      so $VIM/syntax/c.vim
  au BufNewFile,BufRead *.anrichar                 so $VIM/syntax/c.vim
  au BufNewFile,BufRead *.i                        so $VIM/syntax/c.vim
  au FileType c,cpp,objc,objcpp call rainbow#load()

set hlsearch " Hightlight search terms
set incsearch " Show search matches as you type

"  hi Comment  term=bold ctermfg=DarkBlue guifg=Blue
"  hi Constant term=underline ctermfg=DarkRed guifg=Magenta
"  hi Special  term=bold ctermfg=DarkMagenta guifg=SlateBlue
  hi Identifier term=underline ctermfg=Blue guifg=DarkCyan
  hi Statement term=bold ctermfg=Blue gui=bold guifg=Brown
"  hi PreProc  term=underline ctermfg=DarkMagenta guifg=Purple
"  hi Type     term=underline ctermfg=DarkGreen guifg=SeaGreen gui=bold
  hi Type     term=underline ctermfg=DarkMagenta guifg=SeaGreen gui=bold
"  hi Ignore   ctermfg=white guifg=bg
  hi LineNr   ctermfg=DarkBlue
   hi MatchParen cterm=none ctermbg=green ctermfg=blue

endif

set expandtab
set smarttab
set ai shell=bash nowarn ts=8
set noap sw=2 wrapmargin=1 showmatch
"set tags=tags,/vob/ios/sys/tags;
"set tags=tags;
"look in the current directory, then work our way up
set tags=./tags;/
map  :n
"map [21~ O/************************************************************:w
map [21~ ostd::cout << "ALR " << __FUNCTION__ << std::endl;
map [23~ :set filetype=java
map [24~ :set filetype=c
map [19~ :%s/.//
map [2~ +
map [3~ -


filetype on
filetype indent on
filetype plugin on

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

if has('autocmd')
    autocmd filetype html, xml set listchars-=tab:>.
endif

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"autocmd Filetype make setlocal noet

" Set proper options for C, mail and other files
" Dont switch the order of the following two autocmds
autocmd BufEnter * setlocal formatoptions=tcqro2n
"autocmd FileType c,cpp setlocal formatoptions=croq textwidth=0
autocmd FileType c,cpp setlocal formatoptions=croql textwidth=0
autocmd FileType mail setlocal complete+=k

autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif


"Additions for global/gtags
map  :GtagsCursor
map  :cn
map  :cp

"fake cscope
set csprg=gtags-cscope
if filereadable("GTAGS")
  cs add GTAGS
endif

"cscopde_maps settings
set cscopetag
set csto=0

"when you press ,s all the words matching the word
"under the cursor will be highlighted. When you again press ,s the
"highlighting will be removed.
nnoremap <silent> ,s :if !&hlsearch <bar><bar> @/ != expand("<cword>")
          \ <bar> let @/=expand("<cword>") <bar> set hlsearch <bar> else
          \ <bar> set nohlsearch <bar> endif<CR>


syn keyword	cType		uint
