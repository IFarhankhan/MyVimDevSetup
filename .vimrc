syntax on

" line number
set number
inoremap <C-e> <C-o>A

" setting color ide color 256
set t_Co=256

" highlighting search 
set hlsearch

" incrmentsearch settings
set incsearch 

" splash screen 
set shortmess=I "turn off splash screen"

set cindent

" setting windows splits 
set splitbelow
set splitright

" Setting  key combination for split mode movement "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Setting key movements in Insert mode and Command-line mode via the <Alt> modifier key
noremap! <A-h> <Left>
noremap! <A-j> <Down>
noremap! <A-k> <Up>
noremap! <A-l> <Right>

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"  Plugins 
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on 
Plugin 'tmhedberg/SimpylFold'

" Enale folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

" python file indent
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" html file indent
au BufNewFile,BufRead *.html  
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" css file indent
au BufNewFile,BufRead *.css  
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" for auto indent for genral files 
autocmd BufReadPost * :DetectIndent 
let g:detectindent_preferred_expandtab = 22
let g:detectindent_preferred_indent = 2 

" for js/coffee/jade files, 4 spaces
"autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab

" for Ruby/Scala files
autocmd Filetype ruby set softtabstop=2
autocmd Filetype ruby set sw=2
autocmd Filetype ruby set ts=2

autocmd Filetype scala set softtabstop=2
autocmd Filetype scala set sw=2
autocmd Filetype scala set ts=2

" for C++/C files 
autocmd Filetype cpp set softtabstop=2
autocmd Filetype cpp set sw=2
autocmd Filetype cpp set ts=2


" for haml
autocmd Filetype haml set softtabstop=2
autocmd Filetype haml set sw=2
autocmd Filetype haml set ts=2
Plugin 'vim-scripts/indentpython.vim'

" Removing white spacing 
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" Setting UTF8 Support
set encoding=utf-8
Plugin 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
" let g: ycm_global_ycm_extra_conf = '/Users/frrank/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
   project_base_dir = os.environ['VIRTUAL_ENV']
   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
   execfile(activate_this, dict(__file__=activate_this))
EOF
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

let python_highlight_all=1
" setting color scheme for vim
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

if has('gui_running')
      set background=dark
      colorscheme solarized
else
      colorscheme zenburn
endif
call togglebg#map("<F5>")


"Syantastics settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" nerdtree color
Plugin 'scrooloose/nerdtree'

" ignoreing files on nerdtree 
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plugin 'tpope/vim-fugitive'

" setting the powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" setting system clipboard
set clipboard=unnamed

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

" Adding plugins 
Plugin 'janko-m/vim-test'
Plugin 'kana/vim-textobj-user'
Plugin 'https://github.com/whatyouhide/vim-textobj-erb'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ngmy/vim-rubocop'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-endwise'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jreybert/vimagit'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'marijnh/tern_for_vim'
Plugin 'fugitive.vim'
Plugin 'Vim-Rspec'
Plugin 'endwise.vim'
Plugin 'rails.vim'
Plugin 'ruby.vim'
Plugin 'bundler'
Plugin 'dag/vim-fish'
Plugin 'ivyl/vim-bling'
Plugin 'sheerun/vim-polyglot'
Plugin 'tommcdo/vim-lion'
Plugin 'gregsexton/gitv'
Plugin 'mtth/scratch.vim'
Plugin 'honza/vim-snippets'
Plugin 'DetectIndent'
Plugin 'cscope.vim'
Plugin 'c.vim'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'raimondi/delimitmate'
Plugin 'guns/vim-clojure-static'
Plugin 'othree/html5.vim'
" Plugin 'luchermitte/lh-cpp'
Plugin 'horosphere/formatgen'
Plugin 'docker/docker'
Plugin 'jparise/vim-graphql'
Plugin 'derekwyatt/vim-scala'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'JulesWang/css.vim'
Plugin 'vim-json-bundle'
Plugin 'Chiel92/vim-autoformat'
Plugin 'fsharp/vim-fsharp'
"Plugin 'jshint.vim'
Plugin 'unite.vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlp.vim'

" += C.vim config
let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes'

" ++ Html5 config 
let g:html5_event_handler_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
" ++ nerdcommenter 
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" ++ jsx settings 
let g:jsx_pragma_required = 1

" ++ pangloss 
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax



" ++ tern settings 
"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'


" ++ delimitmate ++ settings
imap <C-c> <CR><Esc>O

"++air-line++ settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"+++ Go +++
let $GO_ENV="test"
autocmd FileType go map <leader>a :AV<cr>
autocmd FileType go map <leader>go :w<CR>:!go run %<enter>

" if exists('$TMUX')
"   autocmd filetype go map <leader>go :w<cr>:VimuxRunCommand("clear; go run ". bufname("%"))<enter>
" else
"   autocmd FileType go map <leader>go :w<CR>:!go run %<enter>
" endif
autocmd FileType go map <leader>go :w<CR>:GoRun<enter>

