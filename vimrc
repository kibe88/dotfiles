let mapleader = ","
let maplocalleader = "\\"
let dotvim=expand('<sfile>:p:h') . "/.vim/"
set nocompatible " turn off vi compat

call plug#begin('~/.vim/plugged')

" easy plugin installation
map <Leader>i :PlugInstall<CR>

" shows silverlight search results in a split window
Plug 'rking/ag.vim'
nnoremap <Leader>a :Ag -i<space>

" Configures all tab related plugins
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " snippets collection
" Map ultisnips triggers to tab
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
Plug 'mattn/emmet-vim' " zencode html output
let g:user_emmet_leader_key='<Tab>' "maps emmet trigger to tab
" Enable emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,erb,css EmmetInstall
Plug 'ervandew/supertab' " awesome tab

" git wrapper
Plug 'tpope/vim-fugitive'
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>eaip)
nmap <Leader>ea <Plug>(EasyAlign)

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

 " statusbar
 Plug 'bling/vim-airline'
 let g:airline_powerline_fonts = 1

"syntax checker
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"
" additional checkers
Plug 'myint/syntastic-extras'
let g:syntastic_yaml_checkers = ['pyyaml']
let g:syntastic_javascript_checkers = ['json_tool']
let g:syntastic_make_checkers = ['gnumake']

" colorscheme
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree'
map <Leader>s :NERDTreeToggle<CR>
set guioptions-=r
set guioptions-=L
let NERDTreeWinSize=28

" TMUX integration
" See http://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
let g:VimuxHeight = "25"

" tmux + vim + rspec integration
Plug 'skalnik/vim-vroom'
let g:vroom_use_vimux = 1
" reset vrom mappings
let g:vroom_map_keys = 0
" override default vroom mappings
nnoremap <Leader>rc :VroomRunTestFile<CR>
nnoremap <Leader>rn :VroomRunNearestTest<CR>
nnoremap <Leader>rl :VroomRunLastTest<CR>

Plug 'tpope/vim-bundler'
nnoremap <Leader>b :Bundle<CR>
nnoremap <Leader>be :Bopen<CR>

Plug 'scrooloose/nerdcommenter'

" Ruby on Rails integration
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'vim-utils/vim-ruby-fold' "only folds methods (on rspec files it folds it blocks as well)
Plug 'tpope/vim-rbenv'

autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Html formatting
Plug 'tpope/vim-haml'
Plug 'juvenn/mustache.vim'
Plug 'tpope/vim-markdown'
Plug 'digitaltoad/vim-jade'
Plug 'slim-template/vim-slim'

au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.md set filetype=markdown

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" Creates non existente dirs automatically
Plug 'pbrisbin/vim-mkdir'

" fuzzy file search (edited to use ag)
Plug 'kien/ctrlp.vim'
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that ctrlp doesnt need cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_working_path_mode = ''

" Easy buffer management through a single list
 Plug 'troydm/easybuffer.vim'
 nmap <Leader>bt :EasyBufferToggle<cr>

 " sublime text like multiple selection and edition
 Plug 'terryma/vim-multiple-cursors'

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

 " indentation guidelines
 Plug 'Yggdroot/indentLine'
 set list lcs=tab:\|\
 let g:indentLine_char = '∙'
 " other useful characters
 "let g:indentLine_char = '∙▹¦'

" adds gutter with git diff info
Plug 'airblade/vim-gitgutter'

" adds new text object representing lines of code at the same indent level
" (python, haml)
Plug 'michaeljsmith/vim-indent-object'

" window buffer to take simple notes in the current vim session
Plug 'mtth/scratch.vim'
let g:scratch_horizontal = 0 " set scratch to open vertically
let g:scratch_top = 0 " when scratch is set to open vertically top means _left
let g:scratch_height = 40
"scratch needs it to be set to autohide window when leaving insert mode"
set hidden 
" sets keys to my liking (<Leader>gs is already used by fugitive)
let g:scratch_no_mappings = 1
nmap <Leader>n <plug>(scratch-insert-reuse)
nmap <Leader>N <plug>(scratch-insert-clear)
xmap <Leader>n <plug>(scratch-selection-reuse)
xmap <Leader>N <plug>(scratch-selection-clear)

Plug 'rizzatti/dash.vim'
nmap <silent> <Leader>dw <Plug>DashSearch
map <Leader>ds :Dash<Space>

Plug 'danro/rename.vim'

Plug 'szw/vim-tags'
map <Leader>ct :TagsGenerate!<CR>

" ReactJS syntax highlighting (depends on vim javascript)
Plug 'mxw/vim-jsx' | Plug 'vim-javascript'
let javascript_enable_domhtmlcss = 1

" Vim motion plugin that jumps to any location specified by two characters
Plug 'justinmk/vim-sneak'
let g:sneak#streak = 1

" Set number in insert mode and provides a toggler between number/relativenumber
Plug 'myusuf3/numbers.vim'
nnoremap <Leader>nt :NumbersToggle<CR>

" Automatic closing off quotes, brackets and such
Plug 'Raimondi/delimitMate'

" Configures whitespace behavior
Plug 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_on_save = 0 " as most people don't remove their own...
map <silent><Leader>rw :StripWhitespace<CR> " mapping to remove all whitespace from current file
" Show trailing whitespace on insert mode only
let g:better_whitespace_enabled = 0
augroup trailing
    au!
    au InsertEnter * :EnableWhitespace
    au InsertLeave * :DisableWhitespace
augroup END
" Remove whitespace only from edited lines
Plug 'thirtythreeforty/lessspace.vim'

" Installs the most recent version of match it
Plug 'vim-scripts/matchit.zip'

" Better startup screen
Plug 'mhinz/vim-startify'

" Git repo viewer (like gitk)
Plug 'gregsexton/gitv' | Plug 'tpope/vim-fugitive'
map <Leader>gv :Gitv<CR>

call plug#end()

" backups
exec 'set backupdir='.dotvim.'/tmp/backup//'

" swap into its own dir
exec 'set directory='.dotvim.'/tmp/swap//'
set backup
set noswapfile

" general settings
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set encoding=utf-8
set history=1000
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" undo files
exec 'set undodir='.dotvim.'/tmp/undo//'
set undofile
set undolevels=3000
set undoreload=10000

" keybind to source vimrc
nnoremap <Leader>v :source $MYVIMRC<CR>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <Leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" colorscheme
set background=dark
" set it silently cause the colorscheme may not exist yet
silent! colorscheme gruvbox

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" indentation
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wrap
set formatoptions+=j
set cpo+=J

" Numbers
set number
set numberwidth=4

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" force navigation through hjkl
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" backspace acting normally
set backspace=2

" turns filetype plugins on
filetype plugin indent on

" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <Leader>yo "*y
nnoremap <Leader>po "*p

" clear highlight after search
noremap <silent><Leader><space> :nohls<CR>
set hlsearch " turn on search highlighting
set incsearch " do incremental searching

" better ESC
inoremap <C-k> <Esc>

" always reload vimrc after save
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" easy tab navigation
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tn :tabnext<CR>

" easy buffer navigation
noremap <Leader>bp :bprevious<cr>
noremap <Leader>bn :bnext<cr>

" Splits ,sv and ,sh to open new splits (vertical and horizontal)
nnoremap <Leader>sv <C-w>v<C-w>l
nnoremap <Leader>sh <C-w>s<C-w>j

" quickly edit config files
nnoremap <Leader>ev <C-w>s<C-w>j:e $MYVIMRC<cr>
exec 'nnoremap <Leader>es <C-w>s<C-w>j:e '.dotvim.'/snippets/<cr>'
nnoremap <Leader>eg <C-w>s<C-w>j:e ~/.gitconfig<cr>
nnoremap <Leader>ep <C-w>s<C-w>j:e ~/.profile<cr>
nnoremap <Leader>et <C-w>s<C-w>j:e ~/.tmux.conf<cr>

" vim config file configuration
augroup ft_vim
  au!
  au FileType vim setlocal foldmethod=marker
  au FileType help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" Don't redraw while executing macros
set nolazyredraw

" Disable the macvim toolbar
set guioptions-=T

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪

" Always use vertical diffs
set diffopt+=vertical

" fixes vim background in tmux
if &term =~ '256color'
    set t_ut=
endif

" creates a private gist from the visual selection with the filename as the gist name
" requires gist cli tool
noremap <Leader>G :w !gist -p -t %:e \| pbcopy<cr>

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" maps commom vi typos so we won't go insane
command! W :w

" folding options
set foldlevelstart=0
set foldmethod=syntax

" zz to toggle folds.
nnoremap zz za
vnoremap zz za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" opens up clean terminal pane in tmux using vimux (hi is an alias to clear)
nnoremap <Leader>t :VimuxRunCommand("hi")<CR>

" Fast saving
nmap <Leader>w :w!<cr>

" Reload files changed outside vim. This makes vim act like most editors.
" see: http://items.sjbach.com/319/configuring-vim-right
set autoread
set fileformats+=mac

" set ctags filepath
setglobal tags-=./tags tags-=./tags; tags^=./tags;
