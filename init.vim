let g:mynvim_config_dir = fnamemodify(resolve(expand('<sfile>:p')), ':p:h')
let g:mynvim_local_dir = resolve(expand('~/.local/share/nvim'))

call mynvim#helpers#relative_source('general.vim')
call mynvim#helpers#relative_source('plugins.vim')
