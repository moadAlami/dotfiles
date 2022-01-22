let mapleader=','
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'deoplete-plugins/deoplete-jedi'
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
	Plug 'dense-analysis/ale'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'scrooloose/nerdtree'
	Plug 'itchyny/lightline.vim'
	Plug 'tpope/vim-surround'
	Plug 'jalvesaq/Nvim-R'
	Plug 'tommcdo/vim-lion'
	Plug 'tpope/vim-commentary'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

" Prevent clipboard hijacking
	inoremap  <C-r>+  <C-r><C-r>+
	inoremap  <C-r>*  <C-r><C-r>*


" Markdownn viewer
let g:mkdp_auto_start = 0

" Alignment aesthetics
	let b:lion_squeeze_spaces = 1

set formatoptions=1
set lbr

" align with gl<character>
	let g:lion_squeeze_spaces = 1

" languagetool
	map ,lf :!languagetool -l fr %<CR>
	map ,le :!languagetool -l en %<CR>

syntax enable
filetype plugin on

set number
set relativenumber
set nohlsearch
set tabstop=4
set nopaste
set sw=4

" Finding files
	set path+=**

" Spell check
	map <F6> :setlocal spell! spelllang=fr_fr<CR>
	map <F8> :setlocal spell! spelllang=en_us<CR>

" copy/cut and past from/to system clipboard
	xnoremap <c-c> "+y
	xnoremap <c-d> "+d
	nnoremap cp "+p


" correct spelling mistakes 
	inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"Disables automatic commenting on newline:
	autocmd FileType * set formatoptions-=cro

"Enable autocompletion:
	set wildmode=longest,list,full
	set wildmenu

" Execute python scripts
	map <F9> :exec 'w !python' <cr>

" run the selected python lines (outputs in the same buffer)
	map <C-space> :!python <cr>

" Tabs
	nnoremap <C-t> :tabnew <cr>
	" nnoremap <C-x> :tabclose <cr>
	nnoremap <C-p> :tabprevious <cr>

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
	nnoremap <s-s> i<CR><Esc>


" <++> Navigation
	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l

set t_Co=256
highlight Visual cterm=reverse ctermbg=NONE

"  _         _____   __  __
" | |    __ |_   _|__\ \/ /
" | |   / _` || |/ _ \\  / 
" | |__| (_| || |  __//  \ 
" |_____\__,_||_|\___/_/\_\
                         

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
" BibTex
	autocmd FileType tex map <leader>bt :!bibtex %:r <c-r><CR><CR>
" Build only
	autocmd FileType tex map <leader>bui :w! \| !lualatex <c-r>%<CR>
	" autocmd FileType tex map <leader>bui :w! \| !pdflatex <c-r>%<CR>

" Open the compiled .pdf
	autocmd FileType tex map <leader>o :!zathura <c-r>%<Backspace><Backspace><Backspace>pdf & <CR><CR>

" Textidote
	autocmd FileType tex map ,tf :!textidote --check fr --output html % > report.html; firefox report.html <c-r><CR><CR>
	autocmd FileType tex map ,te :!textidote --check en --output  html % > report.html; firefox report.html <c-r><CR><CR>
	

" Command Shortcuts
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,tt \texttt{}<++><Esc>T{i
	autocmd FileType tex inoremap ,sc \textsc{}<++><Esc>T{i
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
	
"  ____  _ _   _____   __  __
" | __ )(_) |_|_   _|__\ \/ /
" |  _ \| | '_ \| |/ _ \\  / 
" | |_) | | |_) | |  __//  \ 
" |____/|_|_.__/|_|\___/_/\_\

	autocmd FileType bib inoremap <leader>ar @article{,<Esc>oauthor = "<++>",<Enter>title = "<++>",<Enter>journal = "<++>",<Enter>volume = "<++>",<Enter>pages = "<++>",<Enter>year = "<++>"<Enter>}<Enter><Enter><backspace><++><Esc>09k0f{a
   	autocmd FileType bib inoremap <leader>bo @book{,<Esc>oauthor = "<++>",<Enter>title = "<++>",<Enter>year = "<++>",<Enter>publisher = "<++>"<Enter>}<Enter><Enter><backspace><++><Esc>07k0f{a
   	autocmd FileType bib inoremap <leader>mi @misc{,<Esc>ohowpublished = "\url{<++>}",<Enter>author = "<++>",<Enter>title = "<++>",<Enter>month = "<++>",<Enter>year = "<++>"<Enter>}<Enter><Enter><backspace><++><Esc>08k0f{a                             
   	autocmd FileType bib inoremap <leader>re @techreport{,<Esc>oauthor = "<++>",<Enter>title = "<++>",<Enter>year = "<++>",<Enter>institution = "<++>",<Enter>type = "<++>"<Enter>}<Enter><Enter><backspace><++><Esc>08kf{a                                 
	autocmd FileType bib inoremap <leader>ph @phdthesis{,<Esc>oauthor = "<++>",<Enter>title = "<++>",<Enter>year = "<++>",<Enter>school = "<++>"<Enter>}<Enter><Enter><backspace><++><Esc>07kf{a


"  _   _ _____ __  __ _
" | | | |_   _|  \/  | |
" | |_| | | | | |\/| | |
" |  _  | | | | |  | | |___
" |_| |_| |_| |_|  |_|_____|

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

"  ____  
" |  _ \ 
" | |_) |
" |  _ < 
" |_| \_\
       
" Space line to send lines and selecion to R:
	vmap <Space> <Plug>RDSendSelection
	nmap <Space> <Plug>RDSendLine

" kill and rerun dwm-bar
	autocmd BufWritePost ~/github/dwm-bar/dwm-bar !killall -q dwm-bar; setsid dwm-bar &


" kill and rerun dwmblocks
	autocmd BufWritePost ~/dwmblocks/config.h !cd ~/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
