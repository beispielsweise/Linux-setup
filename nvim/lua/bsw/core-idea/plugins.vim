let mapleader = " "

" Emulates vim-surround
set surround 
" Emulates Comment.nvim / vim-commentary
set commentary         
" Text objects for arguments (cia, daa)
set argtextobj         
" Brief highlight on yank
set highlightedyank    
" Requires 'Which-Key' plugin from Marketplace
set which-key          
set notimeout
" % matching extended
set matchit            
" stay-centered.nvim setting
set scrolloff=10       " Keeps cursor away from edges, 999 for max center

" --- FUZZIER ---
nnoremap <leader>ff <Action>(com.mituuz.fuzzier.search.Fuzzier)
nnoremap <leader>fs <Action>(com.mituuz.fuzzier.grep.FuzzyGrepCI)
nnoremap <leader>fr <Action>(com.mituuz.fuzzier.search.FuzzierVCS)
nnoremap <leader>fc <Action>(com.mituuz.fuzzier.grep.FuzzyGrepCurrentBufferCI)
nnoremap <leader>ft <Action>(com.mituuz.fuzzier.search.FuzzierOpenTabs)

" --- Project tree ---
nnoremap <leader>ee <Action>(ActivateProjectToolWindow)
nnoremap <leader>er <Action>(SelectInProjectView)

" --- Diagnostics ---
nnoremap <leader>xx <Action>(ActivateProblemsViewToolWindow)
nnoremap [d <Action>(GotoPreviousError)
nnoremap ]d <Action>(GotoNextError)
