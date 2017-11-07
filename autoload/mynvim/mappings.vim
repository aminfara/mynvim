function! mynvim#mappings#all()
  nnoremap <silent><Leader>db :<C-u>Denite buffer<CR>
  nnoremap <silent><Leader>df :<C-u>Denite file_rec<CR>
  nnoremap <silent><Leader>dg :<C-u>Denite grep:::!<CR>
endfunction
