function! mynvim#filetree#nerdtree_config()
  if !empty(glob(g:mynvim_plug_vim_plugins . '/nerdtree'))
    let g:NERDTreeShowHidden=1
    augroup mynvim_filetree
      autocmd!
      autocmd bufenter * call s:mynvim_filetree_close_if_only_control_window_left()
    augroup END
  endif
endfunction

function! mynvim#filetree#nerdtree_open()
  if !empty(glob(g:mynvim_plug_vim_plugins . '/nerdtree'))
    if exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
      NERDTreeFocus
    else
      NERDTreeToggle
    endif
  endif
endfunction

function! s:mynvim_filetree_close_if_only_control_window_left()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix' " TODO: maybe better to separate this
    q
  endif
endfunction
