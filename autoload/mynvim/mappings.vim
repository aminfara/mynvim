function! mynvim#mappings#all()
  call mynvim#finder#mappings()
  nnoremap <silent><Leader>tt :<C-u>TagbarToggle<CR>

  call mynvim#filetree#mappings()
  call mynvim#statusline#mappings()
endfunction
