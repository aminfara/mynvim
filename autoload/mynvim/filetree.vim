function! mynvim#filetree#plugins()
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  call mynvim#plugins#set_need_install('nerdtree')
endfunction

function! mynvim#filetree#configs()
  if mynvim#plugins#plugin_exists('nerdtree')
    call s:mynvim_filetree_nerdtree_config()
  endif
endfunction

function! mynvim#filetree#mappings()
  if mynvim#plugins#plugin_exists('nerdtree')
    nnoremap <silent><Leader>nn :<C-u>call <SID>mynvim_filetree_nerdtree_open()<CR>
    nnoremap <silent><Leader>nc :<C-u>NERDTreeToggle<CR>
  endif
endfunction

function! s:mynvim_filetree_nerdtree_open()
  if mynvim#plugins#plugin_exists('nerdtree')
    if exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
      NERDTreeFocus
    else
      NERDTreeToggle
    endif
  endif
endfunction

function! s:mynvim_filetree_nerdtree_config()
  if mynvim#plugins#plugin_exists('nerdtree')
    let g:NERDTreeShowHidden=1
    augroup mynvim_filetree
      autocmd!
      autocmd bufenter * call s:mynvim_filetree_close_if_only_control_window_left()
    augroup END
  endif
endfunction

function! s:mynvim_filetree_close_if_only_control_window_left()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix' " TODO: maybe better to separate this
    quit
  endif
endfunction
