" Unmap the arrow keys
no <down> ddp
no <up> ddkP


"quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>[ []<ESC>i
imap <leader>( ()<ESC>i


"tabs
nmap <C-n> :tabnew<CR>
imap <C-n> <ESC>:tabnew<cr>i
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
imap <C-h> <ESC> :tabprevious<CR>
imap <C-l> <ESC> :tabnext<CR>
nmap <C-w> <ESC> :tabclose<cr>




nnoremap <silent> <A-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-l> :execute 'silent! tabmove ' . tabpagenr()<CR>


nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j


"NERDTree toggle
nmap <C-t> :NERDTreeToggle<CR>


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


"ctrlp
let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


"gitgutter
let g:gitgutter_sign_column_always = 1
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk


let g:gitgutter_sign_added = 'xx'
let g:gitgutter_sign_modified = 'yy'
let g:gitgutter_sign_removed = 'zz'
let g:gitgutter_sign_removed_first_line = '^^'


"enter
nmap <S-CR> $a<CR>


"vim-easy
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)


" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)


"easymotion
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion


let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 


" Gif config


" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings


" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)


" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1


"highlight
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
nnoremap H :set cursorline! cursorcolumn!<CR>


"switching between windiwns
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>


"Ultisllip
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-tab>" 
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit = vertical
