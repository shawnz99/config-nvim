" Package manager is vim-plug


set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nohlsearch
set number
set hidden
set noswapfile
"set nobackup
"set undodir=~/.vim/undodir
"set undofile
set incsearch
set scrolloff=8


" Setting up Splits"
set splitbelow
set splitright

" Auto Downloading vim-plug 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


"Setting up plugins, place path in here and type :PlugInstall, 
"also :so % to reload
call plug#begin('~/.vim/plugged')

" Make adjsuting split sizes easier "
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

"Terminal Emulation
Plug 'vimlab/split-term.vim'

"Tag bar"
Plug 'majutsushi/tagbar'

" Colorscheme 
Plug 'gruvbox-community/gruvbox'

" Autopairs
Plug 'jiangmiao/auto-pairs'

" Toolbar
Plug 'itchyny/lightline.vim'


call plug#end()

colorscheme gruvbox

" Highlighting line number "
highlight cursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

"           Maps 
" -------------------------------
" n     ~ normal mode
" nore  ~ dont recursively execute
" map   ~ map
let mapleader = " "

lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

" Sidebar Toggle Mappings
nnoremap <silent> ,; :TagbarToggle<cr> 

" Find files using telescope command line sugar
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" STatus Line "
set laststatus=2
set noshowmode

if !has('gui_running')
    set t_Co=256
endif

" Cholorscheme for sttusl ine
let g:lightline = {
            \ 'colorscheme': 'darcula',
            \}
