"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              " 
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

"============================================================
" On a new system (after running symlink):
"============================================================
" 1) Install Vundle into Plugin Directory instead of Bundle
"    (git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/plugin/Vundle.vim)
"    (git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim)
"
" 2) Install Coc Marketplace
"    CocInstall coc-marketplace
"
" 3) Bracey Prerequisites 
"    cd ~/.vim/bundle/bracey.vim
"    npm install --prefix server
"============================================================

"============================================================
" Vundle (Plugins)
"============================================================

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.config/nvim/bundle/Vundle.vim
"call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.config/nvim/bundle/')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mattn/emmet-vim'
Plugin 'turbio/bracey.vim', {'do':'npm install --prefix server'}
Plugin 'neoclide/coc.nvim', {'branch':'release'}
Plugin 'atom/fuzzy-finder'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/powerline'   
Plugin 'pseewald/vim-anyfold'
Plugin 'tpope/vim-commentary'
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-eunuch'
Plugin 'ryanoasis/vim-devicons'
Plugin 'iamcco/markdown-preview.nvim' 
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mileszs/ack.vim'
Plugin 'voldikss/vim-floaterm'
" Plugin 'sainnhe/everforest'

" Plugin 'Raimondi/delimitMate'
Plugin 'sainnhe/gruvbox-material'

call vundle#end()

"============================================================
" Global Configs
"============================================================

"----------=== Basics Settings ===----------

set mouse=n
set scrolloff=10
set wrap
set nocompatible              " not compatible with old fashioned vi mode
set autoread		      " autoread when filed is changed from the outside
syntax on
set re=0
filetype on                   " enable filetype detection
filetype indent on 	      " enable filetype specific indenting
filetype plugin on            " enable filetype specific plugins
set noerrorbells
set incsearch
set smartcase 		      " When searching for uppercase = ignores lowercase
set cursorline
set ignorecase 		      " Make searches NOT case sensitive
set hlsearch                  " Enable Search Highlighting
set encoding=utf-8

" Yank filename to register.
nnoremap <leader>FN :let @+ = expand("%")<cr>

" move section up and down - thx jat
"vnoremap J :m '>+1<CR>gv
"vnoremap K :m '<-2<CR>gv

let g:vim_current_word#highlight_current_word = 1


"----------=== Colorsheme Settings ===----------

if has('termguicolors')
	set termguicolors
endif

let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_better_performance = 1
set background=dark
colorscheme gruvbox-material

"----------=== Airline Settings ===----------

let g:airline_theme = 'tomorrow'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop = 0 

"-----------------------------------------------

" This sets the status/powerline to always show (not only when more than one
" buffer open)
set laststatus=2

" Refer to https://github.com/vim/vim/issues/24
set timeout timeoutlen=5000 ttimeoutlen=100

" Colorscheme

" Hides buffer instead of abandoning it when a new buffer is opened
set hidden

" Set line numbering
set nu
" Relative line numbering
set relativenumber
if (has("macunix"))
	set clipboard=unnamed
else
	set clipboard=unnamedplus	
endif

" Set splits to only appear on the right or on the bottom of the viewport
set splitbelow
set splitright

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Backup Files
" set backup              " save backup files
" set backupdir=~/.vim/backup/ " where to put backup file
" set dir=~/.vim/tmp      " tell vim where to put swap files


" Set LineNumber Color
" hi LineNr guifg=#546d79
"
" Remove Cursorline Color
hi CursorLineNr guifg=#ffe47e

" Matching parenthesis color
hi MatchParen cterm=bold guifg=#ffaea5 guibg=white

" Highlight visual selection color
hi Visual guifg=#000000 guibg=#FFFFFF gui=none

" Set leader as 'space'
let mapleader = " "
"
"----------=== Ack/Ag Settings ===----------

if executable('ag') 
	let g:ackprg = 'ag --vimgrep'
endif

nnoremap <leader>p :Ack<space>

"-----------------------------------------------



" zoom active pane
nnoremap <leader>Z <C-w>\|
nnoremap <leader>z <C-w>=

" opens vimrc in vertical split
nnoremap <leader>ev :vs ~/.config/nvim/init.vim<cr>

" vertical split shortcut
nnoremap <leader>vs :vs<cr>

" show undotree
nnoremap <leader>u :UndotreeShow<cr>

" Remap FZF to Ctrl-P
nnoremap <silent> <C-p> :Files<CR>

" Enable folding
"set foldmethod=indent   "fold based on indent
"set foldcolumn=1
"set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
set foldlevel=99         "this is just what i use

autocmd Filetype * AnyFoldActivate


" Bracey shortcut
nnoremap <leader>br :Bracey <cr>
nnoremap <leader>bs :BraceyStop <cr>

" Markdown Preview shortcuts
nnoremap <leader>mdp :MarkdownPreview <cr>
nnoremap <leader>mds :MarkdownPreviewStop <cr>

" Enable folding with the spacebar
nnoremap <leader><Space> za

" Macro for nerdtree
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>

" Remove search highlighting when pressing
nnoremap =h :noh<Return>


"============================================================
" Config for Coc
"============================================================
" Smart-f
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

nmap <silent><leader>gd <Plug>(coc-definition)
nmap <silent><leader>GD :vs<CR><Plug>(coc-definition)
nmap <silent><leader>gr <Plug>(coc-references)
nmap <silent><leader>rr <Plug>(coc-rename)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nnoremap <leader>rrf :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>rf :CocAction('coc-refactor')<CR>

" Show Documentation
nnoremap <silent><leader>D  :call <SID>show_documentation()<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Show Coc Flutter Commands
nmap <silent><leader>ll :CocList --input=flutter commands<CR>
nmap <silent><leader>le :CocList FlutterEmulators<CR>
nmap <silent><leader>ld :CocList FlutterDevices<CR>

autocmd FileType php set iskeyword+=$

"============================================================
" Config for UltiSnips
"============================================================
inoremap <c-x><c-k> <c-x><c-k>
let g:UltiSnipsExpandTrigger='<leader><CR>'


"============================================================
" Config for tmux navigator
"============================================================
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-w><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-w><C-l> :TmuxNavigateRight<cr>


if has('nvim')
    augroup vimrc_term
        autocmd!
        autocmd WinEnter term://* nohlsearch
        autocmd WinEnter term://* startinsert

        autocmd TermOpen * tnoremap <buffer> <C-w>h <C-\><C-n> :TmuxNavigateLeft<cr>
        autocmd TermOpen * tnoremap <buffer> <C-w>j <C-\><C-n> :TmuxNavigateDown<cr>
        autocmd TermOpen * tnoremap <buffer> <C-w>k <C-\><C-n> :TmuxNavigateUp<cr>
        autocmd TermOpen * tnoremap <buffer> <C-w>l <C-\><C-n> :TmuxNavigateRight<cr>
        autocmd TermOpen * tnoremap <buffer> <C-w><C-h> <C-\><C-n> :TmuxNavigateLeft<cr>
        autocmd TermOpen * tnoremap <buffer> <C-w><C-j> <C-\><C-n> :TmuxNavigateDown<cr>
        autocmd TermOpen * tnoremap <buffer> <C-w><C-k> <C-\><C-n> :TmuxNavigateUp<cr>
        autocmd TermOpen * tnoremap <buffer> <C-w><C-l> <C-\><C-n> :TmuxNavigateRight<cr>
       " autocmd TermOpen * tnoremap <buffer> <C-h> <C-\><C-n> :TmuxNavigateLeft<cr>
        " autocmd TermOpen * tnoremap <buffer> <C-j> <C-\><C-n> :TmuxNavigateDown<cr>
        " autocmd TermOpen * tnoremap <buffer> <C-k> <C-\><C-n> :TmuxNavigateUp<cr>
        " autocmd TermOpen * tnoremap <buffer> <C-l> <C-\><C-n> :TmuxNavigateRight<cr>
    augroup END
endif

augroup vimrc_term_fzf 
  autocmd!
  " Do some other stuff independent of nvim.
  if has('nvim')
    autocmd FileType fzf tunmap <buffer> <C-w>h
    autocmd FileType fzf tunmap <buffer> <C-w>j
    autocmd FileType fzf tunmap <buffer> <C-w>k
    autocmd FileType fzf tunmap <buffer> <C-w>l
    " autocmd FileType fzf tunmap <buffer> <C-h>
    " autocmd FileType fzf tunmap <buffer> <C-j>
    " autocmd FileType fzf tunmap <buffer> <C-k>
    " autocmd FileType fzf tunmap <buffer> <C-l>
  endif
augroup END

"============================================================
" Config for Nerd Tree
"============================================================

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! CloseHiddenBuffers call s:CloseHiddenBuffers()
function! s:CloseHiddenBuffers()
	let open_buffers = []

	for i in range(tabpagenr('$'))
		call extend(open_buffers, tabpagebuflist(i + 1))
	endfor

	for num in range(1, bufnr("$") + 1)
		if buflisted(num) && index(open_buffers, num) == -1
			exec "bdelete ".num
		endif
	endfor
endfunction

"============================================================
" Config for Markdown and json Filetypes:
"============================================================

autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead,BufEnter *.Rmd,*.rmd,*.md :syn match markdownIgnore "\$.*_.*\$"

" JSON format (=j)
nmap =j :%!python -m json.tool<CR>


"============================================================
" Config for Floaterm:
"============================================================

nnoremap <leader>\ :FloatermToggle<cr> 
tnoremap <leader>\ <c-\><c-n> :FloatermToggle<cr>

let g:floaterm_width =0.5 
let g:floaterm_height = 0.5
let g:floaterm_wintype = 'float'
let g:floaterm_position = 'bottomright'
let g:floaterm_title = 'Terminal $1|$2'
let g:floaterm_borderchars = '─│─│╭╮╯╰'
let g:floaterm_autoinsert = v:true
hi Floaterm guibg=NONE
hi FloatermBorder guifg=#FEFBEA


"============================================================
" Config for Python Filetypes:
"============================================================

au BufNewFile,BufRead *.py
			\ set tabstop=4|
			\ set softtabstop=4|
			\ set shiftwidth=4|
			\ set textwidth=79|
			\ set expandtab|
			\ set autoindent|
			\ set fileformat=unix|

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


let python_highlight_all=1

"Remove whitespaces
autocmd Filetype python nmap =c :%s/\s\+$//e<CR>

"Macro to run code (F9) which opens :term vertically
autocmd Filetype python nnoremap <buffer> <F9> :w<CR>:vert ter python3 "%"<CR>

"macro to run code (F8) which opens :term horizontally
autocmd Filetype python nnoremap <buffer> <F8> :w<CR>:ter python3 "%"<CR>

" Macro to run code (F9)
"autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"
" Highlight BadWhitespace Color
highlight BadWhitespace ctermbg=red guibg=red
" Indent backspace
set backspace=indent,eol,start


"============================================================
" Config for HTML and CSS Filetypes:
"============================================================
au BufNewFile,BufRead *.html,*.htmi,*.php
			\ setlocal tabstop=4|
			\ setlocal softtabstop=4|
			\ setlocal shiftwidth=4|
			\ setlocal expandtab|
			\ setlocal autoindent|
			\ setlocal smartindent


" Only allow Emmet to work for html/css files
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
autocmd FileType html,css,php imap <buffer> <leader><tab> <plug>(emmet-expand-abbr)

" autocmd FileType html,css nnoremap -c :exe ':silent !open -a /Applications/Google_Chrome.app'<CR>
" NOT WORKING FOR NOW


"============================================================
" Config for Typescript Filetypes:
"============================================================

au BufNewFile,BufRead *.js
			\ set tabstop=4|
			\ set softtabstop=4|
			\ set shiftwidth=4|
			\ set expandtab|
			\ set autoindent

" Java beautify
autocmd FileType typescript,javascript nmap <buffer>  =c :call JsBeautify()<CR>
" for json
autocmd FileType json noremap <buffer> =c :call JsonBeautify()<CR>
" for jsx
autocmd FileType jsx noremap <buffer> =c :call JsxBeautify()<CR>
" for html
autocmd FileType html,php noremap <buffer> =c :call HtmlBeautify()<CR>
" for sql
autocmd FileType sql noremap <buffer> =c :CocCommand sql.Format<CR>
" for css or scss
autocmd FileType css nmap  =c :call CSSBeautify()<CR>

"============================================================
" Config for Dart Filetypes:
"============================================================

au BufNewFile,BufRead *.dart
			\ set tabstop=4|
			\ set softtabstop=4|
			\ set shiftwidth=4|
			\ set expandtab|
			\ set autoindent

"============================================================
" Config for Snippet Filetypes:
"============================================================

au BufNewFile,BufRead *snippets
			\ set tabstop=4|
			\ set softtabstop=4|
			\ set shiftwidth=4|
			\ set expandtab|
			\ set autoindent


au BufNewFile,BufRead *.txt,*.md
			\ set tabstop=2|
			\ set softtabstop=2|
			\ set shiftwidth=2|
			\ set expandtab|
			\ set autoindent


"============================================================
" Config for C# Filetypes:
"============================================================

au BufNewFile,BufRead *.cs
			\ set tabstop=4|
			\ set softtabstop=4|
			\ set shiftwidth=4|
			\ set expandtab|
			\ set autoindent
