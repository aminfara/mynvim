" TODO: Check general config of nvim again

function! mynvim#common#behavioral_config()
  call s:mynvim_common_behavioral_trailing_whitespace()
  call s:mynvim_common_behavioral_vimfiles_config()
  call s:mynvim_common_behavioral_indentation_config()
  call s:mynvim_common_behavioral_search_config()
  call s:mynvim_common_behavioral_spellcheck_config()

  ""
  " Miscellaneous (TODO: needs cleanup)
  "
  set ttimeout
  set ttimeoutlen=100
  set completeopt+=noinsert             " causes deoplete to select first choice
  set hidden                            " enable multiple modified buffer
  set omnifunc=syntaxcomplete#Complete  " turn on builtin auto-completion
  set switchbuf=useopen,usetab,newtab   " switching buffers behavior
endfunction

function! mynvim#common#visual_config()
  call s:mynvim_common_visual_folding_config()
  call s:mynvim_common_visual_invisibles_config()
  call s:mynvim_common_visual_scroll_config()
  call s:mynvim_common_visual_split_config()
  call s:mynvim_common_visual_terminal_config()
  call s:mynvim_common_visual_colorscheme_config()
  call s:mynvim_common_visual_wildmenu_config()
  call s:mynvim_common_visual_wraping_config()

  ""
  " Miscellaneous (TODO: needs cleanup)
  "
  set cursorline                        " draws a line to show the current line
  set noshowmode                        " don't show mode, status bar plugin will show it
  set number                            " show line numbers
  set ruler                             " show cursor position
  set showcmd                           " show partial command
  set visualbell                        " beep visually
endfunction

" Visual config functions
"----------------------------------------
function! s:mynvim_common_visual_folding_config()
  set foldlevelstart=10
  set foldnestmax=10
  set foldmethod=syntax
  set foldenable
endfunction

function! s:mynvim_common_visual_invisibles_config()
  set listchars=tab:⇥\ ,trail:·
  set list  " Show invisible characters
endfunction

function! s:mynvim_common_visual_scroll_config()
  set scrolloff=5
  set sidescrolloff=10
endfunction

function! s:mynvim_common_visual_split_config()
  set splitbelow
  set splitright
endfunction

function! s:mynvim_common_visual_terminal_config()
  " Setting color to 16 for xterm
  if &term == "xterm" || &term == 'screen'
    set t_Co=16
    " clearing using the current background color
    set t_ut=
  endif

  if $COLORTERM == 'gnome-terminal'
    set term='xterm-256color'
  endif

  " Setting color to 256 for more sophisticated terminals
  if &term =~ '256color'
    set t_Co=256
    " clearing using the current background color
    set t_ut=
  endif
endfunction

function! s:mynvim_common_visual_colorscheme_config()
  colorscheme default
  if !empty(glob(g:mynvim_local_dir.'/plugins/base16-vim'))
              \ && filereadable(expand("~/.vimrc_background"))
    let g:base16colorspace=256
    source ~/.vimrc_background
  endif
endfunction

function! s:mynvim_common_visual_wildmenu_config()
  set wildmode=longest,full
  set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
endfunction

function! s:mynvim_common_visual_wraping_config()
  set colorcolumn=80
  set textwidth=0
  set wrapmargin=0
  set wrap
  set linebreak
  set breakindent
endfunction

" Behavioral config functions
"----------------------------------------
function! s:mynvim_common_behavioral_trailing_whitespace()
  augroup mynvim_common
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END
endfunction

function! s:mynvim_common_behavioral_vimfiles_config()
  set nobackup
  set noswapfile
  set undofile
  set undolevels=2000
  set autowriteall
endfunction

function! s:mynvim_common_behavioral_indentation_config()
  set expandtab
  set shiftwidth=2
  set tabstop=2
endfunction

function! s:mynvim_common_behavioral_search_config()
  set ignorecase
  set smartcase
endfunction

function! s:mynvim_common_behavioral_spellcheck_config()
  call mynvim#helpers#download_file('http://ftp.vim.org/vim/runtime/spell/en.utf-8.spl',
              \ g:mynvim_local_dir . '/site/spell/en.utf-8.spl')
  call mynvim#helpers#download_file('http://ftp.vim.org/vim/runtime/spell/en.utf-8.sug',
              \ g:mynvim_local_dir . '/site/spell/en.utf-8.sug')
  set spell
  set spelllang=en_au
endfunction
