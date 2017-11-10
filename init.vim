let g:mynvim_config_dir = fnamemodify(resolve(expand('<sfile>:p')), ':p:h')
let g:mynvim_local_dir = resolve(expand('~/.local/share/nvim'))

let mapleader = "\<Space>"

call mynvim#helpers#pyenv_setup()

call mynvim#plugins#manage()

call mynvim#common#behavioral_config()
call mynvim#common#visual_config()

call mynvim#statusline#configs()
call mynvim#finder#configs()
call mynvim#tags#gutentags_config()
call mynvim#indentguides#indent_guides_config()
call mynvim#filetree#configs()

call mynvim#mappings#all()
