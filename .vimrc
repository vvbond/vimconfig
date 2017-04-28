" vim: foldmethod=marker foldcolumn=3 
" ========================== Vundle Settings ========================== {{{1
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" ----------- Plugins -------------------------------------------------
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'The-NERD-tree'
Plugin 'surround.vim'
Plugin 'tComment'
Plugin 'ctrlp.vim'
Plugin 'SuperTab'
Plugin 'UltiSnips'
Plugin 'vim-snippets'
" Plugin 'MRU'
Plugin 'goyo.vim'
Plugin 'limelight.vim'
" Plugin 'AutomaticLaTeXPlugin'
Plugin 'YouCompleteMe'
Plugin 'taglist.vim'
Plugin 'Python-mode-klen'
Plugin 'fugitive.vim'
Plugin 'vim-airline'
" --------------------------------------------------------------------
call vundle#end()
filetype plugin indent on
"
" ========================== Vundle Settings End ====================== 
"

" ========================= vbond Configuration ========================= {{{1
" Appearance {{{1
colorscheme desert
syntax on
set number
set tabstop=2
set softtabstop=2
set expandtab
set cindent sw=2

" Settings {{{1
" set foldlevel=99
" set foldlevelstart=99
set scrolloff=999 
" Mappings {{{1
let mapleader = ","
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q<CR>

" Edit and source the vimrc file
nnoremap <leader>v :e ~/vimconfig/.vimrc<CR>

" Do not use <Esc> - it is too slow
inoremap jk <Esc>
" inoremap <Esc> <nop>

" Make a space to close and open folds
nnoremap <space> za

" easier moving of code blocks
vnoremap < <gv 
vnoremap > >gv 

" some shortcuts
" inoremap <F2> [[][]]<ESC>hhhi
" nnoremap <F3> :VikiTasks<CR>

" navigating between buffers
nnoremap <leader>bb :b#<CR>

" search for a word under the cursor:
nnoremap <leader>g :silent execute "grep! -r " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>

" Change working directory to the one of the edited file:
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Easy windows and tabs navigation {{{2
" " windows
" nnoremap <C-h> <C-W>h
" nnoremap <C-l> <C-W>l
" nnoremap <C-j> <C-W>j
" nnoremap <C-k> <C-W>k
" tabs
nnoremap <leader>n :tabprevious<CR>
nnoremap <leader>m :tabnext<CR>


" Commands {{{1
if has("autocmd")
  autocmd! BufWritePost .vimrc :w! ~/.vimrc | source ~/.vimrc
  augroup filetype_tex
    autocmd!
    autocmd FileType tex :setlocal spell spelllang=en_gb
    autocmd FileType tex :setlocal tw=100 
  augroup END
  augroup filetype_cuda
    autocmd!
    autocmd FileType cuda inoremap <buffer> <F5> <C-o>:update<Bar>execute '!/usr/local/cuda/bin/nvcc -ptx %:p:t'
    autocmd FileType cuda nnoremap <buffer> <F5> :update<Bar>execute '!/usr/local/cuda/bin/nvcc -ptx %:p:t'
  augroup END
endif
" Plugins' settings{{{1
" LaTeX-Suit{{{2
let g:Tex_DefaultTargetFormat='pdf'
let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf='evince'
" Airline{{{2
set laststatus=2
" UltiSnips & YCM{{{2
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
