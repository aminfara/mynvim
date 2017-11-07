function! mynvim#finder#denite_config()
  call denite#custom#map('insert', 'jk', '<denite:enter_mode:normal>', 'noremap')
  call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')
  call denite#custom#map('insert', '<S-Down>', '<denite:assign_next_matched_text>', 'noremap')
  call denite#custom#map('insert', '<S-Up>', '<denite:assign_previous_matched_text>', 'noremap')

  call denite#custom#map('normal', '<Down>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('normal', '<Up>', '<denite:move_to_previous_line>', 'noremap')

  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
        \ [ '.git/', 'build/', '__pycache__/'])

  call denite#custom#source(
        \ 'file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
endfunction
