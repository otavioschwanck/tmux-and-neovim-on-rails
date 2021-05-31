call plug#begin('~/.vim/plugged')
  " Search stuff
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "" Track the engine.
  Plug 'SirVer/ultisnips'

  " Snippets are separated from the engine. Add this if you want them:
  Plug 'honza/vim-snippets'

  " Project root
  Plug 'dbakker/vim-projectroot'

  " Auto reload 
  Plug 'djoshea/vim-autoread'

  " Only git client you need
  Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }

  " Nerdtree
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " UI
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'mhinz/vim-startify'

  " Editing like a god
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'justinmk/vim-sneak'
  Plug 'matze/vim-move'
  Plug 'kremso/vim-spectator'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'AndrewRadev/sideways.vim'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'AndrewRadev/switch.vim'
  Plug 'maxbrunsfeld/vim-yankstack'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-eunuch'
  Plug 'jeetsukumaran/vim-indentwise'

  " Ruby on Rails
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-bundler'
  Plug 'kremso/vim-spectator'
  Plug 'tpope/vim-endwise'

  " Web
  Plug 'mattn/emmet-vim'

  " Airline for the tabs
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Editor goodies
  Plug 'Yggdroot/indentLine'

  " gcc plz
  Plug 'preservim/nerdcommenter'

  " running tests in tmux = <3
  Plug 'thoughtbot/vim-rspec'
  Plug 'jgdavey/tslime.vim'

  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver',
			  \ 'coc-solargraph', 'coc-yank', 'coc-snippets']
call plug#end()

" SPC as leader = <3
let mapleader = " "

" Some nice configs
set number
set relativenumber
set ic
set colorcolumn=125
set encoding=UTF-8
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

autocmd FileType nerdtree setlocal nolist

" open new split panes to right and below
set splitright
set splitbelow

" Opening Private Configs
nnoremap <silent> <leader>fp :e ~/.config/nvim/init.vim <cr>
nnoremap <silent> <leader>fc :e ~/.config/nvim/coc.vim <cr>
nnoremap <silent> <leader>fC :e ~/.config/nvim/coc-settings.json <cr>
nnoremap <leader>fr :so ~/.config/nvim/init.vim <cr>

"" Ruby
" Rspec Command
let g:rspec_command = ':!tmux send-keys -t 2 "bundle exec rspec {spec}" ENTER; tmux select-window -t 2'

" vim-rspec mappings
map <silent><Leader>tv :call RunCurrentSpecFile()<CR>
map <silent><Leader>ts :call RunNearestSpec()<CR>
map <silent><Leader>tr :call RunLastSpec()<CR>
map <silent><Leader>ta :call RunAllSpecs()<CR>

map <silent><Leader>rr :!tmux send-keys -t 4 "bundle exec rails console" ENTER && tmux select-window -t 4<CR>
map <silent><Leader>rR :!tmux send-keys -t 3 C-c C-c && tmux send-keys -t 3 "bundle exec rails server" ENTER<CR>

" Timeout lenght to improve performance
set ttimeoutlen=100

" Theme
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme gruvbox
set background=dark

" Nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> <leader><tab> :NERDTreeToggle<CR>
nnoremap <silent> <leader>e :NERDTreeFind<CR>

" use Ctrl + Alft + hjkl to move between split/vsplit panels
tnoremap <C-M-h> <C-\><C-n><C-w>h
tnoremap <C-M-j> <C-\><C-n><C-w>j
tnoremap <C-M-k> <C-\><C-n><C-w>k
tnoremap <C-M-l> <C-\><C-n><C-w>l
nnoremap <C-M-h> <C-w>h
nnoremap <C-M-j> <C-w>j
nnoremap <C-M-k> <C-w>k
nnoremap <C-M-l> <C-w>l
nnoremap <silent><C-Space> <C-w><C-w>
nnoremap <M-o> <C-w><C-w>

" Change tabs with ALT + 1...9
nmap <M-1> <Plug>AirlineSelectTab1
nmap <M-2> <Plug>AirlineSelectTab2
nmap <M-3> <Plug>AirlineSelectTab3
nmap <M-4> <Plug>AirlineSelectTab4
nmap <M-5> <Plug>AirlineSelectTab5
nmap <M-6> <Plug>AirlineSelectTab6
nmap <M-7> <Plug>AirlineSelectTab7
nmap <M-8> <Plug>AirlineSelectTab8
nmap <M-9> <Plug>AirlineSelectTab9

" Editor ney keybindings
nmap Ç :wall! <CR>
nmap ç :w! <CR>
nmap <leader>k :bd! <CR>
nmap <leader>, :Buffers <CR>
nmap <M-,> :bp <CR>
nmap <M-;> :bn <CR>

" Tab to search
nmap <expr> <TAB>
      \ !pumvisible() ? "\/" : "\<TAB>"

nmap <expr> <C-TAB> \ !pumvisible() ? "\?" : "\<S-TAB>" to $
nmap - $
vmap - $

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>
imap <M-BS> <C-W>

