compiler tex

function Compile()
	write
	cd %:p:h
	silent make
	cd -
	cwindow
endfunction

function Openpdf()
	cclose
	let opta = "--synctex-forward "
	let optb = line(".") . ":" . col(".") . ":" . '%:p'
	silent exec "!zathura '%:p:r'.pdf " .. opta .. optb .. " & disown"
	cwindow
endfunction

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <silent> <leader>q :call ToggleQuickFix()<LF>
nnoremap <silent> <TAB> :cnext<LF>
nnoremap <silent> <S-TAB> :cprevious<LF>
nnoremap <buffer> <leader>c :call Compile()<cr><cr>:call Openpdf()<lf>:echo "done"<LF>
nnoremap <buffer> <leader>o :call Openpdf()<LF>
nnoremap <buffer> <leader>s :so /home/mouad/.config/nvim/ftplugin/tex.vim<LF>
