set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" The bundles you install will be listed here

Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'nanotech/jellybeans.vim'
Plugin 'godlygeek/tabular'

" Languages Supported
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'

Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'

Plugin 'tpope/vim-dispatch'

call vundle#end()            " required
filetype plugin indent on

" The rest of your config follows here

" Global Configs
set nocp
set mouse=a
set foldmethod=indent
set smartindent
"opções do autocompletar
set wildmenu
set wildmode=list:longest,full
"interface
syntax enable
set ruler
set number
set title
set backspace=2
set background=dark
set tabstop=4		" Espaços por tab
set shiftwidth=4	" Espaços para cada passo de indent
set textwidth=120
set expandtab		" Substitui tab por espaços adequados
        			" Use CTRL-V <Tab> para colocar Tabs reais
"set smarttab		" usa shiftwidth no início, tabstop no meio
	        		" <BS> apaga shiftwidth no início
set hlsearch
set incsearch
set ignorecase
set smartcase
set showcmd	    	" mostra comando parcial
set showmatch
set nomodeline
set t_Co=256

set ofu=syntaxcomplete#Complete	"omnicompletion

set ffs=unix,dos

colorscheme jellybeans
"ajuste para comandos pessoais e de plugins
let mapleader = ","
let maplocalleader = ","

"ajustes de comandos
map <space> <c-f>
map <backspace> <c-b>
map <F9> <Esc>:setlocal spell spelllang=pt_br<CR>
map <F10> <Esc>:setlocal spell spelllang=en_us<CR>
map <F12> <Esc>:setlocal nospell<CR>

imap jj <ESC>

"Mostra o comando atual no canto direito inferior da tela
set showcmd

"Esquema de Cores
"colorscheme murphy

"Auto wrap without linebreak

set wrap
set linebreak
set nolist "list desable linabreak

set textwidth=0
set wrapmargin=0

"TaskList
map T :TaskList<CR>
map P :TlistToggle<CR>

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap


    autocmd FileType typescript :set makeprg=tsc
augroup END

" Airline setup
set laststatus=2
let g:airline_powerline_fonts = 0
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

"Customizando a Linha de status
"set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" NERDTree
map <F2> :NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
map  <C-1> 1gt<CR>
map  <C-2> 2gt<CR>
map  <C-3> 3gt<CR>
map  <C-4> 4gt<CR>
map  <C-5> 5gt<CR>
map  <C-6> 6gt<CR>
map  <C-7> 7gt<CR>
map  <C-8> 8gt<CR>
map  <C-9> 9gt<CR>
map  <C-0> :tablast<CR>

" syntastic
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open = 1

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: this enables automatc indentation as you type.
filetype indent on


"
" Easy Motion
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-s)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
 nmap s <Plug>(easymotion-s2)

" " Turn on case sensitive feature
 let g:EasyMotion_smartcase = 1

" JK motions: Line motions
 map <Leader>j <Plug>(easymotion-j)
 map <Leader>k <Plug>(easymotion-k)


let g:snipMate = {}
let g:snipMate.scope_aliases = {}

set nofoldenable    " disable folding"

function! s:config_easyfuzzymotion(...) abort
      return extend(copy({
        \   'converters': [incsearch#config#fuzzyword#converter()],
        \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
        \   'keymap': {"\<CR>": '<Over>(easymotion)'},
        \   'is_expr': 0,
        \   'is_stay': 1
        \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

"  Error of TSC File
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

