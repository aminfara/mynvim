function! mynvim#finder#plugins()
  function! UpdateRemotePlugin(argument)
    UpdateRemotePlugins
  endfunction

  Plug 'Shougo/denite.nvim', { 'do': function('UpdateRemotePlugin') }
  call mynvim#plugins#set_need_install('denite.nvim')
endfunction

function! mynvim#finder#configs()
  if mynvim#plugins#plugin_exists('denite.nvim')
    call s:mynvim_finder_denite_config()
  endif
endfunction

function! mynvim#finder#mappings()
  if mynvim#plugins#plugin_exists('denite.nvim')
    nnoremap <silent><Leader>db :<C-u>Denite buffer<CR>
    nnoremap <silent><Leader>df :<C-u>Denite file_rec<CR>
    nnoremap <silent><Leader>ds :<C-u>Denite grep:::!<CR>
    nnoremap <silent><Leader>dt :<C-u>Denite tag<CR>
    nnoremap <silent><Leader>dws :<C-u>DeniteCursorWord grep<CR>
    nnoremap <silent><Leader>dwt :<C-u>DeniteCursorWord tag<CR>
  endif
endfunction

function! s:mynvim_finder_denite_config()
  call denite#custom#option('_', {
        \ 'prompt': 'λ:',
        \ 'winheight': 16,
        \ 'source_names': 'short',
        \ 'vertical_preview': 1,
        \ 'auto-accel': 1,
        \ 'auto-resume': 1,
        \ })

  if executable('ag')
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts',
          \ ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  endif

  call denite#custom#map('insert', 'jk', '<denite:enter_mode:normal>', 'noremap')
  call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')
  call denite#custom#map('insert', '<S-Down>', '<denite:assign_next_matched_text>', 'noremap')
  call denite#custom#map('insert', '<S-Up>', '<denite:assign_previous_matched_text>', 'noremap')

  call denite#custom#map('normal', '<Down>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('normal', '<Up>', '<denite:move_to_previous_line>', 'noremap')

  call denite#custom#map('_', '<C-S>', '<denite:do_action:split>', 'noremap')
  call denite#custom#map('_', '<C-X>', '<denite:do_action:vsplit>', 'noremap')
  call denite#custom#map('_', '<Esc>', '<denite:quit>', 'noremap')

  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
        \ [ '.git/', 'build/', '__pycache__/'])

  call denite#custom#source(
        \ 'file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
endfunction
