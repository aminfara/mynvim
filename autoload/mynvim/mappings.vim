function! mynvim#mappings#all()
  call mynvim#finder#mappings()
  call mynvim#filetree#mappings()
  call mynvim#statusline#mappings()
  call mynvim#tags#mappings()
endfunction
