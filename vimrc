if !&compatible
	set nocompatible
endif

" reset augroup
augroup MyAutoCmd
	autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
	  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	call dein#load_toml(s:toml_file)
	call dein#end()
	call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
	call dein#install()
endif
" }}}

" プラグイン以外のその他設定が続く
" :

if has("syntax")
    syntax on
endif

set background=dark
colorscheme hybrid

set number
set title
set ambiwidth=double
set tabstop=4
set smartindent
set virtualedit=block
set cursorline
" swapファイルを削除
set noswapfile

set list listchars=tab:\¦\ 

" ------ ステータスライン --------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する
set backspace=indent,eol,start " バックスペースを使えるように







" 間違えそうなバインドを調整(事故の素) 
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :
cmap w1 w!
cmap q1 q!

" 使いたくないバインドを殺す
nnoremap ZZ <Nop>
" ZQで終了させない
nnoremap ZQ <Nop>
" QでEXモードに入れない
nnoremap Q <Nop>

" jjでエスケープ
inoremap jj    <ESC>
" c-lでエスケープ
inoremap <C-l> <ESC>
inoremap <C-l> <ESC>
vnoremap <C-l> <ESC>


" 行移動は表示にあわせる
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" 右移動は折りたたみを開くも兼ねる
nnoremap <expr>l  foldclosed('.') != -1 ? 'zo' : 'l'

" 権限の無いファイル用sudoで書き込み
cnoremap w!! w ! sudo tee %

" vを二回で行末まで選択
vnoremap v $h

"---------------------------------------------------------------------------
" タブ操作
"---------------------------------------------------------------------------
nmap T :tabnew<CR>
nmap <silent> tn :tabnext<CR>
nmap <silent> tp :tabprevius<CR>
nmap <silent> te :tabedit<space>a
" タブ移動のショートカット
nnoremap <c-g> <nop>
nnoremap <c-g> gt
imap <buffer> <c-g> <c-o><c-g>


"---------------------------------------------------------------------------
" ウィンドウ操作
"---------------------------------------------------------------------------
" インサートモード中でも c-wが使えるようにする 
inoremap <c-w> <c-o><c-w>

" リサイズ
nmap <silent> <C-L> <C-w>>
nmap <silent> <C-H> <C-w><
nmap <silent> <C-K> <C-w>+
nmap <silent> <C-J> <C-w>>

" 移動
nmap <C-j> <C-w>w
nmap <C-k> <C-w>W
nmap <C-h> <C-w><
nmap <C-l> <C-w>>
