"------------------------Base Configure------------------------------
" Showing line numbers and length
"set tw=79
set wrap
set fo-=t
set encoding=utf-8

"------------------------Vundle------------------------------
set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'scrooloose/Syntastic'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"----------------------Operation---------------------
" Split Layouts
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" --------------------Nerd Tree----------------------
" operation
map <C-n> :NERDTreeToggle<CR>
" Theme
"  NERDTress File highlighting
 function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg  .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.   a:extension .'$#'
endfunction

   call NERDTreeHighlightFile('bash', 'green', 'none', 'green', '#151515')
   call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
   call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
   call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
   call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
   call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
   call NERDTreeHighlightFile('python', 'Magenta', 'none', '#ff00ff', '#151515')

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufNewFile,BufRead *.py
	\ set tabstop=4  |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set fileformat=unix |
	\ set autoindent |
	\ set smartindent |
"-------------------HTML JS CSS-----------------------
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"---------------- Theme and Color------------
" Color
" Use the below highlight group when displaying bad whitespace is desired.
colorscheme zenburn
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


"--------------------------------title for my script------------------------------------
autocmd BufNewFile *.py,*.sh, exec ":call SetTitle()"
let $author_name='renqian'
let $author_email="renqian@yucebio.com"
func SetTitle()
	if &filetype=='sh'
		call setline(1,"\#!/bin/bash")
		call append(line("."), "\#=============================================================")
		call append(line(".")+1,"\# File Name: ".expand("%"))
		call append(line(".")+2, "\# Author: ".$author_name)  
		call append(line(".")+3, "\# mail: ".$author_email)  
		call append(line(".")+4, "\# Created Time: ".strftime("%c"))  
		call append(line(".")+5, "\#=============================================================")  
	    call append(line(".")+6, "\#$ -cwd -l vf= -P -q prj.q")	
		call append(line(".")+7, "export PATH=\"/mnt/nfs/user/renqian/bin:/mnt/nfs/user/renqian/bin/anaconda3/bin:/mnt/nfs/user/renqian/bin/RNASeqReadSimulator/src:/mnt/nfs/user/yangjie/bin/cytoscape/Cytoscape_v3.4.0:/mnt/nfs/software/bin:/mnt/nfs/user/renqian/bin:/mnt/nfs/software/share/jre1.8.0_91/bin:/mnt/nfs/user/renqian/bin/novocraft:/mnt/nfs/user/renqian/bin/bin:/opt/sge/bin/linux-x64:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games\"")
		call append(line(".")+8, "export R_LIBS=\"/mnt/nfs/user/renqian/lib/R:/home/renqian/R/x86_64-pc-linux-gnu-library/3.4:/mnt/nfs/user/yangjie/bin/R/lib\"")
	        call append(line(".")+9, "export LD_LIBRARY_PATH=\"/mnt/nfs/software/lib:/mnt/nfs/user/renqian/bin/lib:$LD_LIBRARY_PATH\"")
	else  
		cal setline(1,"\#!/mnt/nfs/user/renqian/bin/anaconda3/bin/python")
		call append(line("."),"\###################################################################")  
		call append(line(".")+1, "\# File Name: ".expand("%"))  
		call append(line(".")+2, "\# Author: ".$author_name)  
		call append(line(".")+3, "\# mail: ".$author_email)  
		call append(line(".")+4, "\# Created Time: ".strftime("%c"))  
		call append(line(".")+5, "\#=============================================================")  
		call append(line(".")+6, "")  
	endif  
endfunc
