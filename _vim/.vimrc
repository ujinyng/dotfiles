if empty(glob('~/.vim/autoload/plug.vim'))
" if !filereadable('~/.vim/autoload/plug.vim')
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

"Plug 'tomasiser/vim-code-dark'
"Plug 'dracula/vim
Plug 'ujinyng/candid-custom.vim' "Plug 'flrnd/candid.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'valloric/youcompleteme', {'do': 'sudo ./install.py --clang-completer --all'}
Plug 'neoclide/coc.nvim', {'branch': 'release'} "{'tag': '*', 'do':'./install.sh'}
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugn'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'dsimidzija/vim-nerdtree-ignore'
"install uing homebrew
Plug '/usr/local/opt/fzf'  
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/syntastic'
"plug 'vim-plugins/c-support'

Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
Plug 'cyrus-and/gdb-dashboard', {'do': 'cp gdb-dashboard/.gdbinit ~/'}
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

let mapleader=','

"use OS clipboard
set clipboard=unnamed
set ttimeout
"wait up to 5ms after Esc for special key
set ttimeoutlen=5

let g:coc_global_extensions = ['coc-marketplace', 'coc-tsserver', 'coc-sh', 'coc-css', 'coc-html', 'coc-stylelint', 'coc-stylelintplus', 'coc-svg', 'coc-json',  'coc-yaml', 'coc-flow', 'coc-prettier', 'coc-eslint', 'coc-python',  'coc-go', 'coc-markdownlint', 'coc-highlight', 'coc-lists', 'coc-emoji', 'coc-dictionary', 'coc-snippets', 'coc-tag', 'coc-actions', 'coc-utils', 'coc-syntax', ]

"-------------nerdtree------------
" B: show bookmark toggle
" F: show file toggle
" I: show hidden file toggle
" f: use file filter toggle
" CD: change the root to cwd
" cd: change cwd to selected node(:tcd)
" A: zoom nerdtree_winnree toggle
" P: move parent node
" q: close nerdtree
" --- autostart nerd-tree when you start vim ---
autocmd VIMENTER *
  \   if !argc()
  \ |   Startify
" \ |   NERDTree
  \ |   wincmd w
  \ | endif

nnoremap ;n :NERDTreeToggle<CR>
nnoremap ;f :NERDTreeFind<CR>

" to hide unwanted files
let g:NERDTreeIgnore = [ '__pycache__', '\.pyc$', '\.o$', '\.swp',  '*\.swp',  'node_modules/', '1', '()', '.vscode' ]

"change the CWD(current working directory) :tcd
let g:NERDTreeUseTCD=1
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeStatusLine = -1
"auto close nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
if exists("loaded_nerdtree_gitignore_filter")
  finish
endif

"prevent opening file in nerdtree when nerdtree is focused
"files opend with fzf, mapping, :edit etc
"https://github.com/junegunn/fzf/issues/453

autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
autocmd BufWinEnter * call PreventBuffersInNERDTree()

function! PreventBuffersInNERDTree()
  if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
    \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
    \ && &buftype == '' && !exists('g:launching_fzf')
    let bufnum = bufnr('%')
    close
    exe 'b ' . bufnum
  endif
  if exists('g:launching_fzf') | unlet g:launching_fzf | endif
endfunction
"-----------vim-nerdtree-syntax-highlight----------------
"Disable Highlighting
" let g:NERDTreeDisableFileExtensionHighlight = 1
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1
"
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0
" more config
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight

"-----------vim-tmux-navigator----------
let g:tmux_navigator_no_mappings = 1
"ctrl-h,j,k,l
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" 1- Write the current buffer, but only if chnaged
":update
" 2- Write all buffers before navigating from Vim to tmux pane
":wall
" let g:tmux_navigator_save_on_switch = 2

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


"---------------autopairs---------------
let g:Autopairsflymode =1
"c-h 를 방향키로 하기위해 설정 필요.
let g:AutoPairsMapCh = 0
let g:AutoPairsMapBS = 0
let g:Autopairsshortcutbackinsert = '<m-b>'
"Rust
au FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
"htlm
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])

"---------colorscheme-candid theme------
set termguicolors
set background=dark
if (has("termguicolors"))
  set termguicolors
endif
colorscheme candid
"let g:airline_theme ='dracula'

"---------vim-airline-----------dracula
let g:airline#extensions#tabline#enabled = 1 "buffer목록 켜기
let g:airline_theme='base16'
"let g:airline#extensions#tabline#fnamemod = ':t' "buffer목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1 " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:'

"-----------------fzf------------------------
set shell=/usr/bin/zsh

let g:fzf_history_dir='~/.local/share/fzf-history'

let g:fzf_layout = { 'window': 'let g:launching_fzf = 1 | keepalt topleft 100split enew' }

" -color-line="38;5;202"
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--no-color', fzf#vim#with_preview({
      \ 'dir':s:find_git_root(),
      \ 'options': '$FZF_DEFAULT_OPTS --delimiter : --nth 4..'}), <bang>0)

function! s:find_git_root()
   let root = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
   return v:shell_error ? {} : {'dir':root}
endfunction

nnoremap <leader>gs :call fzf#vim#gitfiles({
  \ 'source' : 'Ag -g " "',
  \ 'options': '--query',
  \ })<CR>

noremap <silent> <leader>c :Commands<CR>

command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
      \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))

" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run(fzf#vim#with_preview({
\   'option': $FZF_HIGHLIGHT_PREVIEW_OPTS,
\   'down': '40%',
\   'sink': 'botright split' }))<CR>

" \   'option': FZF_PREIVEW_COMMAND,
" Open files in vertical split
nnoremap <silent> <Leader>v :call fzf#run(fzf#vim#with_preview({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' }))<CR>

" \   'option': $FZF_DEFAULT_OPTS,
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

"Select buffer: ,b
nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

"Most recently used: ,h
nnoremap <silent> <leader>h :FZFMru<CR>
command! FZFMru call fzf#run(fzf#vim#with_preview({
\  'source':  reverse(s:all_files()),
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})
\ )
function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val ! 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

"search lines in all opened buffer: ,l
nnoremap <leader>l :Lines<CR>

"jump to tags in the current buffer: ,t
nnoremap <leader>t :BTags<CR>


"Auto select to use GitFiles or Files based on the project directory: ,g
nnoremap <leader>g :call FzfOmniFiles()<CR>
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfun





":FZFNeigh
"-Fuzzy search files in parent directory of current file: ,n
nnoremap <leader>n :FZFNeigh<CR>
command! FZFNeigh call s:fzf_neighbouring_files()
function! s:fzf_neighbouring_files()
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'Ag -g "" -f ' . cwd . ' --depth 4'

  call fzf#run(fzf#vim#with_preview({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
        \ 'window':  'enew' }))
endfunction

nnoremap <leader>db :BD<CR>
command! BD call fzf#run(fzf#wrap({
  \ 'source': s:buflist(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction


"---------buffer setting---------
set hidden "탭없이버퍼사용할때 필수, 버퍼 수정 직후 버퍼를 감춰지도록 함"
"open new buffer with startify
" nnoremap <silent><S-t> :enew<CR>:Startify<CR>
"split and open new buffer with startify"
nnoremap <silent><S-t> :sp<CR>:Startify<CR>
nnoremap <C-p> :bprevious!<CR> "이전 버퍼로 이동
nnoremap <C-n> :bnext!<CR> "다음 버퍼로 이동
nnoremap <silent><C-q> :bp <BAR> bd #<CR> "현재버퍼를 닫고 이전 버퍼로 이동
":ls는 모든버퍼와 버퍼의상태를 출력함
":b <번호>
":e <파일경로>


""ESC키 대신 aa (set paste 해제해야함)
""insert to normal
"inoremap aa <ESC>
""command to normal
"cmap aa <ESC>
""visual/select to normal
"vnoremap aa <ESC>

"insert to command
noremap! ;; <ESC>:
"normal to command
nnoremap ;; <ESC>:
"vsual/select to command
vnoremap ;; <ESC>:

"visual/select to insert
vnoremap a <ESC>a

""입력모드에서 커서이동
"imap <C-h> <C-o>h
"imap <C-j> <C-o>j
"imap <C-k> <C-o>k
"imap <C-l> <C-o>l
" imap <C-^> <C-o>^
" imap <C-\> <C-o>$

"---------Move cursor ----------
"jump to the start of the line:
  "keep normal: ;b (custom)
  "change insert: I
"jump to the end of the line:
  "keep normal: ;w (custom)
  "change insert: A
"append a new line below/above:o/O
"move backward/forward: b/w,e
"go to the first line of the document: gg
"go to the last line of the document: G
"H,M,L

"custom
nnoremap ;b ^
nnoremap ;w $

""-------------UltiSnips---------
"let g:UltiSnipsExpandTrigger="<Tab>"
"let g:UltiSnipsJumpForwardTrigger="<Tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
"let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']
"let g:UltiSnipsSnippetDirectories = ['UltiSnips'] "~/.vim/UltiSnips


"-------------git-fugitive----------------












nnoremap gadd :Gwrite
""-------------coc.nvim----------
set nowritebackup
set cmdheight=2
"set signcolumn
set updatetime=100
set shortmess+=c
set signcolumn=yes

" To get correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>pf  <Plug>(coc-format-selected)
nmap <leader>pf  <Plug>(coc-format-selected)
" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)

"----------- option ],[로 이동, <CR>로 선택, <Tab> 으로 첫번째 선택
inoremap <expr> <M-]> pumvisible()? ("\<C-n>"):""
inoremap <expr> <M-[> pumvisible()? ("\<C-p>"):""

inoremap <expr> <ESC> pumvisible()? "<C-g>a":"<ESC>"

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = 'j'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = 'k'
"
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

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info') "has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()


"coc-highlight
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:airline#extensions#coc#enbled = 1

" let airline#extensions#coc#error_symbol = 'E:'
" let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"------------------vimwiki----------------------------------
let g:vimwiki_list = [
  \{
        \               'path': '~/Dbox/vimwiki',
        \               'ext': '.md',
        \               'diary_rel_path': '.'
        \}]

let g:vimwiki_conceallevel = 0
let g:vimwiki_folding='list'
let g:md_modify_disabled = 0
function! LastModified()
  if g:md_modify_disabled
    return
  endif
  if &modified
    " echo('markdown updated time modified')
     let save_cursor = getpos(".")
    let n = min([10, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
    \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun

function! NewTemplate()

    let l:wiki_directory = v:false

    for wiki in g:vimwiki_list
        if expand('%:p:h') . '/' == wiki.path
            let l:wiki_directory = v:true
            break
        endif
    endfor

    if !l:wiki_directory
        return
    endif

    if line("$") > 1
        return
    endif

    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'layout  : wiki')
    call add(l:template, 'title   : ')
    call add(l:template, 'summary : ')
    call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'tags    : ')
    call add(l:template, 'toc     : true')
    call add(l:template, 'ublic  : true')
    call add(l:template, 'parent  : ')
    call add(l:template, 'latex   : false')
    call add(l:template, '---')
    call add(l:template, '* TOC')
    call add(l:template, '{:toc}')
    call add(l:template, '')
    call add(l:template, '# ')
    call setline(1, l:template)
    execute 'normal! G'
    execute 'normal! $'

    echom 'new wiki page has created'
endfunction
autocmd BufRead,BufNewFile *.md call NewTemplate()
augroup vimwikiauto
    autocmd BufWritePre *wiki/*.md call LastModified()
    autocmd BufRead,BufNewFile *wiki/*.md call NewTemplate()
augroup END
"--------------startify--------------
nnoremap ;ss :SSave<CR>
nnoremap ;q :SClose<CR>
nnoremap ;st :Startify<CR>
nnoremap ;sl :SLoad<CR>
nnoremap ;sd :SDelete<CR>
let g:startify_session_dir= '~/.local/share/nvim/session/'
let g:startify_session_persistence = 1
let g:startify_bookmarks = [
 \ {'vi':'~/.vimrc'},
 \ {'zs':'~/.zshrc'},
 \ {'ze':'~/.zshenv'},
 \ {'zp':'~/.zprofile'},
 \ {'wi':'~/Dropbox/vimwiki/index.md'},
 \ {'tm':'~/.tmux.conf'},
 \ {'co':'~/.config/nvim/coc-settings.json'},
 \ {'gi':'~/.gitconfig'}]
let g:startify_session_autoload=1
let g:startify_session_before_save=['silent! NERDTreeTabsClose']
let g:startify_session_persistence=1
let g:startify_update_oldfiles=1
let g:startify_session_delete_buffers=0
let g:startify_fortune_use_unicode=1 "for utf-8"
let g:startify_session_savevars=[]
let g:startify_session_savecmds=[]
  function! s:list_commits ()
    let git = 'git -C ~/repo'
    let commits = systemlist(git .' log --oneline | head -n10')
    let git = 'G'. git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
  endfunction

let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   🕰   Recent files'] },
  \ { 'type': 'sessions',  'header': ['   🚀  Sessions'] },
  \ { 'type': 'commands',  'header': ['   📀  Commands'] },
  \ { 'type': 'bookmarks', 'header': ['   💎  Boookmarks'] },
  \ { 'type': function('s:list_commits'),  'header': ['   📥  Commits'] },
 \ ]

"----commentary.vim------
autocmd filetype apache setlocal commentstring=#\ %s
noremap <leader>/ :Commentary<cr>

syntax on "Syntax Highlighting
filetype plugin indent on
set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set autoindent
set smarttab "using auto space or tab for indent and alignment
set cindent "c용 들여쓰기
"set paste
set expandtab

set bs=indent,eol,start

set nu "line number
set scrolloff=2

"cursor start at the last modified
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

set laststatus=2 "statusbar
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\ %FugitiveStatusline()
set ruler

set autowrite "set to auto write on opening an other file
set autoread "set to auto read when a file is changed from the outside

set history=256
set showmatch "show matching brackets when text indicator is over them

"Search without uppercase letters or case-insensitie
set ignorecase "대소문자구문 없이 매칭
set smartcase "결과에 대문자가 있으면 대문자가 들어가는거만 매칭"

set hlsearch "Highlight search result
set incsearch "Make search act like search in modern browsers

"use mouse for visual mode or not
set mouse=a
"set mouse=-af
set mousefocus

set showcmd "키보드 눌러서 사용하는 명령어보여줌
set visualbell "beep대신에 visual bell 사용

set wildmode=longest,list
set wildmenu "자동완성 기능 향상

"파일 인코딩
set fileencodings=UTF-8,euc-kr
set encoding=utf-8
set langmenu=utf-8
"to use fzf in vim"
set rtp+=/usr/local/opt/fzf

