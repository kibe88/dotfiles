let mapleader = ","
let maplocalleader = "\\"
let g:dotvim = $HOME . "/.vim/"
let g:dotfiles = $HOME . "/dotfiles"
let g:repovimrc = g:dotfiles . "/vimrc"
let $MYVIMRC = g:repovimrc
let $MYVIMRCFILES = g:repovimrc.','.$MYVIMRC
set nocompatible " Turn off vi compat

" Turns filetype plugins on
filetype plugin indent on

" Installs vim plug if isn't already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Begin plugin config (Any plugin related settings are below its install command)
call plug#begin('~/.vim/plugged')

" Configures all tab related plugins
  Plug 'mattn/emmet-vim' " Zencode html output Enable emmet just for html/css
  " vscode like completion system
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  " Snippet solution for coc
  Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
  Plug 'honza/vim-snippets' " Snippets collection
  " Coc language servers
  Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'} " ruby using solargraph
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'} " javascript/typescript
  Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'} " python
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'} " json
  Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile'} " php
  Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'} " php
  Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " highlight
  Plug 'neoclide/coc-markdown', {'do': 'yarn install --frozen-lockfile'} " highlight

  " adds completion of words in additional tmux-panes
  Plug 'wellle/tmux-complete.vim'

  " Git wrapper
  Plug 'tpope/vim-fugitive'

  " Integrates fugitive with github hub
  Plug 'tpope/vim-rhubarb'

  Plug 'junegunn/vim-easy-align'

  Plug 'tpope/vim-endwise', { 'for': 'ruby' } "autoclose ruby code with end
  Plug 'tpope/vim-repeat' " repeat plugin maps with dot as well
  Plug 'tpope/vim-unimpaired'

  " All about surroundings i.e you can change 'a' to [a] using cs'[
  Plug 'tpope/vim-surround'

  " adds filetype icons for common vim plugins like nerdtree, vimfiler, and such
  " using nerd patched fonts
  Plug 'ryanoasis/vim-devicons'

  " Statusbar
  Plug 'bling/vim-airline'

  " Syntax checker
  Plug 'dense-analysis/ale'

  " Colorscheme
  Plug 'morhetz/gruvbox'
  Plug 'jacoborus/tender.vim'
  Plug 'junegunn/seoul256.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'ayu-theme/ayu-vim'

  " filetree sidebar
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

  " Auto change vim dir based on the 'project' root directory (defaults to vcs)
  Plug 'airblade/vim-rooter'

  " tmux integration
  " see http://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
  Plug 'christoomey/vim-tmux-navigator'

  " easily comment code
  Plug 'scrooloose/nerdcommenter'

  " Ruby on Rails integration
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'kana/vim-textobj-user', { 'for': 'ruby' }
  Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
  Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
  Plug 'vim-utils/vim-ruby-fold', { 'for': 'ruby' } " Only folds methods (folds 'it' blocks in rspec files as well)

  " Html formatting
  Plug 'tpope/vim-haml', { 'for': 'html' }
  Plug 'mustache/vim-mustache-handlebars', { 'for': 'html' }
  Plug 'tpope/vim-markdown', { 'for': 'html' }
  Plug 'digitaltoad/vim-jade', { 'for': 'html' }
  Plug 'slim-template/vim-slim', { 'for': 'html' }

  " better json syntax highlighting
  Plug 'elzr/vim-json', { 'for': 'json' }

  " Jsonc syntax highlighting
  Plug 'kevinoid/vim-jsonc', { 'for': ['json', 'jsonc'] }

  Plug 'pbrisbin/vim-mkdir'

  " Fuzzy file search (using fzf)
  Plug 'junegunn/fzf.vim'

  " Sublime text like multiple selection and edition
  Plug 'terryma/vim-multiple-cursors'

  " Indentation guidelines
  Plug 'Yggdroot/indentLine'

  " Adds gutter with git diff info
  Plug 'airblade/vim-gitgutter'

  " Adds new text object representing lines of code at the same indent level (python, haml)
  Plug 'michaeljsmith/vim-indent-object'

  " Vim dash integration (it searchs the current selected word in dash)
  Plug 'rizzatti/dash.vim'

  " Useful terminal commands
  Plug 'tpope/vim-eunuch'

  " ReactJS syntax highlighting (depends on vim javascript)
  Plug 'maxmellon/vim-jsx-pretty' | Plug 'pangloss/vim-javascript'

  " html5 syntax highlighting
  Plug 'othree/html5.vim'

  " typescript syntax highlighting
  Plug 'HerringtonDarkholme/yats.vim'

  " various javascript libraries syntax highlight
  Plug 'othree/javascript-libraries-syntax.vim'

  " Automatic closing off quotes, brackets and such
  Plug 'jiangmiao/auto-pairs'

  " Configures whitespace behavior
  Plug 'ntpeters/vim-better-whitespace'

  " Remove whitespace only from edited lines
  Plug 'thirtythreeforty/lessspace.vim'

  " Installs the most recent version of match it
  Plug 'vim-scripts/matchit.zip'

  " Better startup screen
  Plug 'mhinz/vim-startify'

  " Git repo viewer (like gitk)
  Plug 'gregsexton/gitv' | Plug 'tpope/vim-fugitive'

  " Perl support
  Plug 'vim-perl/vim-perl', { 'for': 'perl' }

  " Add coding style settings per project (using editorconfig)
  Plug 'editorconfig/editorconfig-vim'

  " Deals with annoying swap files messages doing what users would commonly do
  Plug 'gioele/vim-autoswap'

  " distraction free writing
  Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'txt', 'text'] }

  " shows up rails i18n in locate or quickfix window
  Plug 'airblade/vim-localorie', { 'for': 'ruby' }

  " better python support
  Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' } " identation
  Plug 'vim-python/python-syntax', { 'for': 'python' }  " syntax highlighting
  Plug 'tmhedberg/SimpylFold', { 'for': 'python' }  " improves folding in python


  " better php support
  Plug 'StanAngeloff/php.vim', { 'for': 'php' }
