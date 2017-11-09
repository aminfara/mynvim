function! mynvim#mappings#all()
  nnoremap <silent><Leader>db :<C-u>Denite buffer<CR>
  nnoremap <silent><Leader>df :<C-u>Denite file_rec<CR>
  nnoremap <silent><Leader>ds :<C-u>Denite grep:::!<CR>
  nnoremap <silent><Leader>dt :<C-u>Denite tag<CR>
  nnoremap <silent><Leader>dws :<C-u>DeniteCursorWord grep<CR>
  nnoremap <silent><Leader>dwt :<C-u>DeniteCursorWord tag<CR>

  nnoremap <silent><Leader>tt :<C-u>TagbarToggle<CR>

  call mynvim#filetree#mappings()
endfunction
