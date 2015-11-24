let mapleader = ","
let maplocalleader = "\\"
let dotvim=expand('<sfile>:p:h') . "/.vim/"

call plug#begin('~/.vim/plugged')

"map plugin installation
map <Leader>i :PlugInstall<CR>

Plug 'rking/ag.vim'
nnoremap <leader>a :Ag -i<space>

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

"Syntastic is a syntax checking plugin for Vim 
Plug 'scrooloose/syntastic'
Plug 'myint/syntastic-extras'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_yaml_checkers = ['pyyaml']
let g:syntastic_javascript_checkers = ['json_tool']
let g:syntastic_make_checkers = ['gnumake']

Plug 'morhetz/gruvbox'


Plug 'scrooloose/nerdtree'
map <Leader>s :NERDTreeToggle<CR>

"Provides Send_To_Tmux function that vim-rspec will later use
Plug 'jgdavey/tslime.vim'

" rspec mappings
Plug 'thoughtbot/vim-rspec'
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>n :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>as :call RunAllSpecs()<CR>
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

Plug 'scrooloose/nerdcommenter'

"Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'ecomba/vim-ruby-refactoring'

autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
autocmd FileType ruby,eruby,yaml setlocal foldmethod=manual
autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

"Html
Plug 'tpope/vim-haml'
Plug 'juvenn/mustache.vim'
Plug 'tpope/vim-markdown'
Plug 'digitaltoad/vim-jade'
Plug 'slim-template/vim-slim'
Plug 'mattn/emmet-vim'

au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.md set filetype=markdown

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
let g:user_emmet_leader_key='<C-x>'

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
 nmap <leader>be :EasyBufferToggle<cr>

 " sublime text like multiple selection and edition
 Plug 'terryma/vim-multiple-cursors'

 " statusbar
 Plug 'bling/vim-airline'

 " indentation guidelines
 Plug 'Yggdroot/indentLine'
 set list lcs=tab:\|\
 let g:indentLine_color_term = 111
 let g:indentLine_color_gui = '#DADADA'
 let g:indentLine_char = 'c'
 " other useful characters
 "let g:indentLine_char = '∙▹¦'
 let g:indentLine_char = '∙'

call plug#end()

" backups
exec 'set backupdir='.dotvim.'/tmp/backup//'

" swap into its own dir
exec 'set directory='.dotvim.'/tmp/swap//'
set backup
set noswapfile

" command to source vimrc
nnoremap <Leader>v :source $MYVIMRC<CR>

" colorscheme
set background=dark
" set it silently cause the colorscheme may not exist yet
colorscheme gruvbox

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
"
" Numbers
set number
set numberwidth=4

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

noremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

nnoremap <leader><leader> <c-^>

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
set nocompatible
set backspace=2

" turns filetype plugins on
filetype plugin on

augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" better tab navigation
nnoremap <Leader>h :tabprevious<CR>
nnoremap <Leader>l :tabnext<CR>

" whitespace and such
set autoindent
set tabstop=2
set softtabstop=2
set textwidth=80
set shiftwidth=2
set expandtab
set wrap
set formatoptions=qrn1
if exists('+colorcolumn')
  set colorcolumn=+1
endif
set cpo+=J

" general stuff

" Don't redraw while executing macros
set nolazyredraw

" Disable the macvim toolbar
set guioptions-=T

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