" Make  Y copy until end of the line
nnoremap Y y$

" Rails better shortcuts
nmap <Leader>a :A<CR>
nmap <Leader>A :AV<CR>

nmap <Leader>rs :Ebusiness 
nmap <Leader>rS :Eservice 
nmap <Leader>rc :Econtroller 
nmap <leader>ru :Efixtures 
nmap <leader>rh :Ehelper 
nmap <leader>ri :Einitializer 
nmap <leader>rl :Elocale 
nmap <leader>r@ :Emailer 
nmap <leader>rn :Emigration 
nmap <leader>rm :Emodel 
nmap <leader>ra :Eadmin 
nmap <leader>re :Ecell
nmap <leader>rt :Espec 
nmap <leader>ry :Estylesheet 
nmap <leader>rk :Etask 
nmap <leader>rv :Eview 

" Sneak mode
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Rails Projections
source ~/.config/nvim/rails_projections.vim
source ~/.config/nvim/coc.vim

" Git navigation
nmap ]g :GitGutterNextHunk <CR>
nmap [g :GitGutterPrevHunk <CR>
nmap <Leader>gr :GitGutterUndoHunk <CR>
nmap <Leader>gv :GitGutterPreviewHunk <CR>

" Autoreload files!
set autoread
au CursorHold * checktime

let g:startify_change_to_vcs_root = 1

" Jumps to cursor last position
" Only do this part when compiled with support for autocommands
 if has("autocmd")
   augroup redhat
     autocmd!
       " When editing a file, always jump to the last cursor position
         autocmd BufReadPost *
           \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  augroup END
endif

" Clear highlighting on escape in normal mode
nnoremap <silent><esc> :noh<return><esc>
nnoremap <esc>^[" <esc>^[

" Run rubocop on current file
nmap <silent><Leader>= :!bundle exec rubocop -a % <CR>
nmap <silent><Leader>+ :!bundle exec rubocop -a <CR>

nmap <silent><Leader><Enter><Enter> :!tmux new-window -n "rspec" && tmux new-window -n "server" && tmux new-window -n "Console" && tmux select-window -t 1<CR>
nmap <silent><Leader><Enter><Esc> :!tmux kill-window -a<CR>

" Project Search with Ag
nmap <Leader>sp :Ag 
nmap <Leader>sP :CocSearch 

nmap <Leader><space> :FZF<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let $FZF_DEFAULT_OPTS='--reverse'
let $FZF_DEFAULT_COMMAND = 'ag -g "" --hidden --ignore .git'

let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
"
" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-tab>"

" Sideways
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

let g:switch_mapping = ""

nnoremap <C-a> :Switch<CR>

vnoremap <C-y> :'<,'>w !xclip -selection clipboard<Cr><Cr>

func! GetSelectedText()
  normal gv"xy
  let result = getreg("x")
  normal gv
  return result
endfunc

function SendToConsole() range
  echo system('tmux send-keys -t 4 '.shellescape(join(getline(a:firstline, a:lastline), "\n")).' Enter; tmux select-window -t 4')
endfunction

function SendToRspec() range
  echo system('tmux send-keys -t 2 '.shellescape(join(getline(a:firstline, a:lastline), "\n")).' Enter; tmux select-window -t 2')
endfunction

function SendToServer() range
  echo system('tmux send-keys -t 3 '.shellescape(join(getline(a:firstline, a:lastline), "\n")).' Enter; tmux select-window -t 3')
endfunction

vmap <silent><C-s> :call SendToConsole() <CR>
vmap <Silent><C-S> :call SendToRspec() <CR>
vmap <Silent><C-M-s> :call SendToServer() <CR>

nmap <Leader>d Obyebug<Esc>
nmap <Leader>D O<% byebug %><Esc>

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Yankstack
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-P> <Plug>yankstack_substitute_newer_paste

nmap <leader>P <Plug>yankstack_substitute_newer_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap <M-s> <Plug>(easymotion-overwin-f2)
vmap <M-s> <Plug>(easymotion-overwin-f2)

" Change tabs with alt
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Change tabs with ALT + 1...9
nmap <M-1> <Plug>AirlineSelectTab1
nmap <M-2> <Plug>AirlineSelectTab2
nmap <M-3> <Plug>AirlineSelectTab3
nmap <M-4> <Plug>AirlineSelectTab4
nmap <M-5> <Plug>AirlineSelectTab5
nmap <M-6> <Plug>AirlineSelectTab6
nmap <M-7> <Plug>AirlineSelectTab7
nmap <M-8> <Plug>AirlineSelectTab8
nmap <M-9> <Plug>AirlineSelectTab

" file stuff
nmap <Leader>fD :Unlink 
nmap <Leader>fR :Rename 
nnoremap 0 ^
vmap 0 ^

nnoremap 0 ^

nmap <C-j> ]=
nmap <C-k> [=
vmap <C-j> ]=
vmap <C-k> [=
 
let g:user_emmet_leader_key='<C-e>'
call yankstack#setup()
