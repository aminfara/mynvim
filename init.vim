let g:mynvim_config_dir = fnamemodify(resolve(expand('<sfile>:p')), ':p:h')
let g:mynvim_local_dir = resolve(expand('~/.local/share/nvim'))

call mynvim#plugins#install_plugin_manager()

" Any source or function that installs plugins should go between
" plug#begin and plug#end
call plug#begin(g:mynvim_plug_vim_plugins)

call mynvim#plugins#generic_plugins()

call plug#end()
