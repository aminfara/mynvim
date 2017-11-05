function! mynvim#helpers#relative_source(source_file) abort
  execute "source " . g:mynvim_config_dir . "/" . a:source_file
endfunction
