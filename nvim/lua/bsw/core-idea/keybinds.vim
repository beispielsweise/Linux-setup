let mapleader = " "
let maplocalleader = "\\"

" Clear search highlights
nnoremap <leader>ch :nohlsearch<CR>

nnoremap <leader>qs <Action>(SaveAll)
nnoremap <leader>qf :qa!<CR>

" --- Window Navigation (<C-h,j,k,l>) ---
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- Window Resizing ---
nnoremap <C-S-h> :vertical resize +3<CR>
nnoremap <C-S-l> :vertical resize -3<CR>
nnoremap <C-S-j> :resize -3<CR>
nnoremap <C-S-k> :resize +3<CR>

" --- Splits & Tabs ---
nnoremap <M-,> :vsplit<CR>
nnoremap <M-.> :split<CR>
nnoremap <leader>w= <C-w>=
nnoremap <leader>wo <C-w>o

nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tq :tabclose<CR>
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>th :tabprevious<CR>
nnoremap <leader>wt <Action>(MoveEditorToNewWindow)

" --- Terminal ---
" Opens the built-in terminal tool window
nnoremap <leader>tt <Action>(ActivateTerminalToolWindow)

" Terminal Escape fix
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" --- Editor Behavior ---
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

vnoremap < <gv
vnoremap > >gv

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u
inoremap ( (<c-g>u

" --- Debugging  ---
nnoremap <leader>bb <Action>(ToggleLineBreakpoint)
nnoremap <leader>bc <Action>(Debugger.RemoveAllBreakpoints)
nnoremap <leader>ba <Action>(StepInto)
nnoremap <leader>bs <Action>(SmartStepInto)
nnoremap <leader>bd <Action>(StepOver)
nnoremap <leader>bf <Action>(Resume)
nnoremap <leader>bq <Action>(Stop)
