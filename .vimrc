if &shell =~# 'fish$'
    set shell=bash
endif

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" VUNDLE INIT
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'dag/vim-fish'
Plugin 'rkitover/vimpager'
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on 
" END VUNDLE INIT

syntax enable
set background=dark
colorscheme solarized
hi Normal guibg=NONE ctermbg=NONE

:set number relativenumber
:augroup numbertoggle
:   autocmd!
:   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

nmap oo o<Esc>k
nmap OO O<Esc>j

" Disable mouse
set mouse=
set ttymouse=

"au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