autocmd FileType go map <leader>mm :!tt rr<enter>
autocmd FileType go map <leader>mt :TestFile<enter>
autocmd FileType go map <leader>mtl :TestNearest<enter>
autocmd FileType go map <leader>b :w<CR>:!./bench.sh<enter>
autocmd FileType go map <leader>l :w<CR>:!gometalinter ./...<enter>
autocmd FileType xml map <leader>l :w<CR>:silent %!xmllint --encode UTF-8 --format -<enter>
autocmd FileType go map <leader>v :w<CR>:GoVet<enter>

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

set updatetime=100


" let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_alternate_mode = "vsplit"
let g:syntastic_go_checkers = ['golint']


let $GOPATH = $GOPATH
let g:go_bin_path = "/usr/local/bin"
let g:go_fmt_command = "goimports"



"+++ CtrlP +++
set runtimepath^=~/.vim/bundle/ctrlp.vim 
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 10
let g:ctrlp_mruf_max = 250
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

func! MyPrtMappings()
  let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
  \ }
endfunc

func! MyCtrlPTag()
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
\ 'AcceptSelection("t")': ['<c-t>'],
\ }
CtrlPBufTag
endfunc

let g:ctrlp_buffer_func = { 'exit': 'MyPrtMappings' }
com! MyCtrlPTag call MyCtrlPTag()

let g:ctrlp_buftag_types = {
\ 'go'         : '--language-force=go --golang-types=ftv',
\ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
\ 'markdown'   : '--language-force=markdown --markdown-types=hik',
\ 'objc'       : '--language-force=objc --objc-types=mpci',
\ 'rc'         : '--language-force=rust --rust-types=fTm'
\ }
let g:ctrlp_cmd = 'CtrlPMixed'


" let g:ctrlp_by_filename = 1
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_open_new_file = 'et'

map <leader>p :ClearCtrlPCache<cr>:CtrlP<enter>

"+++ CSS/SCSS +++
"au BufWrite *.css :Autoformat
"au BufWrite *.scss :Autoformat

"+++ HTML +++
au BufWrite *.html.erb :Autoformat
au BufReadPost *.html set syntax=mustache
let g:mustache_abbreviations = 1

"+++ JavaScript/CoffeeScript +++
autocmd FileType js map <leader>js :!node %<enter>
autocmd FileType coffee map <leader>cs :!coffee %<enter>
" autocmd BufRead,BufNewFile *.es6 setfiletype javascript
" au BufWrite *.js :Autoformat
au BufWrite *.es6 :Autoformat
au BufWrite *.json :Autoformat
" let g:neomake_javascript_enabled_makers = ['eslint']

let g:jsx_ext_required = 0
au BufWrite *.jsx :Esformatter
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0


"+++ Tmux +++
" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)
" function! WrapForTmux(s)
"   if !exists('$TMUX')
"     return a:s
"   endif
"
"   let tmux_start = "\<Esc>Ptmux;"
"   let tmux_end = "\<Esc>\\"
"
"   return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
" endfunction
"
" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")
"
" function! XTermPasteBegin()
"   set pastetoggle=<Esc>[201~
"   set paste
"   return ""
" endfunction
"
" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"
" if exists('$TMUX')
"   " set term=screen-256color
" endif
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"+++ UltiSnips +++
let g:UltiSnipsExpandTrigger="<c-]>"
let g:UltiSnipsEditSplit="vertical"

au FileType *.jsx :UltiSnipsAddFiletypes javascript.jsx.html



"+++ Ruby +++
" autocmd FileType ruby map <leader>a :vsp<cr>:!alt_file %<cr><cr>:A<cr>

autocmd FileType ruby map <leader>a :AV<cr>
autocmd FileType ruby map <leader>rs :!$GEM_HOME/bin/bundle exec rspec %<enter>

autocmd FileType ruby map <leader>rb :!ruby -Ilib -Itest -Ispec %<enter>
autocmd FileType ruby map <leader>rc :!rubocop -a %<enter>
autocmd FileType ruby map <leader>mt :!tt ruby %<enter>
autocmd FileType ruby map <leader>mm :!tt rr<enter>
autocmd FileType ruby map <leader>mtl :!tt ruby %:<C-r>=line('.')<CR><CR>

" Vim-JavaScript settings
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END



" ++ Errors ++ with configuration 
" au BufWrite *.rb :Autoformat
" autocmd BufWrite *.rb :Rubocop -a
" au BufWrite *.rb :!rubocop\ -a\ -s\ -o\ \/tmp\/rcop %<enter>
" au BufWrite *.rb :.,$!rubocop -a %<cr>


function! EnsureExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path))
    endif
endfunction

" persistent undo
if exists('+undofile')
    set undofile
    set undodir=~/.vim/.cache/undo
endif

" backups
set backup
set backupdir=~/.vim/.cache/backup

" swap files
set directory=~/.vim/.cache/swap
set noswapfile

map <F10> :w<CR> :!clear; make<CR> :!./%<<CR>

