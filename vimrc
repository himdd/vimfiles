set nocompatible

"vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"Plugin 'majutsushi/tagbar'
"Plugin 'vimcn/vimcdoc'
"Plugin 'mileszs/ack.vim' 
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'taglist.vim'
"Plugin 'kien/ctrlp.vim'
"Plugin 'altercation/vim-colors-solarized'

"Plugin 'tpope/vim-rails'
"Plugin 'nvie/vim-flake8'
"Plugin 'hynek/vim-python-pep8-indent'
"Plugin 'Rip-Rip/clang_complete'
"
"" sytle
"Plugin 'saltstack/salt-vim'
"Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'hallison/vim-markdown'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'groenewege/vim-less'
"
"" JS
"Plugin 'maksimr/vim-jsbeautify'
"
"" snipmate
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on
"end vundle

syntax on

set term=xterm-256color
let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized
"colorscheme evening
colorscheme desert

set history=1000
set mouse=v
set showcmd
set showmode
set number
set wrap linebreak nolist
set linespace=4
set visualbell t_vb=

set tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType ruby setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
au FileType yaml setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
au FileType python setlocal et sta sw=4 sts=4
au FileType javascript setlocal et sta sw=4 sts=4

set foldmethod=indent
set foldnestmax=3
set nofoldenable

set formatoptions-=o
set hidden
set wildmode=list:longest
set wildmenu

set hlsearch
set incsearch

"key mapping for tab navigation 快捷TAB导航
nmap <Tab> gt
nmap <S-Tab> gT

"Ack 搜索插件设置
if executable("ack")
    let g:ackprg="ack -H --nocolor --nogroup --column"
else
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif


"ragtag 快速输入eruby 标签
let g:ragtag_global_maps = 1 

"statusline setup  状态栏显示文件完整路径
set statusline=%f       "tail of the filename

"语法检查
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"设置为每次打开buffer就执行语法检查，而不只是在保存时：
let g:syntastic_check_on_open = 1
"如果想使用多个检查器，可以这样写：
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_cpp_checkers = ['gcc']

"http://www.nonozone.net/solve-vim-chinese-garbled.html
set fileencodings=utf-8,gb2312,gbk,gb18030,default,latinl
set fileformats=unix,dos

"NERDTree
"启动vim自动打开NERDTree
autocmd VimEnter * NERDTree

"打开新的buffer时自动定位到编辑窗口
autocmd VimEnter * wincmd p
"taglist.vim

"let NERDTreeIgnore = ['\.pyc$']
" 这项必须设定，否则出错,配置taglist的ctags路径
"let Tlist_Ctags_Cmd = 'D:\ctags58\ctags.exe'
if executable("/usr/local/bin/ctags")
    let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
endif
" 不同时显示多个文件的 tag ，只显示当前文件的
let Tlist_Show_One_File=1
" 如果 taglist 窗口是最后一个窗口，则退出 vim
let Tlist_Exit_OnlyWindow=1
"让当前不被编辑的文件的方法列表自动折叠起来 
"let Tlist_File_Fold_Auto_Close=1
"把taglist窗口放在屏幕的右侧，缺省在左侧 
let Tlist_Use_Right_Window=1 

"显示taglist菜单
let Tlist_Show_Menu=1

"启动vim自动打开taglist
let Tlist_Auto_Open=1

"ctrlp.vim
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|pyenv)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': '',
  \ }

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" HOTKEY

" toggle paste mode on/off
map <F9> :set paste!<cr>:set paste?<cr>

"open current to new tab
map <Leader>t :tabnew %<CR>

"nnoremap <F12> :nohlsearch<CR> 

"key mapping for window navigation 映射窗口切换快捷键
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file 映射C-S快速保存文件
nmap <C-s> :w<CR>

"ctags快捷命令
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" maksimr/vim-jsbeautify
autocmd FileType javascript noremap <buffer>  <Leader>f :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <Leader>f :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <Leader>f :call CSSBeautify()<cr>

" http://www.vim.org/scripts/script.php?script_id=3081
autocmd FileType javascript noremap <buffer> <Leader>j :JSHint<cr>
set laststatus=2
