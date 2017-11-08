function! mynvim#plugins#set_plugin_dirs()
  let g:mynvim_plug_vim_path = g:mynvim_local_dir . '/site/autoload/plug.vim'
  let g:mynvim_plug_vim_plugins = g:mynvim_local_dir . '/plugins'
endfunction

function! mynvim#plugins#install_plugin_manager()
  let l:mynvim_plug_vim_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  call mynvim#plugins#set_plugin_dirs()
  call mynvim#helpers#download_file(
          \ l:mynvim_plug_vim_url,
          \ g:mynvim_plug_vim_path,
          \ function('s:mynvim_plugins_plug_install_callback'))
endfunction

function! mynvim#plugins#load_plugins()
  call plug#begin(g:mynvim_plug_vim_plugins)
  Plug 'tpope/vim-surround'

  Plug 'chriskempson/base16-vim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'Shougo/denite.nvim', { 'do': function('UpdateRemotePlugin') }

  Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
  Plug 'ludovicchabant/vim-gutentags'

  Plug 'nathanaelkane/vim-indent-guides'

  call plug#end()
endfunction

function! s:mynvim_plugins_plug_install_callback()
  " Install all plugins if plug.vim is newly installed
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endfunction

function! UpdateRemotePlugin(argument)
  UpdateRemotePlugins
endfunction
