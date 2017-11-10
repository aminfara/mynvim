function! mynvim#tags#plugins()
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'majutsushi/tagbar', { 'on':  'TagbarOpen' }
  call mynvim#plugins#set_need_install('vim-gutentags')
  call mynvim#plugins#set_need_install('tagbar')
endfunction

function! mynvim#tags#configs()
  if mynvim#plugins#plugin_exists('vim-gutentags')
    call s:mynvim_tags_gutentags_config()
  endif

  if mynvim#plugins#plugin_exists('tagbar')
    call s:mynvim_tags_tagbar_config()
  endif
endfunction

function! mynvim#tags#mappings()
  if mynvim#plugins#plugin_exists('vim-gutentags')
  endif

  if mynvim#plugins#plugin_exists('tagbar')
    nnoremap <silent><Leader>tt :<C-u>TagbarOpen fj<CR>
    nnoremap <silent><Leader>tc :<C-u>TagbarClose<CR>
  endif
endfunction

function! s:mynvim_tags_gutentags_config()
endfunction

function! s:mynvim_tags_tagbar_config()
  let g:tagbar_autofocus = 1
endfunction
