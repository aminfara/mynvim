function! mynvim#indentguides#indent_guides_config()
  if !empty(glob(g:mynvim_plug_vim_plugins . '/vim-indent-guides'))
    let g:indent_guides_start_level = 2
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
    let g:indent_guides_color_change_percent = 5
    let g:indent_guides_auto_colors = 0

    augroup mynvim_indent_guides
      autocmd!
      autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  ctermbg=18
      autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven ctermbg=19
    augroup END
  endif
endfunction
