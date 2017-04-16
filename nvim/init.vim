" Neovim configuration file
" https://github.com/skolobov/dotfiles

let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

set shortmess=atI " Don't show the intro message when starting vim
set cursorline " Highlight current line
set esckeys " Allow cursor keys in insert mode
set expandtab " Expand tabs to spaces
set number " Enable line numbers
set shiftwidth=2 " The # of spaces for indenting
set showtabline=2 " Always show tab bar
set softtabstop=2 " Tab key results in 2 spaces
set title " Show the filename in the window titlebar

" Specify a directory for plugins
call plug#begin('~/.cache/vim-plug')

    " Solarized color scheme
    Plug 'altercation/vim-colors-solarized'

    " File type handling
    Plug 'vim-scripts/fish.vim',   { 'for': 'fish' }
    Plug 'tpope/vim-markdown',     { 'for': 'markdown' }

    " Lean & mean status/tabline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Show diffs from multiple VCS
    Plug 'mhinz/vim-signify'

    " NERDTree
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Support for .editorconfig
    Plug 'editorconfig/editorconfig-vim'

    Plug 'vim-ruby/vim-ruby'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rails'

" Initialize plugin system
call plug#end()

" Use Solarized Dark color scheme
set background=dark
colorscheme solarized
let g:airline_theme='solarized'

" Use Git and Mercurial diffs for vim-signify plugin
let g:signify_vcs_list = [ 'git', 'hg', 'svn' ]

" NERDTree
map <C-n> :NERDTreeToggle<CR>
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Fish
augroup filetype_fish
    autocmd!
    au BufRead,BufNewFile *.fish set ft=fish
augroup END

" Markdown
augroup filetype_markdown
    autocmd!
    let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END
