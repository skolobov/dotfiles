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

    Plug 'bling/vim-airline'

    Plug 'vim-ruby/vim-ruby'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-haml'
    Plug 'tpope/vim-rails'

" Initialize plugin system
call plug#end()

syntax enable
set background=dark
colorscheme solarized

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