call plug#end()


" VIM FUGITIVE
map <Leader>gv :Gitv<CR>

" VIM EDITOR CONFIG
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " Play nice with fugitive plugin
let g:EditorConfig_core_mode = 'external_command' " Use system installed bin

" VIM SURROUND
" from: https://github.com/skwp/dotfiles/blob/master/vim/settings/surround.vim
" use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

" select text in an ERb file with visual mode and then press s- or s=
" or yss- to do entire line.
let g:surround_45 = "<% \r %>"    " -
let g:surround_61 = "<%= \r %>"   " ="

" VIM AIRLINE
let g:airline_powerline_fonts = 1

" ALE
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\  'python': ['flake8', 'pylint'],
\  'ruby': ['mri', 'rubocop'],
\  'javascript': ['eslint'],
\  'vue': ['eslint'],
\  'yaml': ['yamllint'],
\  'sass': ['stylelint']
\}
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'python': ['autopep8', 'yapf'],
\  'ruby': ['rubocop'],
\  'javascript': ['prettier', 'eslint'],
\  'typescript': ['prettier', 'tslint'],
\  'vue': ['eslint', 'vls'],
\  'scss': ['prettier'],
\  'sass': ['stylelint'],
\  'html': ['prettier'],
\  'reason': ['refmt'],
\  'make': ['gnumake']
\}
nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error

" VIM ROOTER
let g:rooter_change_directory_for_non_project_files=1 " Behaves like autochdir for non project files
let g:rooter_silent_chdir=1 " Don't echo dir after opening a file

" VIM NERDTREE
" removes left and right sidebars from gui
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
let g:NERDTreeWinSize=28
let g:NERDTreeChDirMode=2
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
map <Leader>s :NERDTreeToggle<CR>
" Autocloses nerdtree (and therefore vim) if it's the only buffer left
function! s:CloseNERDTreeIfOnlyBufferLeft()
  if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
    q
  endif
endfunction
augroup autoclose_nerdtree
  autocmd bufenter * call s:CloseNERDTreeIfOnlyBufferLeft()
augroup END

" maps nerdtree open selection in new buffer like ctrlp
let g:NERDTreeMapOpenSplit='<C-x>'
"ignore python cache files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" FZF
nmap <silent><C-t> :FZF<CR>
nmap <Leader>ct :BTags<CR>
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
nnoremap <Leader>a :Ag<space>
function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction
function! SearchForUsagesOfTheCurrentFile()
  execute 'Ag' expand("%:t:r")
endfunction
nnoremap <Leader>aw :call SearchWordWithAg()<CR>
" Search for usages of the current file
nnoremap <Leader>acf :call SearchForUsagesOfTheCurrentFile()<CR>

" VIM MULTIPLE CURSORS
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc
"
" Only show cursorline in the current window and in normal mode.
augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline
augroup END

" VIM INDENT
set list lcs=tab:\|\
let g:indentLine_char = '¦'
let g:indentLine_showFirstIndentLevel = 1
" other useful characters
"let g:indentLine_char = '∙▹¦'

" vim scratch
let g:scratch_horizontal = 0 " Set scratch to open vertically
let g:scratch_top = 0 " When scratch is set to open vertically top means _left
let g:scratch_height = 45 " % of the screen
" Scratch needs this to autohide window when leaving insert mode
set hidden
" Set keys to my liking (<Leader>gs is already used by fugitive)
let g:scratch_no_mappings = 1
nmap <Leader>n <plug>(scratch-insert-reuse)
nmap <Leader>N <plug>(scratch-insert-clear)
xmap <Leader>n <plug>(scratch-selection-reuse)
xmap <Leader>N <plug>(scratch-selection-clear)

" VIM DASH
nmap <silent> <Leader>dw <Plug>DashSearch
map <Leader>ds :Dash<Space>

" VIM EUNUCH
map <Leader>mv :Rename<Space>

" VIM SNEAK
let g:sneak#streak = 1

" VIM BETTER WHITESPACE
let g:strip_whitespace_on_save = 0 " as most people don't remove their own...
map <silent><Leader>rw :StripWhitespace<CR> " mapping to remove all whitespace from current file
map <silent><Leader>tw :ToggleWhitespace<CR>
let g:better_whitespace_enabled = 0

" VIM STARTIFY
augroup startify_buffer_settings
  " Use startify buffer for opening ctrlp files
  autocmd FileType startify setlocal buftype=
  " Use startify buffer for opening files from NerdTree
  autocmd User Startified AirlineRefresh
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

let g:startify_bookmarks=[
 \ {'v': g:repovimrc },
 \ {'a': '~/Projects/estante/amsterdam'},
 \ {'m': '~/projects/pessoal/agenda-api'}
 \ ]
let g:startify_change_to_dir=0 " there's a plugin taking care of autoch to current file dir
let g:startify_change_to_vcs_root=0 " there's a plugin taking care of autoch to git root dir
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
" VIM GOYO
nmap <Leader>f :Goyo<CR>
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
endfunction

augroup goyo_settings
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

" VIM LOCALORIE
nnoremap <silent> <leader>lt :call localorie#translate()<CR>
nnoremap <silent> <leader>le :call localorie#expand_key()<CR>

" RUBY AND RUBY ON RAILS
autocmd FileType ruby,eruby,yaml,less set tw=100 shiftwidth=2 softtabstop=2 tabstop=2 expandtab autoindent
autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" REACT JS
let javascript_enable_domhtmlcss = 1
autocmd FileType javascript set tw=100 shiftwidth=2 softtabstop=2 expandtab autoindent

" HTML
au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.tt setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab filetype=tt2html
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" PHP
au BufNewFile,BufReadPost *.php setl shiftwidth=4 tabstop=4 softtabstop=4 tw=80 expandtab autoindent

" PYTHON
let g:python_highlight_all = 1
au BufNewFile,BufReadPost *.py setl shiftwidth=4 tabstop=4 softtabstop=4 tw=80 expandtab autoindent
let g:SimpylFold_docstring_preview = 1 " Python SimpylFold

" VIM PLUG
map <Leader>i :PlugInstall<CR>

" EMMET
let g:user_emmet_install_global = 0
autocmd FileType html,eruby,css,tt,tt2,tt2html EmmetInstall

" ALL TAB RELATED CONFIGURATION USING COC VIM
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>aa <Plug>(coc-codeaction-selected)
nmap <leader>aa <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" FUGITIVE
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gmv :Gmove<CR>
nnoremap <Leader>gb :GBrowse<CR>
nnoremap <Leader>gbl :. Gbrowse<CR>
nnoremap <Leader>gcam :Git amend<CR>
" Global git search for word under the cursor (with highlight) (taken from vimified)
nmap <Leader>gf :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" Same in visual mode
vmap <Leader>gf y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

" STARTS VANILLA VIM CONFIGURATION

" COLORSCHEME
set background=light

" gruvbox
"let g:gruvbox_contrast_dark = 'soft'
"let g:gruvbox_contrast_light = 'soft'
"silent! colorscheme gruvbox " set it silently cause the colorscheme may not exist yet

"set termguicolors     " enable true colors support
"let ayucolor="mirage" " for mirage version of theme
"silent! colorscheme ayu
" seoul256
"let g:seoul256_background = 239
"silent! colorscheme seoul256 " set it silently cause the colorscheme may not exist yet

" nord
let g:nord_italic = 1
let g:nord_italic_comments = 1
silent! colorscheme nord

" Backups
exec 'set backupdir='.g:dotvim.'/tmp/backup//'

" Swap into its own dir
exec 'set directory='.g:dotvim.'/tmp/swap//'
set backup
set noswapfile

" General settings
set ruler         " Show the cursor position all the time
set showcmd       " Display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set encoding=utf-8
set history=1000
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Undo files
exec 'set undodir='.g:dotvim.'/tmp/undo//'
set undofile
set undolevels=3000
set undoreload=10000

" Keybind to source vimrc
nnoremap <Leader>v :source $MYVIMRC<CR>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <Leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Indentation
set autoindent
set tabstop=4 " 4 space tab
set softtabstop=4 " Causes backspace to delete 4 spaces = converted <TAB>
set shiftwidth=4 " The amount to block indent when using < and >
set expandtab  " Replaces a <TABwith spaces--more portable
set formatoptions+=j
set cpo+=J
set smarttab " Uses shiftwidth instead of tabstop at start of lines

" Numbers
set number
set numberwidth=4

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Force navigation through hjkl
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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

" Clear highlight after search
noremap <silent><Leader><space> :nohls<CR>
set hlsearch " turn on search highlighting
set incsearch " do incremental searching

" Always reload vimrc after save
augroup reload_vimrc
  autocmd!
  " Sources vim conf when editing ~/dotfiles/vimrc as well (~/.vimrc is just a symlink to g:repovimrc)
  autocmd BufWritePost $MYVIMRCFILES source %
augroup END

" Easy tab navigation
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tn :tabnext<CR>

" Easy buffer navigation
noremap <Leader>bp :bprevious<CR>
noremap <Leader>bn :bnext<CR>

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>eaip)
nmap <Leader>ea <Plug>(EasyAlign)

" Splits ,sv and ,sh to open new splits (vertical and horizontal)
nnoremap <Leader>sv <C-w>v<C-w>l
nnoremap <Leader>sh <C-w>s<C-w>j

" Quickly edit config files
nnoremap <Leader>ev <C-w>s<C-w>j:e $MYVIMRC<CR>
nnoremap <Leader>eg <C-w>s<C-w>j:e ~/.gitconfig<CR>
nnoremap <Leader>ep <C-w>s<C-w>j:e ~/.profile<CR>
nnoremap <Leader>et <C-w>s<C-w>j:e ~/.tmux.conf<CR>

" Vim config file configuration
augroup ft_vim
  au!
  au FileType vim set foldmethod=marker tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  au FileType help setlocal textwidth=100
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

set lazyredraw

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪

" Always use vertical diffs
set diffopt+=vertical

" Fixes vim background in tmux
if &term =~ '256color'
  set t_ut=
endif

" Creates a private gist from the visual selection with the filename as the gist name
" requires gist cli tool
noremap <Leader>G :w !gist -p -t %:e \| pbcopy<CR>

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
nmap <Leader>w :w!<CR>
nmap <Leader>wq :wq!<CR>

" Reload files changed outside vim. This makes vim act like most editors.
" see: http://items.sjbach.com/319/configuring-vim-right
set autoread
set fileformats+=mac

" Deals with unsaved buffer more conveniently
set confirm

set guicursor+=n-v-c:blinkon0 " Disable cursor blinking in all modes

" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null
nnoremap <Leader>ws :w!!<CR>

" Toggle number gutter
noremap <Leader>m :set invnumber<CR>
inoremap <Leader>m <C-O>:set invnumber<CR>

" go back to last opened file
nnoremap gb :e #<CR>

" Enables fzf in vim
set rtp+=/usr/local/opt/fzf

" Per project vimrc files
set exrc " Enable per project vimrc
set secure " Run insecure commands (write, autocmd and shell) only if vimrc file is owned by the user

" Opens current file using the default app for the mimetype
:map <silent><Leader>o :!open %<CR>

" 256color support
set t_Co=256
" 24bit colors
let &t_8f = "[38;2;%lu;%lu;%lum"
let &t_8b = "[48;2;%lu;%lu;%lum"

" Redraws panels easily
set termguicolors
nnoremap <silent> <Leader>= <C-w>=

" Redraws panels on focus out and window resize
augroup redraw_on_focus_out
    autocmd FocusLost,VimResized * silent wincmd =
augroup END
