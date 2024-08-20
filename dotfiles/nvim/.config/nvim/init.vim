set scrolloff=8
set number
set rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim' " or other package manager
call plug#end()

"...
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
"colorscheme darkblue
"colorscheme desert

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>con :edit ~/.config/nvim/init.vim<CR> 
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>i i_<Esc>r
nnoremap <leader>s :s/
nnoremap <leader>x : !chmod +x %<CR>
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessioniser<CR>
nnoremap <C-n> :noh<CR>
inoremap { {}<Esc>i<CR><CR><Esc>ki<Tab>
"vnoremap <C-9> di()<Esc>P

"Java
nnoremap <leader><C-j> :! javac %<CR>
inoremap <C-j>s System.out.println();<Esc>hi
