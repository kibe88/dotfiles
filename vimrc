let mapleader = ","
let maplocalleader = "\\"
let s:dotvim=expand('<sfile>:p:h') . "/.vim/"
set nocompatible " turn off vi compat

" turns filetype plugins on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

" easy plugin installation
map <Leader>i :PlugInstall<CR>

" Shows silverlight search results in a split window
Plug 'rking/ag.vim'
nnoremap <Leader>a :Ag -i<space>
" Search for word under the cursor
nnoremap <Leader>aw :Ag <cword><CR>
" Search for usages of the current file
nnoremap <Leader>acf :exec "Ag " . expand("%:t:r")<CR>

" Configures all tab related plugins
Plug 'Shougo/neocomplete'
" This makes sure we use neocomplete completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out.
 let g:neocomplete#force_overwrite_completefunc = 1

Plug 'Shougo/neosnippet'
Plug 'honza/vim-snippets' " snippets collection
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets={'_' : 1,} "disable default neosnippets
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets' "Prefer honza vim snippets

Plug 'mattn/emmet-vim' "zencode html output
" Enable emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,eruby,css EmmetInstall

" Tab awesomeness providing tab chains
Plug 'neitanod/vim-clevertab'
" neosnippet tab chain (default is ultisnippets)
inoremap <silent><TAB> <c-r>=CleverTab#Complete('start')<CR>
                    \<c-r>=CleverTab#Complete('tab')<CR>
                    \<c-r>=CleverTab#Complete('neosnippet')<CR>
                    \<c-r>=CleverTab#Complete('keyword')<CR>
                    \<c-r>=CleverTab#Complete('neocomplete')<CR>
                    \<c-r>=CleverTab#Complete('omni')<CR>
                    \<c-r>=CleverTab#Complete('stop')<CR>
inoremap <silent><S-TAB> <c-r>=CleverTab#Complete('prev')<CR>

" git wrapper
Plug 'tpope/vim-fugitive'
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gmv :Gmove<CR>
nnoremap <Leader>gb :GBrowse<CR>
nnoremap <Leader>gcam :Git commit --ammend --reuse-message=HEAD<CR>
" global git search for word under the cursor (with highlight) (taken from vimified)
nmap <Leader>gf :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
vmap <Leader>gf y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>eaip)
nmap <Leader>ea <Plug>(EasyAlign)

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" All about surroundings i.e you can change 'a' to [a] using cs'[
Plug 'tpope/vim-surround'
" From: https://github.com/skwp/dotfiles/blob/master/vim/settings/surround.vim
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"    " -
let g:surround_61 = "<%= \r %>"   " ="

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
let g:syntastic_check_on_open = 1
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

" Auto change vim dir based on the 'project' root directory (defaults to vcs)
Plug 'airblade/vim-rooter'
let g:rooter_change_directory_for_non_project_files=1 "behaves like autochdir for on project files
let g:rooter_silent_chdir=1 "don't echo dir after opening a file

Plug 'scrooloose/nerdtree'
set guioptions-=r
set guioptions-=L
let g:NERDTreeWinSize=28
let g:NERDTreeChDirMode=2
map <Leader>s :NERDTreeToggle<CR>
" autocloses nerdtree (and therefore vim) if it's the only buffer left
function! s:CloseNERDTreeIfOnlyBufferLeft()
if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
  q
endif
endfunction
augroup autoclose_nerdtree
  autocmd bufenter * call s:CloseNERDTreeIfOnlyBufferLeft()
augroup END

" TMUX integration
" See http://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
let g:VimuxOrientation="h"
let g:VimuxHeight = "45"
" opens up clean terminal pane in tmux using vimux (hi is an alias to clear)
nnoremap <Leader>t :VimuxRunCommand("hi")<CR>

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

" Creates non existent dirs automatically
Plug 'pbrisbin/vim-mkdir'

" fuzzy file search (edited to use ag)
Plug 'ctrlpvim/ctrlp.vim'
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that ctrlp doesnt need cache
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_working_path_mode = '' "removes ctrlp chdir behavior as there's a plugin that does it already
let g:ctrlp_reuse_window=1
nmap <Leader>cf :CtrlPBufTag<CR>

" Easy buffer management through a single list
Plug 'troydm/easybuffer.vim'
nmap <Leader>bt :EasyBufferToggle<cr>

 " sublime text like multiple selection and edition
 Plug 'terryma/vim-multiple-cursors'
" Code below prevents conflict with NeoComplete
" See: https://github.com/terryma/vim-multiple-cursors#interactions-with-other-plugins
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction
" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

 "Only show cursorline in the current window and in normal mode.
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
let g:scratch_height = 45
"scratch needs this to autohide window when leaving insert mode
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

" Rename the current buffer
Plug 'danro/rename.vim'
map <Leader>mv :Rename<Space>

Plug 'xolox/vim-easytags' | Plug 'xolox/vim-misc'
" writes to the first tag file vim resolves which means git when fugitive is
" installed
let g:easytags_dynamic_files=1 
let g:easytags_cmd='/usr/local/bin/ctags'
let g:easytags_auto_highlight=0
let g:easytags_async=1

" ctag tag navigation through ctrlp (in case of one match acts like ide goto)
Plug 'ivalkeen/vim-ctrlp-tjump'
nnoremap gf :CtrlPtjump<cr>
vnoremap gf :CtrlPtjumpVisual<cr>

" ReactJS syntax highlighting (depends on vim javascript)
Plug 'mxw/vim-jsx' | Plug 'vim-javascript'
let javascript_enable_domhtmlcss = 1

" Vim motion plugin that jumps to any location specified by two characters
Plug 'justinmk/vim-sneak'
let g:sneak#streak = 1

" Automatic closing off quotes, brackets and such
Plug 'Raimondi/delimitMate'

" Configures whitespace behavior
Plug 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_on_save = 0 " as most people don't remove their own...
map <silent><Leader>rw :StripWhitespace<CR> " mapping to remove all whitespace from current file
map <silent><Leader>tw :ToggleWhitespace<CR>
let g:better_whitespace_enabled = 0

" Remove whitespace only from edited lines
Plug 'thirtythreeforty/lessspace.vim'

" Installs the most recent version of match it
Plug 'vim-scripts/matchit.zip'

" Better startup screen
Plug 'mhinz/vim-startify'
augroup change_startify_buffer
  autocmd FileType startify setlocal buftype=
augroup END
nmap <Leader>st :Startify<CR>
let g:startify_list_order = [
      \ ['   Bookmarks '], 'bookmarks',
      \ ['   MRU '],       'files' ,
      \ ['   MRU DIR '],   'dir',
      \ ['   Sessions '],  'sessions',
      \ ]

let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ 'bundle/.*/doc',
  \ ]

let g:startify_bookmarks=[ {'v': '~/dotfiles/vimrc'}, {'a': '~/Projects/estante/amsterdam'}]
let g:startify_change_to_dir= 0
let g:startify_change_to_vcs_root=0
let g:startify_enable_special=0
let g:startify_files_number=8
let g:startify_session_autoload=1
let g:startify_session_delete_buffers=1
let g:startify_session_persistence=1

function! s:center_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
  let centered_lines = map(copy(a:lines), 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:center_header(split(system('fortune | cowthink'), '\n'))

" Git repo viewer (like gitk)
Plug 'gregsexton/gitv' | Plug 'tpope/vim-fugitive'
map <Leader>gv :Gitv<CR>

call plug#end()

" backups
exec 'set backupdir='.s:dotvim.'/tmp/backup//'

" swap into its own dir
exec 'set directory='.s:dotvim.'/tmp/swap//'
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
exec 'set undodir='.s:dotvim.'/tmp/undo//'
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
set tabstop=4 "4space tab
set softtabstop=4 "Causes backspace to delete 4 spaces = converted <TAB>
set shiftwidth=4 "The amount to block indent when using < and >
set expandtab  "Replaces a <TABwith spaces--more portable
set formatoptions+=j
set cpo+=J
set smarttab "Uses shiftwidth instead of tabstop at start of lines

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

" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <Leader>yo "*y
nnoremap <Leader>po "*p

" clear highlight after search
noremap <silent><Leader><space> :nohls<CR>
set hlsearch " turn on search highlighting
set incsearch " do incremental searching

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
nnoremap <Leader>eg <C-w>s<C-w>j:e ~/.gitconfig<cr>
nnoremap <Leader>ep <C-w>s<C-w>j:e ~/.profile<cr>
nnoremap <Leader>et <C-w>s<C-w>j:e ~/.tmux.conf<cr>

" vim config file configuration
augroup ft_vim
  au!
  au FileType vim set foldmethod=marker tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  au FileType help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

set lazyredraw

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

" maps commom vi typos so I won't go insane
command! W :w
command! Wq :wq
command! Q :q

" folding options
set foldlevelstart=0
set foldmethod=syntax

" map default zz mapping to zm.
nnoremap zm zz
vnoremap zm zz

" zz to toggle folds.
nnoremap zz za
vnoremap zz za

" zZ to toggle folds recursivily
nnoremap zZ zA
vnoremap zZ zA

" za to open all folds
nnoremap za zR
vnoremap za zR

" zA to close all folds
nnoremap zA zM
vnoremap zA zM

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Fast saving
nmap <Leader>w :w!<cr>
nmap <Leader>wq :wq!<cr>

" Reload files changed outside vim. This makes vim act like most editors.
" see: http://items.sjbach.com/319/configuring-vim-right
set autoread
set fileformats+=mac

" deals with unsaved buffer more conveniently
set confirm

set notimeout          " don't timeout on mappings
set ttimeout           " do timeout on terminal key codes
set timeoutlen=100     " timeout after 100 msec

set guicursor+=n-v-c:blinkon0 " disable cursor blinking in all modes

" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null
nnoremap <Leader>ws :w!!<CR>
