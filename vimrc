set nocompatible
filetype plugin indent on
syntax enable
let mapleader=' ' " Map leader key to be space
set autoread autowriteall
set backspace=indent,eol,start
set encoding=utf-8
set foldcolumn=1 nofoldenable
set guifont=Monaco:h12
set hidden
set history=1000
set ignorecase smartcase incsearch
set list listchars=tab:→\ ,extends:›,precedes:‹,nbsp:·,trail:␣ showbreak=↪\
set mouse=a ttymouse=xterm2 " Allows for mouse mode inside tmux
set noswapfile
set number
set path+=**
set showcmd " display incomplete commands
set textwidth=78 colorcolumn=+1
set timeoutlen=1000 ttimeoutlen=0
set wildignore+=*node_modules/*
set wildmenu wildmode=list:longest

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Quramy/tsuquyomi' " {{{
	let g:tsuquyomi_disable_quickfix=1
	let g:tsuquyomi_shortest_import_path=1
" }}}
Plug 'SirVer/ultisnips'
			\ | Plug 'honza/vim-snippets'
			\ | Plug 'mlaursen/vim-react-snippets'
			\ " {{{
	let g:snips_author='joshualim'
	let g:UltiSnipsExpandTrigger='<TAB>'
	let g:UltiSnipsJumpForwardTrigger='<TAB>'
	let g:UltiSnipsJumpBackwardTrigger='<S-TAB>'
	let g:UltiSnipsEditSplit='vertical' " :UltiSnipsEditSplit vertically
	let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

	command! UltiSnipsList call UltiSnips#ListSnippets()
" }}}
Plug 'Valloric/YouCompleteMe', {
			\ 'do': './install.py --go-completer --js-completer'
			\} " {{{
	let g:ycm_autoclose_preview_window_after_insertion=1
	let g:ycm_key_list_select_completion=['<C-N>']
	let g:ycm_key_list_previous_completion=['<C-P>']
	let g:ycm_filetype_blacklist = { 'gitcommit': 1 }
" }}}
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'benmills/vimux' "{{{
	nnoremap <Leader>vp :VimuxPromptCommand<CR>
	nnoremap <Leader>vl :VimuxRunLastCommand<CR>
	nnoremap <Leader>vi :VimuxInspectRunner<CR>
	nnoremap <Leader>vq :VimuxCloseRunner<CR>
	nnoremap <Leader>vx :VimuxInterruptRunner<CR>
	nnoremap <Leader>vz :call VimuxZoomRunner()<CR>
" }}}
Plug 'christoomey/vim-titlecase' " {{{
	let g:titlecase_map_keys=0
	nmap <Leader>gt  <Plug>Titlecase
	vmap <Leader>gt  <Plug>Titlecase
	nmap <Leader>gtt <Plug>TitlecaseLine
" }}}
Plug 'christoomey/vim-tmux-navigator'
Plug 'ciaranm/detectindent' " {{{
	autocmd BufReadPost * :DetectIndent
" }}}
Plug 'ervandew/supertab' " {{{
	let g:SuperTabDefaultCompletionType='<C-N>'
" }}}
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " {{{
	let g:go_fmt_command='goimports'
" }}}
Plug 'joshualim92/vim-colors-off'
Plug 'jremmen/vim-ripgrep' " {{{
	let g:rg_command='rg -i --vimgrep'
	let g:rg_highlight=1
	nnoremap <Leader>rgg :Rg<Space>
	nnoremap <Leader>rgh :Rg<Space><C-R>=expand('<cword>')<CR><Space><C-R>=expand('%')<CR>
" }}}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " {{{
	nnoremap <silent> <Leader>f     :Files<CR>
	nnoremap <silent> <Leader>b     :Buffers<CR>
	nnoremap <Leader>ag             :Ag<Space>
	xnoremap <silent> <Leader>ag    y:Ag <C-R>"<CR>
	nnoremap <silent> <Leader>`     :Marks<CR>
	nnoremap <silent> <Leader>af    :call fzf#vim#files('.',
				\ {'options':'--query '
				\ . split(expand("%:t"), '\.')[0]})<CR>
" }}}
Plug 'markonm/traces.vim'
Plug 'mbbill/undotree' " {{{
	nnoremap <Leader>u :UndotreeToggle<CR>
" }}}
Plug 'octref/RootIgnore'
Plug 'posva/vim-vue' " {{{
	let g:vue_disable_pre_processors=1
" }}}
Plug 'roxma/vim-window-resize-easy'
Plug 'scrooloose/nerdtree' " {{{
	let NERDTreeAutoDeleteBuffer=1
	let NERDTreeMapHelp='<LocalLeader>?'
	let NERDTreeQuitOnOpen=1

	nnoremap <Leader>nt :NERDTreeToggle<CR>
	nnoremap <Leader>nf :NERDTreeFind<CR>
" }}}
Plug 'sheerun/vim-polyglot'
Plug 'shime/vim-livedown', {
			\ 'for': 'markdown',
			\ 'do': 'npm install -g livedown'
			\}
Plug 'slashmili/alchemist.vim'
Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
Plug 'tpope/vim-commentary' " {{{
	command! -range C <line1>,<line2>Commentary
" }}}
Plug 'tpope/vim-fugitive' " {{{
	nnoremap <silent> <Leader>gs :Gstatus<CR>
" }}}
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'w0rp/ale' " {{{
	let g:ale_fix_on_save=1
	let g:ale_fixers={
				\ 'elixir': ['mix_format'],
				\ 'javascript': ['prettier', 'eslint'],
				\ 'json': ['prettier', 'eslint'],
				\ 'typescript': ['tslint'],
				\ 'vue': ['prettier', 'eslint']
				\}
" }}}

call plug#end()

colorscheme off
nnoremap <Leader>tcs :colorscheme <C-R>=colors_name == "off" ? "default" : "off"<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Cursorshape                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty($TMUX)
	let &t_SI="\<Esc>]50;CursorShape=1\x7"
	let &t_EI="\<Esc>]50;CursorShape=0\x7"
	let &t_SR="\<Esc>]50;CursorShape=2\x7"
else
	let &t_SI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	let &t_SR="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Command-line mode                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" Quickly expand current file name
cnoremap <C-R>fn <C-R>=expand('%')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Search                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader><Space> :set hls!<CR>
nnoremap <silent> # :set hls<CR>#
nnoremap <silent> * :set hls<CR>*
nnoremap <silent> ? :set hls<CR>?
nnoremap <silent> / :set hls<CR>/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Defaults                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre * :%s/\s\+$//e " Delete whitespace

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Whitespace Width                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! GetWidth call GetWidth()
function! GetWidth ()
	echo 'ts:' &ts 'sts:' &sts 'sw:' &sw 'expandtab:' &et
endfunction

command! -nargs=1 SetWidth call SetWidth(<f-args>)
function! SetWidth (width)
	let &l:ts  = a:width
	let &l:sts = a:width
	let &l:sw  = a:width
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Scripts                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! UpPlug call UpdatePlugins()
function! UpdatePlugins ()
	PlugUpgrade
	PlugClean
	PlugInstall
	PlugUpdate
endfunction

" Delete buffer but leave windows
command! BD bn | bd#

" Map open command
nnoremap <Leader>os :!open -a Safari<CR><CR>
nnoremap <Leader>og :!open https://google.com<CR><CR>
