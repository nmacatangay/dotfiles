""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Noel's vimrc :)
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Vundle - https://github.com/VundleVim/Vundle.vim
"
" Install Vundle
"  git config --global core.autocrlf input
"  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"  :PluginInstall (inside vim)
"
" Install New Plugins
"  Add new plugin
"  Restart vim
"  :PluginInstall (inside vim)
"

" Required
set nocompatible
filetype off

" Initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Development Tools
"

Plugin 'mileszs/ack.vim'                  " search tool
Plugin 'tpope/vim-fugitive'               " git wrapper
Plugin 'airblade/vim-gitgutter'           " display git diff while editing
Plugin 'scrooloose/nerdtree'              " file explorer
Plugin 'jistr/vim-nerdtree-tabs'          " nerdtree improved
Plugin 'junegunn/fzf'                     " fuzzy finder
Plugin 'junegunn/fzf.vim'                 " fzf wrapper

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Visual
"

Plugin 'altercation/vim-colors-solarized' " fancy colors :)
Plugin 'vim-airline/vim-airline'          " fancy menu
Plugin 'vim-airline/vim-airline-themes'   " vim-airline themes
Plugin 'nathanaelkane/vim-indent-guides'  " indention guide
Plugin 'bronson/vim-trailing-whitespace'  " highlights trailing whitespace in red

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Syntax
"

Plugin 'dense-analysis/ale'               " syntax linting
Plugin 'kchmck/vim-coffee-script'         " coffee syntax highlight
Plugin 'yuezk/vim-js'                     " jsx syntax highlight
Plugin 'maxmellon/vim-jsx-pretty'         " jsx syntax highlight
Plugin 'leafgarland/typescript-vim'       " ts syntax highlight
Plugin 'Quramy/tsuquyomi'                 " ts linter
Plugin 'fatih/vim-go'                     " go plugins

" Required
call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin - vim-nerdtree-tabs
"

" Auto Open Nerd Tree Tabs
let g:nerdtree_tabs_open_on_console_startup = 1

" Show hidden files
let NERDTreeShowHidden = 1

" Ignore the following files
let NERDTreeIgnore = ['node_modules', 'tmp, ''\.git$', '\.pyc', '\.sw[a-p]$']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin - ack.vim
"

" Use ag instead of ack (sudo apt-get install silversearcher-ag -y)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin - vim-gitgutter
"

" Auto suppress gitgutter when there are too many signs
let g:gitgutter_max_signs = 1000 " 500 default value

" Show diff markers quickly
set updatetime=100


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin - vim-airline
"

" Integrate with ale
let g:airline#extensions#ale#enabled = 1

" Default Theme (:AirlineTheme <TAB> to show other themes)
let g:airline_theme = 'tomorrow'

" Use Powerline Fonts (https://github.com/powerline/fonts) (Ubuntu Mono derivative Powerline 16pt.)
let g:airline_powerline_fonts = 1

" Enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin - vim-indent-guides
"

" Auto Start Indent Guide
let g:indent_guides_enable_on_vim_startup = 1

" Other Options
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'vim']
let g:indent_guides_auto_colors = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin - vim-go
"

" Disable vim-go overriding mapping
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin - ale
"
" Javascript
"  ESLint
"  npm install eslint --save-dev
"  yarn add eslint --dev
"
" Python
"  pycodestyle (formerly pep8)
"  pip install pycodestyle
"  pip install --upgrade pycodestyle
"
" Ruby
"  RuboCop
"  gem install rubocop
"  gem update rubocop
"

" Start Ale automatically
let g:ale_lint_on_enter = 1

" Start Ale only on specified files
let g:ale_linters_explicit = 1

" Auto-start sign gutters
let g:ale_sign_column_always = 1

" Fix files on save
let g:ale_fix_on_save = 0

" Change default signs
let g:ale_sign_error =   '>>' " Default: >>
let g:ale_sign_warning = '--' " Default: --

" Setup linters and fixers
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pycodestyle'],
\   'ruby': ['rubocop']
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['pycodestyle'],
\   'ruby': ['rubocop']
\}
let g:ale_pattern_options = {
\   '\.jsx$': { 'ale_linters': ['eslint'], 'ale_fixers': ['eslint'] },
\   '\.tsx$': { 'ale_linters': ['eslint'], 'ale_fixers': ['eslint'] }
\}
let g:ale_pattern_options_enabled = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Map Commands
"

" <Ctrl+a> Toggle NTT on all tabs
nnoremap <C-a> :NERDTreeTabsToggle<CR>
inoremap <C-a> <Esc>:NERDTreeTabsToggle<CR>

" <CTRL+t> New tab
nnoremap <C-t> :tabnew<CR><C-w><Left>
inoremap <C-t> <Esc>:tabnew<CR><C-w><Left>

" <CTRL+h> Move to the tab on the left
nnoremap <C-h> :tabprevious<CR>
inoremap <C-h> <Esc>:tabprevious<CR>

" <CTRL+l> Move to the tab on the right
nnoremap <C-l> :tabnext<CR>
inoremap <C-l> <Esc>:tabnext<CR>

" <SHFT+h or H> Move cursor to split windows (Left)
" This replaces the shortcut key for move to the top of current display
nnoremap H <C-w>h

" <SHFT+j or J> Move cursor to split windows (Below)
" This replaces the shortcut key for merging the current on below line
nnoremap J <C-w>j

" <SHFT+k or K> Move cursor to split windows (Above)
" This replaces the shortcut key for opening the manual for the highlighted command
nnoremap K <C-w>k

" <SHFT+l or L> Move cursor to split windows (Right)
" This replaces the shortcut key for move to the bottom of current display
nnoremap L <C-w>l

" \tm0 Move current tab to first position
nnoremap <Leader>tm0 :tabmove 0<CR>

" \gs Git status
nnoremap <Leader>gs :NERDTreeTabsClose<CR>:Git<CR>:NERDTreeTabsOpen<CR><C-w>l<C-w>k

" \gc Git commit
nnoremap <Leader>gc :Git commit<CR>

" \gd Git diff
nnoremap <Leader>gd :NERDTreeTabsClose<CR>:Gdiffsplit<CR>

" \gq Quit and re-open NerdTreeTabs
nnoremap <Leader>gq :NERDTreeTabsClose<CR>:q<CR>:NERDTreeTabsOpen<CR><C-w>l

" \gb Git blame
nnoremap <Leader>gb :NERDTreeTabsClose<CR>:Git blame<CR>

" \go Git checkout
nnoremap <Leader>go :Git checkout<Space>

" \gl Git pull
nnoremap <Leader>gl :Git pull origin<Space>

" \gp Git push
nnoremap <Leader>gp :Git push origin<Space>

" \ig Toggle Indent Guides
nnoremap <Leader>ig :IndentGuidesToggle<CR>

" \gg Toggle Git Gutter
nnoremap <Leader>gg :GitGutterToggle<CR>

" \ln Toggle ALE
nnoremap <Leader>ln :ALEToggle<CR>

" Ack will use Ack! instead (Ack! will not jump to first result automatically)
cnoreabbrev Ack Ack!

" \a Ack! search
nnoremap <Leader>a :Ack!<Space>

" \f Fuzzy find files
nnoremap <Leader>f <C-w>k<C-w>l:Files<CR>

" \qa Force quit all files
nnoremap <Leader>qa :qa!<CR>

" FORCE hjkl :)
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" \pretty Pretty Print JSON Data
" Requirements:
"   Use double quotes " " instead of single quotes ' ' to wrap key value pairs
"   Accepted boolean values (ex. true or false)
"   Accepted null values (ex. Null or null)
nnoremap <Leader>pretty :%!python -m json.tool<CR>zR

" <Space> Page Down
nnoremap <Space> <C-d>

" <S-Space> Page Up
" iTerm2 -> Preferences -> Profiles -> Keys -> +
"   Key Combination: Shift+Space
"   Action: Send Hex Codes: 0x15

" Use jk instead of ESC
inoremap jk <Esc>
inoremap JK <Esc>
inoremap jK <Esc>
inoremap Jk <Esc>

" ; is also :
nnoremap ; :


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Auto Commands
"

augroup four-space
  autocmd BufReadPost,BufNewFile,BufEnter *.py,*.go set shiftwidth=4
  autocmd BufReadPost,BufNewFile,BufEnter *.py,*.go set softtabstop=4
  autocmd BufReadPost,BufNewFile,BufEnter *.py,*.go set tabstop=4
  autocmd BufReadPost,BufNewFile,BufEnter *.py,*.go let g:indent_guides_guide_size = 2
augroup end

augroup two-space
  autocmd BufReadPost,BufNewFile,BufEnter *.js,*.jsx,*.proto,*.rb,*.ts,*.tsx set shiftwidth=2
  autocmd BufReadPost,BufNewFile,BufEnter *.js,*.jsx,*.proto,*.rb,*.ts,*.tsx set softtabstop=2
  autocmd BufReadPost,BufNewFile,BufEnter *.js,*.jsx,*.proto,*.rb,*.ts,*.tsx set tabstop=2
  autocmd BufReadPost,BufNewFile,BufEnter *.js,*.jsx,*.proto,*.rb,*.ts,*.tsx let g:indent_guides_guide_size = 1
augroup end

" Setup colors for Indent Guide
autocmd VimEnter * :highlight IndentGuidesOdd  ctermbg=Black ctermfg=Green
autocmd VimEnter * :highlight IndentGuidesEven ctermbg=Black ctermfg=Green

" .ts* is typescript
autocmd BufNewFile,BufRead *.ts* setlocal filetype=typescript

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Quality of Life
"

" Enable syntax highlighting
syntax enable

" Backspace
set backspace=2       " Make backspace behave list most other programs

" Colorscheme (Dark Solarized)
set t_Co=256
set background=dark
colorscheme solarized
highlight! link SignColumn LineNr " gitgutter color fix
highlight Normal ctermbg=none " WSL fix

" Interface
set number            " Shows line numbers
set numberwidth=5     " Set line number width (default=4)
set ruler             " Shows line and character position (lower right) (hidden when vim-airline is active)
set showcmd           " Shows currently typed commands (lower right)
set wildmenu          " Shows completable commands when pressing <TAB>
                      "  i.e. :colorscheme <TAB>
set scrolloff=999     " Cursor is always at the center

" Beeps and Flashes
set noerrorbells      " Disable beeping sound
set novisualbell      " Disable flashing screen part1
set t_vb=             " Disable flashing screen part2

" Command Timeouts
set notimeout         " Disable command timeout part1
set ttimeout          " Disable command timeout part2

" Safety First!
set confirm           " Executing :q without saving will show a confirm prompt

" Search
set hlsearch          " Search results will be highlighted
set ignorecase        " Case insensitive search
set incsearch         " Go to next match while typing search
set smartcase         " Searching with uppercase letters will make search case sensitive

" Speed
set lazyredraw        " Buffer screen updates (helpful in complex recordings)

" Tabs
set expandtab         " Pressing tab will use spaces instead
set shiftwidth=2      " Indentation spaces when using << or >>
set softtabstop=2     " Always use the specified number of spaces
set tabstop=2         " The number of characters the tab character will use

" Split
set splitright        " Cursor will appear on right split when using vsplit
"set splitbelow       " Cursor will appear on bottom split when using split (commented out because I like \gs to be on top)

" Folding
set foldmethod=indent " Easiest foldmethod to work with
set foldlevelstart=2  " Start folding at X level
set foldnestmax=5     " Only fold X levels deep
set nofoldenable      " Don't automatically fold (commented out to always enable folding at file open)

" Highlight column 101
let &colorcolumn=join(range(101, 101), ',')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Commands
"

" :W will force save a read-only file
command W w !sudo tee % > /dev/null

" Removes auto-indent when pasting (Removes the need to use ':set paste')
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" End :)
