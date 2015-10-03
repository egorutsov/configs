set number
set cindent
set tabstop=4
set shiftwidth=4
"set softtabstop=4
"set expandtab
set laststatus=2
set statusline="%F"
set splitright
set autowrite

syntax enable
colorscheme desert

execute pathogen#infect()

let g:clang_library_path = '/usr/lib/llvm-3.4/lib/libclang.so'
let g:clang_auto_select = 1
let g:clang_close_preview = 0
let g:clang_snippets = 1
let g:clang_snippets_engine = "clang_complete"

" conceal in insert (i), normal (n) and visual (v) modes
set concealcursor=inv

" hide concealed text completely unless replacement character is defined
set conceallevel=2
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

hi TabLine ctermfg=Black ctermbg=Gray cterm=none
hi TabLineSel ctermfg=White ctermbg=LightGreen cterm=bold
hi Pmenu ctermfg=Black ctermbg=Gray
hi PmenuSel ctermfg=White ctermbg=LightGreen

let g:tagbar_autofocus = 1
let g:tagbar_width = 35

let NERDTreeWinSize = 35

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

"au VimEnter * NERDTree
"au VimEnter * wincmd w

inoremap <Nul> <C-x><C-u>

nmap <F2> :NERDTreeTabsToggle<CR>
nmap <F3> :TagbarToggle<CR>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set nobackup

set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
