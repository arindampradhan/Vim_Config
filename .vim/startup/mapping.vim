" Unmap the arrow keys
no <down> ddp
no <up> ddkP


"quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

nmap <C-t> :tabnew<CR>

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <silent> <A-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-l> :execute 'silent! tabmove ' . tabpagenr()<CR>

nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j


"NERDTree toggle
nmap <C-n> :NERDTreeToggle<CR>


"closing windows
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd lclose\|bdelete


"saving
nmap <f4> :w<CR>
imap <f4> <Esc>:w<CR>
noremap <f4> :w<CR>
vnoremap <f4> <C-C>:w<CR>
inoremap <f4> <C-O>:w<CR>
"quitting
nmap <f3> :q<CR>
imap <f3> <Esc>:q<CR>
noremap <f3> :q<CR>
vnoremap <f3> <C-C>:q<CR>
inoremap <f3> <C-O>:q<CR>






function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

"Unite mapping
noremap <Leader>W :w !sudo tee % > /dev/null
nnoremap <silent> <C-S-tab-p> :Unite grep:.<CR>
nnoremap <silent> <C-S-p> :Unite -quick-match buffer<cr>
nnoremap <silent> <C-p> :Unite <cr>
nnoremap <silent> <C-tab> :Unite history/yank<cr>


