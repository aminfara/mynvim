function! mynvim#statusline#airline_config()
  if mynvim#plugins#plugin_exists('vim-airline')
    let g:airline_powerline_fonts = 0
    let g:airline_theme = 'base16'
    let g:airline#extensions#tabline#enabled = 1

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    let g:airline#extensions#tabline#left_sep = '▏'
    let g:airline#extensions#tabline#left_alt_sep = '▏'
    let g:airline#extensions#tabline#right_sep = '▕'
    let g:airline#extensions#tabline#right_alt_sep = '▕'
    let g:airline_left_sep          = ''
    let g:airline_left_alt_sep      = '>'
    let g:airline_right_sep         = ''
    let g:airline_right_alt_sep     = '<'
    let g:airline_symbols.readonly  = '⊘'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇' "⮑, ➔, ➥, ⤴
    " let g:airline_symbols.paste     = 'ρ' "Þ, ∥
    let g:airline_symbols.whitespace = 'Ξ'
  endif
endfunction
