let g:mynvim_plugins_need_install = 0

function! mynvim#plugins#manage()
  call s:mynvim_plugins_install_plugin_manager()
  call s:mynvim_plugins_load_plugins()
  call s:mynvim_plugins_install_plugins()
endfunction

function! mynvim#plugins#plugin_exists(plugin_name)
  return !empty(glob(g:mynvim_local_dir.'/plugins/'.a:plugin_name))
endfunction

function! mynvim#plugins#set_need_install(plugin_name)
  if !mynvim#plugins#plugin_exists(a:plugin_name)
    let g:mynvim_plugins_need_install = 1
  endif
endfunction

function! s:mynvim_plugins_install_plugin_manager()
  function! s:mynvim_plugins_set_need_install_callback()
    let g:mynvim_plugins_need_install = 1
  endfunction

  let l:mynvim_plugins_plug_vim_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  call s:mynvim_plugins_set_plugin_dirs()
  call mynvim#helpers#download_file(
          \ l:mynvim_plugins_plug_vim_url,
          \ g:mynvim_plugins_plug_vim_path,
          \ function('s:mynvim_plugins_set_need_install_callback'))
endfunction

function! s:mynvim_plugins_load_plugins()
  call plug#begin(g:mynvim_plugins_path)
  Plug 'tpope/vim-surround'

  Plug 'chriskempson/base16-vim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'Shougo/denite.nvim', { 'do': function('UpdateRemotePlugins') }

  Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
  Plug 'ludovicchabant/vim-gutentags'

  Plug 'nathanaelkane/vim-indent-guides'

  call mynvim#filetree#plugins()
  call plug#end()
endfunction

function! s:mynvim_plugins_install_plugins()
  if g:mynvim_plugins_need_install
    augroup mynvim_plugins
      autocmd!
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    augroup END
  endif
endfunction

function! s:mynvim_plugins_set_plugin_dirs()
  let g:mynvim_plugins_plug_vim_path = g:mynvim_local_dir . '/site/autoload/plug.vim'
  let g:mynvim_plugins_path = g:mynvim_local_dir . '/plugins'
endfunction

function! UpdateRemotePlugins(argument)
  UpdateRemotePlugins
endfunction
