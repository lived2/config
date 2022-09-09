" =========================================================================
" =  Plug-In                                                              =
" =========================================================================
" - ~/.vim/plugged 폴더에 플러그인이 설치됩니다.

"if has('nvim')			" nvim 을 사용 중이라면
let using_neovim = has('nvim')
let using_vim = !using_neovim

if using_neovim
    call plug#begin("~/.config/nvim/plugged")
else
    call plug#begin("~/.vim/plugged")
endif

" Conquer Of Completion 자동완성 플러그인
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or latest tag
"Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" Or build from source code by use yarn: https://yarnpkg.com
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'prabirshrestha/vim-lsp'
" lsp
if using_neovim
    Plug 'neovim/nvim-lsp' " nvim-lsp
    Plug 'mattn/vim-lsp-settings'
    Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
endif
Plug 'jackguo380/vim-lsp-cxx-highlight'

if using_neovim
    " nvim-treesitter 구문 파싱 하이라이팅
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter'

    " Terminal toggle
    Plug 'caenrique/nvim-toggle-terminal'
endif

" Tagbar 코드 뷰어 창
" Plug 'majutsushi/tagbar'
Plug 'preservim/tagbar'

" NERDTree 코드 뷰어 창
"Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdtree'

" 하단에 다양한 상태(몇 번째 줄, 인코딩, etc.)를
" 표시하는 상태바 추가
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CScope 플러그인
Plug 'ronakg/quickr-cscope.vim'

" CtrlP 파일 탐색 플러그인
Plug 'ctrlpvim/ctrlp.vim'

" 비활성 윈도우 강조
" Plug 'blueyed/vim-diminactive'

" vim cutlass 잘라내기 명령어가 yank 에 영향을 주지 않음
"Plug 'svermeulen/vim-cutlass'

" VIM GAS(GNU ASsembler) Highlighting
Plug 'Shirk/vim-gas'

"Plug 'octol/vim-cpp-enhanced-highlight'

" Rust
Plug 'rust-lang/rust.vim'

" go
if using_neovim
    "Plug 'autozimu/LanguageClient-neovim' " LanguageClient-neovim
    Plug 'neovim/nvim-lspconfig'
    Plug 'ray-x/go.nvim'
endif
Plug 'fatih/vim-go'
Plug 'nsf/gocode'

" Python
Plug 'davidhalter/jedi-vim'
Plug 'hynek/vim-python-pep8-indent'   " python 자동 들여쓰기 Plugin
Plug 'nvie/vim-flake8'                " python 문법 검사 plugin

" 컬러스킴(색상표) jellybeans, gruvbox
"Plug 'morhetz/gruvbox'
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
if using_neovim
    Plug 'marko-cerovac/material.nvim'
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}
else
    Plug 'nanotech/jellybeans.vim'
endif

call plug#end()
" =========================================================================

" 파일 마지막 위치 기억
au BufReadPost *
	  \ if line("'\"") > 0 && line("'\"") <= line("$") |
	  \ exe "norm g`\"" |
	  \ endif

set si " smart indent
set cindent    " c style indent
set nocompatible    " 방향키로 이동 가능
set fileencodings=utf-8,euc-kr    " 파일 저장 인코딩 : utf-8, euc-kr
set fencs=ucs-bom,utf-8,euc-kr    " 한글 파일은 euc-kr, 유니코드는 유니코드
set title    " 제목 표시
set wmnu    " tab 을 눌렀을 때 자동완성 가능한 목록

" =========================================================================
" 화면 설정
syntax on    " 문법 하이라이트 on
set number " 라인 넘버 표시. (= nu)
set showcmd " 사용자가 입력한 명령어 표시
set showmatch " 현재 선택된 괄호의 쌍을 표시
"set relativenumber " 커서를 기준으로 라인 넘버 표시. 커서 위치에 따라 바뀜. (= rnu)
set cursorline " 커서가 있는 라인을 강조 표시. (= cul)
set ruler " 커서 위치 표시. (= ru)
set laststatus=2 " 상태바 표시. (= ls) [0: 상태바 미표시 / 1: 2개 이상의 윈도우에서 표시 / 2: 항상 표시]
" 상태바 커스터마이징 %<item>으로 사용하며, \는 구분자로 공백을 넣을 경우는 구분자를 넣어줘야함.
set statusline=%F\ %y%m%r\ %=Line:\ %l/%L\ [%p%%]\ Col:%c\ Buf:%n
hi statusline ctermfg=White ctermbg=4 cterm=none "활성화된 상태바 배경색 및 폰트색 설정
hi statuslineNC ctermfg=White ctermbg=8 cterm=none " 윈도우가 2개 이상인 경우 비활성화된 윈도우의 배경색 및 폰트색 설정
set mouse=a " 마우스로 스크롤 및 리사이즈 가능. [n : Normal mode / v : Visual mode / i : Insert mode / a : All modes]
set showtabline=2
set termguicolors
" mkview 명령어가 저장하는 요소 중
" 하나인 `options` 를 제거
set viewoptions-=options

if using_neovim
	set inccommand=nosplit	" nvim live %s substitute (실시간 강조)
endif

" =========================================================================
" 검색 설정
set hlsearch " 검색된 결과 강조 표시. (= hls)
set ignorecase " 검색시 대소문자를 구분하지 않음. (= ic)
set incsearch " 검색어를 입력할 때마다 일치하는 문자열을 강조해서 표시. (= is)
set smartcase " ignore 옵션이 켜져있더라도 검색어에 대문자가 있다면 정확히 일치하는 문자열을 찾음. (= scs)
set path+=**

" =========================================================================
" 들여쓰기 설정
set autoindent " 새로운 라인이 추가될 때, 이전 라인의 들여쓰기에 자동으로 맞춤. (= ai)
set expandtab  " Tab을 Space로 변경. (= et)
set tabstop=4 " 탭으로 들여쓰기시 사용할 스페이스바 개수. (= ts)
set shiftwidth=4 " <<, >> 으로 들여쓰기시 사용할 스페이스바 개수. (= sw)
set softtabstop=4 " 스페이스바 n개를 하나의 탭으로 처리. (= sts)
" ex) 스페이스바 4개가 연속으로 있다면 백스페이스로 스페이스바를 지우면 스페이스바 4개를 하나의 탭으로 인식해 삭제.
"set cinoptions=p0,t0,:N,=:0
set cinoptions=l1,b1,g0
set cinwords=if,else,while,do,for,switch,case
filetype indent on " indent.vim 파일에 설정된 파일 형식별 들여쓰기 적용.

" =========================================================================
" 입력 설정
"set clipboard=unnamed " vim에서 복사한 내용이 클립보드에 저장
set backspace=eol,start,indent " 라인의 시작과 끝의 들여쓰기를 백스페이스로 지움.
set history=1000 " 편집한 내용 저장 개수 (되돌리기 제한 설정)
"set paste " 다른 곳에서 복사한 내용을 붙여넣을 때, 자동 들여쓰기가 적용되는 것을 막아 복사한 내용을 들여쓰기없이 복사.
set pastetoggle=<F2> " paste 옵션이 적용되면 들여쓰기가 옵션이 제대로 작동하지 않기 때문에 toggle식으로 옵션을 키고 끌 수 있음.

" =========================================================================
" 커서 설정
"if &term == 'win32'
"        let &t_ti.=" \e[1 q"
"        let &t_SI.=" \e[5 q-- INSERT --"
"        let &t_EI.=" \e[1 q"
"        let &t_te.=" \e[0 q"
"else
"        let &t_ti.="\e[1 q"
"        let &t_SI.="\e[5 q"
"        let &t_EI.="\e[1 q"
"        let &t_te.="\e[0 q"
"endif
set guicursor=a:blinkon100

" =========================================================================
" Color scheme
" =========================================================================
if using_neovim
    "material
    "colorscheme material
    " darker lighter oceanic palenight "deep ocean"
    "let g:material_style = "darker"
    "let g:material_style = "palenight"

    "catppuccin
    "let g:catppuccin_flavour = "dusk" " dusk latte, frappe, macchiato, mocha
    "let g:catppuccin_flavour = "latte" " dusk latte, frappe, macchiato, mocha
    colorscheme catppuccin
else
    colorscheme jellybeans
endif
"colorscheme tokyonight

" =========================================================================
" material_style
" =========================================================================
"
" =========================================================================


" =========================================================================
" 키맵
" =========================================================================
nmap <F8> :set invnumber<CR>
imap <F8> <ESC>:set invnumber<CR>

nmap <F10> :w!<CR>
imap <F10> <ESC>:w!<CR>

nmap <F11> :q<CR>
imap <F11> <ESC>:q<CR>

nmap <F12> :qall<CR>
imap <F12> <ESC>:qall<CR>

"let g:Tlist_Use_Right_Window = 1
"nnoremap <silent> <F4> :TlistToggle<Cr>

" =========================================================================
" =  하이라이트 정의                                                      =
" =========================================================================
" 버퍼(창)과 버퍼의 끝(창의 끝)을 투명하게
highlight Normal guibg=NONE
highlight EndOfBuffer guibg=NONE

" 줄번호 배경색은 투명(NULL)하게, 
" 글자는 굵게(bold), 글자색은 하얗게(White)
highlight LineNr guibg=NONE gui=bold guifg=white

" 행 표시선 색상
highlight ColorColumn guibg=White

" =========================================================================
" =  함수 정의                                                            =
" =========================================================================
" tabsize 를 size 로 변경
function SetTab(size)
	execute "set shiftwidth=".a:size
	execute "set tabstop=".a:size
	execute "set softtabstop=".a:size
endfunction

" =========================================================================
" =  자동 실행 (autocmd)                                                  =
" =========================================================================
" terminal buffer 에 진입했을 때 mode 를 normal 에서 terminal 모드로 변경
" 또한 줄번호를 없앤다.
autocmd BufEnter term://* start " do nothing
if using_neovim
    autocmd TermOpen term://* execute ":set nonu"
endif

" 파일 명이 *.S 로 시작하면 GAS 문법 강조 사용
autocmd BufRead,BufNew *.S execute ":set ft=gas"

" 버퍼를 저장할때 파일 이름이 .c, .h 와 같다면 ctags 명령어를 실행
" autocmd BufWritePost *.c,*.h silent! !ctags -R &

" 윈도우를 나갈 때 뷰를 저장하고,
autocmd BufWinLeave *.c,*.h mkview

" 윈도우에 들어갈 땐 뷰를 로드한다. (커서위치 저장)
" silent! 는 loadview 중 발생하는 에러를 억압(suppress) 한다.
autocmd BufWinEnter *.c,*.h silent! loadview

" 활성화된 버퍼만 라인 번호 표시 (단, 확장자는 .c 혹은 .h 일때만 동작)
autocmd BufEnter * if (&filetype == 'c' || &filetype == 'cpp' || &filetype == 'rust' || &filetype == 'python')
	\| set number
\| endif

" 버퍼에서 나갈 땐 줄 번호를 지운다.
autocmd BufLeave * if (&filetype == 'c' || &filetype == 'cpp' || &filetype == 'rust' || &filetype == 'python')
	\| set nonumber
\| endif

" ------------------------------------
" 명령, 비주얼 모드
" ------------------------------------
" iamroot 자동 주석
"map <F9> <ESC>o/*<CR> * IAMROOT, <C-R>=strftime("%Y.%m.%d")<CR>
"	\: <CR>*/<CR><ESC><UP><UP><END>
"imap <F9> <ESC>o/*<CR> * IAMROOT, <C-R>=strftime("%Y.%m.%d")<CR>
"	\: <CR>*/<CR><ESC><UP><UP><END>


" =========================================================================
" =  단축키 지정                                                          =
" =  n(normal mode) 명령 모드                                             =
" =  v(visual, select mode) 비주얼 모드                                   =
" =  x(visual mode only) 비주얼 모드                                      =
" =  s(select mode only) 선택 모드                                        =
" =  i(insert mode) 편집 모드                                             =
" =  t(terminal mode) 편집 모드                                           =
" =  c(commnad-line) 모드                                                 =
" =  re(recursive) 맵핑                                                   =
" =  nore(no recursive) 맵핑                                              =
" =========================================================================
" ------------------------------------
" 편집 모드 
" ------------------------------------
" jk 와 kj 를 <ESC> 키로 맵핑
"inoremap jk <ESC>
"inoremap kj <ESC>
" ------------------------------------
" 명령 모드 
" ------------------------------------
" <F6> 을 통해 NERDTree 와 Tagbar 열기
nnoremap <silent><F6> :NERDTreeToggle<CR><bar>:TagbarToggle<CR><bar>:wincmd p<CR>

" <Ctrl + h, l> 를 눌러서 이전, 다음 탭으로 이동
nnoremap <silent><C-j> :tabprevious<CR>
nnoremap <silent><C-k> :tabnext<CR>

" <Ctrl + h, l> 를 눌러서 이전, 다음 버퍼로 전환
nnoremap <silent><C-h> :bp<CR>
nnoremap <silent><C-l> :bn<CR>

" <Ctrl +d> 현재 버퍼 삭제
nnoremap <silent><C-d> :bd<CR>

" <Shift + h, l> 를 눌러서 현재 버퍼 삭제
"nnoremap <silent><S-h> :bp<bar>sp<bar>bn<bar>bd<CR>
"nnoremap <silent><S-l> :bp<bar>sp<bar>bn<bar>bd<CR>

" <Ctrl + w> t 를 눌러서 커서를 NERDTree 로 옮기기
nnoremap <silent><C-w>t :NERDTreeFocus<CR>

" 우측 하단(botright)에 창 생성(new), 해당 창을 terminal 로 변경
" 크기를 10 으로 재설정(resize) 후 창 높이를 고정(winfixheight)시킴
" 줄번호는 삭제하고, 터미널 디렉터리 글자색을 변경
"nnoremap <silent><F7> 
"	\:botright new<CR><bar>
"	\:terminal<CR><bar><ESC>
"	\:resize 10<CR><bar>
"	\:set winfixheight<CR><bar>
"	\:set nonu<CR><bar>
"	\iLS_COLORS=$LS_COLORS:'di=1;33:ln=36'<CR>
"	\iLS_COLORS=$LS_COLORS:'di=0;33:ln=33'<CR>

if using_neovim
    nnoremap <silent> <F7> :ToggleTerminal<Enter>
    tnoremap <silent> <F7> <C-\><C-n>:ToggleTerminal<Enter>
endif

" ------------------------------------
" 터미널 모드 
" ------------------------------------
" 터미널 모드에서 <Ctrl + w> 누르면 명령 모드로 전환하고 <Ctrl + w> 입력
tmap <silent><C-w> <ESC><C-w>

" jk 혹은 kj 를 누르면 <ESC> 를 실행
tmap <silent>jk <ESC>
tmap <silent>kj <ESC>

" <ESC> 입력 시 <C-\><C-n> 실행 => 터미널 모드에서 기본 모드로 전환
tnoremap <silent><ESC> <C-\><C-n>


" ------------------------------------
" ctags 
" ------------------------------------
" <c-]>를 g<c-]>로 할당: 일반, 비주얼 모드에 적용
" <c-]>의 :tag 동작(첫번째로 찾아지는 태그로 이동) 대신
" g<c-]>의 :tjump 동작(이동할 태그 선택) 사용 
"map <c-]> g<c-]> 

" 현재 경로부터 상위 경로로 tags 파일 찾아가도록 설정
set tags=tags;

" =========================================================================
" =  플러그인 설정                                                        =
" =========================================================================
" ------------------------------------
" coc 설정
" ------------------------------------
"  nvim 버전이 0.5.0 이상이며, 패치가 8.1.1564 이상이라면
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " 사인(sign column) 열을 숫자 열과 합침
  set signcolumn=number
endif

"<Tab> 을 눌러서 현재 지시자를 옮김.
"inoremap <silent><expr> <TAB>
"            \ pumvisible() ? "\<C-n>" :
"            \ <SID>check_back_space() ? "\<TAB>" :
"            \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" <Backspace> 키가 지시자 제거, 기존 자동완성 양식 폐기
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" <Ctrl + Space> 를 눌러서 자동완성 적용
if using_neovim
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" --------------------------------------------------------------------------------------------------
" coc shortcut
" --------------------------------------------------------------------------------------------------
" 코드 탐색 단축키
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
"nmap <silent> <C-]> <Plug>(coc-definition)
"nmap <silent> <C-[> <Plug>(coc-references)
if using_neovim
    nn <silent> K :call CocActionAsync('doHover')<CR>
endif
"nn means nnoremap
" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

" bases
"nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
"nn <silent> xB :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
"nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
"nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
"nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" callee
"nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
"nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
"nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
"nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

"nmap <silent> xt <Plug>(coc-type-definition)<cr>
"nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
"nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

"nn xx x
" --------------------------------------------------------------------------------------------------

" setting with vim-lsp
if using_neovim
    if executable('ccls')
        au User lsp_setup call lsp#register_server({
                    \ 'name': 'ccls',
                    \ 'cmd': {server_info->['ccls']},
                    \ 'root_uri': {server_info->lsp#utils#path_to_uri(
                    \   lsp#utils#find_nearest_parent_file_directory(
                    \     lsp#utils#get_buffer_path(), ['.ccls', 'compile_commands.json', '.git/']))},
                    \ 'initialization_options': {
                    \   'highlight': { 'lsRanges' : v:true },
                    \   'cache': {'directory': stdpath('cache') . '/ccls' },
                    \ },
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                    \ })
    endif
endif


" 커서 아래의 토큰을 강조
autocmd CursorHold * silent call CocActionAsync('highlight')
" --------------------------------------------------------------------------------------------------
" nvim-treesitter 설정
" --------------------------------------------------------------------------------------------------
if using_neovim
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "maintained",
  ensure_installed = { "c", "lua", "rust" },
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
}

require'lspconfig'.clangd.setup{}

EOF
endif

" ------------------------------------
" tagbar 설정
" ------------------------------------
" tagbar 생성 시 우측 하단에 위치하게끔 생성
let g:tagbar_position = 'rightbelow'
"let g:tagbar_position = 'right'
"let g:tagbar_position = 'leftabove'
let g:tagbar_height = 25

" tagbar for rust
let g:rust_use_custom_ctags_defs = 1
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

" --------------------------------------------------------------------------------------------------
" ConqueTerm 설정
" 창 전환 시 ConqueTerm 에 Insert 상태로 활성화
" let g:ConqueTerm_InsertOnEnter = 1
" ConqueTerm 이 Insert 모드인 상태에서도 <Ctrl>+w, W 를 사용 가능하게
" let g:ConqueTerm_CWInsert = 1
" --------------------------------------------------------------------------------------------------
" vim-airline 설정
" --------------------------------------------------------------------------------------------------
" powerline-font 활성화
let g:airline_powerline_fonts = 1
" luna 테마 사용
let g:airline_theme = 'luna'
" tabline 에 파일명만 출력 되도록 설정
let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#formatter = 'default'
" 창의 상단에 표시되도록 설정
"let g:airline_statusline_ontop = 1
" 탭라인 허용
let g:airline#extensions#tabline#enabled = 1
" 항상 tabline 을 표시
let g:airline#extensions#tabline#show_tabs = 1

" Custom vim-airline integration
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' '). ' ' . get(g:, 'coc_status', '') . ' ' . get(b:, 'coc_current_function', '')
endfunction
let g:airline_section_c = '%{StatusDiagnostic()}'


" --------------------------------------------------------------------------------------------------
" NerdTree
" --------------------------------------------------------------------------------------------------
" 창 크기(가로)를 40 으로 설정
let g:NERDTreeWinSize=40

let mapleader="\\"
"map <Leader>nt <ESC>:NERDTree<CR>
"nmap <F6> :NERDTreeToggle<CR>

" Tree 아이콘 변경
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 파일없이 vim만 틸 경우 자동으로 NERD Tree 실행.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif
" 디렉토리를 vim으로 여는 경우 NERD Tree 실행.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" vim에서 nerdtree가 에러날 경우 사용
"if using_vim
"    let g:NERDTreeGlyphReadOnly = "RO"
    " Fix "E121: Undefined variable: g:NERDTreeNodeDelimiter" issue
"    let g:NERDTreeNodeDelimiter = "\u00a0"
"endif

" --------------------------------------------------------------------------------------------------
" vim-lsp
" --------------------------------------------------------------------------------------------------
let g:lsp_diagnostics_enabled = 0

" --------------------------------------------------------------------------------------------------
" lsp config 
" --------------------------------------------------------------------------------------------------
let g:lsp_cxx_hl_use_text_props = 1
if using_neovim
    let g:lsp_cxx_hl_use_nvim_text_props = 1
endif

if using_neovim
    lua require("lsp_config")

    autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
    autocmd BufWritePre *.go lua goimports(1000)

" lsp toggle diagnostics
lua <<EOF
    require'toggle_lsp_diagnostics'.init({ start_on = false })
EOF

nmap <leader>tlu <Plug>(toggle-lsp-diag-underline)
nmap <leader>tls <Plug>(toggle-lsp-diag-signs)
nmap <leader>tlv <Plug>(toggle-lsp-diag-vtext)
nmap <leader>tlp <Plug>(toggle-lsp-diag-update_in_insert)

nmap <leader>tld  <Plug>(toggle-lsp-diag)
nmap <leader>tldd <Plug>(toggle-lsp-diag-default)
nmap <leader>tldf <Plug>(toggle-lsp-diag-off)
nmap <leader>tldo <Plug>(toggle-lsp-diag-on)
endif

" --------------------------------------------------------------------------------------------------
" jedi for python
" --------------------------------------------------------------------------------------------------
let g:jedi#show_call_signatures=0       " 자세히 설명하는 창을 보여준다 1=활성화, 0=비>활성화
let g:jedi#popup_select_first="0"       " 자동완성시 자동팝업 등장 x
let g:jedi#force_py_version=3           " 자동완성 3 = python3 , 2 = python2

let g:syntastic_python_checkers=['flake8']        " ↓ 실행시 현재줄 주석 해제필요    
let g:syntastic_python_flake8_args='--ignore='    " 무시하고자 하는 errorcode
let no_flake8_maps = 1


" --------------------------------------------------------------------------------------------------
"  언어별 간단 컴파일
" --------------------------------------------------------------------------------------------------

" C
"au FileType c map <F5> :w<CR>:!gcc *.c -g -Wall -W -O2 -o %< ; ./%<<CR>
"au FileType c imap <F5> <ESC>:w<CR>:!gcc *.c -g -Wall -W -O2 -o %< ; ./%<<CR>

" C++
"au FileType cpp map <F5> :w<CR>:!g++ *.cpp -g -Wall -W -O2 -o %< ; ./%<<CR>
"au FileType cpp imap <F5> <ESC>:w<CR>:!g++ *.cpp -g -Wall -W -O2 -o %< ; ./%<<CR>

" C/C++ Run
"au FileType c,cpp map <F4> :!./%<<CR>
"au FileType c,cpp imap <F4> <ESC>:!./%<<CR>

" C/C++ Make & Run
au FileType c,cpp map <F5> :w<CR>:!cd build/debug ; make -j4 ; ./run.sh<CR>
au FileType c,cpp imap <F5> <ESC>:w<CR>:!cd build/debug ; make -j4 ; ./run.sh<CR>
autocmd FileType cpp :set bs=2 ts=2 sw=2
autocmd FileType c :set noexpandtab

" Go
au FileType go map <F5> :w<CR>:!go run %<CR>
au FileType go imap <F5> <ESC>:w<CR>:!go run %<CR>

" Python
au FileType python map <F5> :w<CR>:!python3 %<CR>
au FileType python imap <F5> <ESC>:w<CR>:!python3 %<CR>

" Rust
au FileType rust map <F5> :w<CR>:!cargo run<CR>
au FileType rust imap <F5> <ESC>:w<CR>:!cargo run<CR>
"au FileType rust map <F5> :w<CR>:!rustc % ; ./%<<CR>
"au FileType rust imap <F5> <ESC>:w<CR>:!rustc % ; ./%<<CR>

" Java
au FileType java map <F5> :w<CR>:!javac % ; java %<<CR>
au FileType java imap <F5> <ESC>:w<CR>:!javac % ; java %<<CR>

map <F9> <F5>
imap <F9> <ESC><F5>


