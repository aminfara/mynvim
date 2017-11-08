let g:mynvim_config_dir = fnamemodify(resolve(expand('<sfile>:p')), ':p:h')
let g:mynvim_local_dir = resolve(expand('~/.local/share/nvim'))

let mapleader = "\<Space>"

call mynvim#plugins#install_plugin_manager()
call mynvim#plugins#load_plugins()

call mynvim#common#behavioral_config()
call mynvim#common#visual_config()

call mynvim#statusline#airline_config()
call mynvim#finder#denite_config()
call mynvim#tags#gutentags_config()

call mynvim#mappings#all()
