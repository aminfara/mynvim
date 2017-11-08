function! mynvim#helpers#pyenv_setup()
  if executable('pyenv')
    let g:python_host_prog = systemlist('pyenv which python2')[0]
    let g:python3_host_prog = systemlist('pyenv which python3')[0]
  endif
endfunction

function! mynvim#helpers#relative_source(source_file) abort
  execute "source " . g:mynvim_config_dir . "/" . a:source_file
endfunction

function! mynvim#helpers#download_file(url, destination, ...)
  if empty(glob(a:destination))
    let s:download_callback = get(a:, 1, 0)
    try
      echomsg a:destination . " does not exists!"
      echomsg "Downloading " . a:url . " to " . a:destination
      silent execute '!curl -fLo ' . a:destination . ' --create-dirs ' . a:url
      if s:download_callback != 0
        call s:download_callback()
      endif
    catch
      echoerr 'Could not download ' . a:url
    endtry
  endif
endfunction
