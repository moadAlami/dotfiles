let mapleader=','
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
	Plug 'terryma/vim-multiple-cursors'
	Plug 'scrooloose/nerdtree'
	Plug 'itchyny/lightline.vim'
	Plug 'w0rp/ale'
	Plug 'lervag/vimtex'
	Plug 'tpope/vim-surround'
	Plug 'jalvesaq/Nvim-R'
	Plug 'chrisbra/csv.vim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	" Plug 'deoplete-plugins/deoplete-jedi' "Python completion
	Plug 'vim-latex/vim-latex'
	Plug 'rhysd/vim-grammarous' "Grammar checker
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } "LaTeX Preview
	Plug 'bluz71/vim-moonfly-colors'
	Plug 'rakr/vim-one'
	Plug 'tommcdo/vim-lion'
	Plug 'morhetz/gruvbox'
	Plug 'tomasr/molokai'
	Plug 'wellle/targets.vim'
	Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
	Plug 'tpope/vim-commentary'
call plug#end()

"colorscheme molokai

let g:NERDTreeUpdateOnCursorHold = 0
let g:NERDTreeUpdateOnWrite      = 0

" Transparency
"hi Normal guibg=NONE ctermbg=NONE

let g:lion_squeeze_spaces = 1

" Set previewer
let g:livepreview_previewer = 'zathura'

" Enable ncm2 for all buffers
"	autocmd BufEnter * call ncm2#enable_for_buffer()

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set number
set relativenumber
set nohlsearch
set tabstop=4
set nopaste
set sw=4

" Spell check
	map <F6> :setlocal spell! spelllang=fr_FR,es<CR>
	map <F8> :setlocal spell! spelllang=en_US,es<CR>

"Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=os

"Enable autocompletion:
	set wildmode=longest,list,full
	set wildmenu

" Execute python scripts
	map <F9> :exec 'w !python' <cr>


" Tabs
	nnoremap <C-t> :tabnew <cr>
	nnoremap <C-x> :tabclose <cr>
	nnoremap <C-p> :tabprevious <cr>
	inoremap <C-t> <Esc>:tabnew <cr>
	inoremap <C-x> <Esc>:tabclose <cr>
	inoremap <C-p> <Esc>:tabprevious <cr>

" Buffers
	map <C-h> :vsplit <cr>

" Mode Coloring (using the (lightline) Plugin
	set laststatus=2


" NERDTreeToggle
	map <C-o> :NERDTreeToggle<CR>

" Use deoplete
	let g:deoplete#enable_at_startup = 1
	inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
	inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

	autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
	autocmd CompleteDone * pclose " To close preview window of deoplete automagically

" Split line (opposite of 'join' <shift>j)
	nnoremap <s-k> i<CR><Esc>


" <++> Navigation
	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l

""""""""""""""""""""""""""""" 
"== LaTeX =="

"""""""""""""""""""""""""""""

" Latex Plugin Settings
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0
	set conceallevel=1
	let g:tex_conceal='abdmg'

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %
" Compile document and run biber
	autocmd FileType tex map <leader>c :w! \| !pdflatex <c-r>%<CR><CR>:!biber %:r <c-r><CR><CR>:!pdflatex <c-r>%<CR>
" Compile document and run makeglossaries
	autocmd FileType tex map <leader>g :w! \| !pdflatex <c-r>%<CR><CR>:!makeglossaries %:r <c-r><CR><CR>:!pdflatex <c-r>%<CR>
" makeglossaries
	autocmd FileType tex map <leader>mgl :!makeglossaries %:r <c-r><CR><CR>
" Biber
	autocmd FileType tex map <leader>bib :!biber %:r <c-r><CR><CR>
" Build only
	autocmd FileType tex map <leader>bui :w! \| !pdflatex <c-r>%<CR>

" Open the compiled .pdf
	autocmd FileType tex map <leader>o :!zathura <c-r>%<Backspace><Backspace><Backspace>pdf & <CR><CR>
" Command Shortcuts
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<Esc>T{i
	autocmd FileType tex inoremap ,under \underline{}<++><Esc>T{i
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,hb \hbar<Esc>i
	autocmd FileType tex inoremap ,hl \hline<Esc>o
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space> 
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space> 
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ch \chapter{}<Esc>i
	autocmd FileType tex inoremap ,s1 \section{}<Esc>i
	autocmd FileType tex inoremap ,s2 \subsection{}<Esc>i
	autocmd FileType tex inoremap ,s3 \subsubsection{}<Esc>i
	autocmd FileType tex inoremap ,qch \chapter*{}<Esc>i
	autocmd FileType tex inoremap ,qs1 \section*{}<Esc>i
	autocmd FileType tex inoremap ,qs2 \subsection*{}<Esc>i
	autocmd FileType tex inoremap ,qs3 \subsubsection*{}<Esc>i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Esc>2k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,use \usepackage{}<Esc>0f{a
	autocmd FileType tex inoremap ,buse \usepackage[]{<++>}<Esc>0f[a
	autocmd FileType tex inoremap ,wr \begin{wrapfigure}{}{0cm}<Enter>\includegraphics[<++>]{<++>}<Enter>\end{wrapfigure}<Esc>2kf{a
	autocmd FileType tex inoremap ,inc \includegraphics[]{<++>}<Esc>F[a
	autocmd FileType tex inoremap ,vs \vspace{}<Esc>i
	autocmd FileType tex inoremap ,hs \hspace{}<Esc>i
	autocmd FileType tex inoremap ,pci \parencite{}<Esc>i
	autocmd FileType tex inoremap ,tci \textcite{}<Esc>i
	autocmd FileType tex inoremap ,ct  \captionof{table}{}<Esc>i
	autocmd FileType tex inoremap ,cf  \captionof{figure}{}<Esc>i
	
""""""""""""""""""""""""""""" 
"== BibTeX =="

"""""""""""""""""""""""""""""
	autocmd FileType bib inoremap <leader>ar @article{,<Esc>oauthor = "<++>",<Enter>title = "<++>",<Enter>journal = "<++>",<Enter>volume = "<++>",<Enter>pages = "<++>",<Enter>year = "<++>"<Enter>}<Enter><Enter><backspace><++><Esc>09k0f{a
   	autocmd FileType bib inoremap <leader>bo @book{,<Esc>oauthor = "<++>",<Enter>title = "<++>",<Enter>year = "<++>",<Enter>publisher = "<++>"<Enter>}<Enter><Enter><backspace><++><Esc>07k0f{a
   	autocmd FileType bib inoremap <leader>mi @misc{,<Esc>ohowpublished = "\url{<++>}",<Enter>author = "<++>",<Enter>title = "<++>",<Enter>month = "<++>",<Enter>year = "<++>"<Enter>}<Enter><Enter><backspace><++><Esc>08k0f{a                             
   	autocmd FileType bib inoremap <leader>re @techreport{,<Esc>oauthor = "<++>",<Enter>title = "<++>",<Enter>year = "<++>",<Enter>institution = "<++>",<Enter>type = "<++>"<Enter>}<Enter><Enter><backspace><++><Esc>08kf{a                                 
	autocmd FileType bib inoremap <leader>ph @phdthesis{,<Esc>oauthor = "<++>",<Enter>title = "<++>",<Enter>year = "<++>",<Enter>school = "<++>"<Enter>}<Enter><Enter><backspace><++><Esc>07kf{a


"""""""""""""""""""""""""
"== HTML ==

"""""""""""""""""""""""""
	autocmd FileType html inoremap <b <b></b><Space><++><Esc>FbT>i
	autocmd FileType html inoremap <em <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap <leader>1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap <leader>2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap <leader>3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap <leader>4 <h4></h4><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap <leader>5 <h5></h5><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap <leader>6 <h6></h6><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap <p <p></p><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap <a <a<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap <ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap <li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap <ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap <img <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html inoremap <td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap <tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html inoremap <th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap <tab <table><Enter></table><Esc>O<Paste>


set t_Co=256
highlight Visual cterm=reverse ctermbg=NONE

"colorscheme murphy

""""""""""""""""""""""""""""
" == R == 
""""""""""""""""""""""""""""
let maplocalleader=','

" Space line to send lines and selecion to R:
	vmap <Space> <Plug>RDSendSelection
	nmap <Space> <Plug>RDSendLine
