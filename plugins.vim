let s:mynvim_plug_vim_path = g:mynvim_local_dir . '/site/autoload/plug.vim'
let s:mynvim_plug_vim_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:mynvim_plug_vim_plugins = g:mynvim_local_dir . '/plugins'

if empty(glob(s:mynvim_plug_vim_path))
  silent execute "!curl -fLo " . s:mynvim_plug_vim_path . ' --create-dirs ' . s:mynvim_plug_vim_url

  " Install all plugins if plug.vim is newly installed
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:mynvim_plug_vim_plugins)

Plug 'vim-airline/vim-airline'

call plug#end()
