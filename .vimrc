"<>     選択行のインデント増減
"^$　   先頭へ移動
"nN     検索後、次へ前へ
"+-     前後行の先頭へ
"wbege  単語単位
"fFtT   行内1文字検索
";,     行内1文字検索後、次へ前へ
"oO     新行を挿入し、入力
"D      カーソル位置から行末まで削除
"dG     カーソル位置からファイル末尾まで削除
".　　　直前動作を繰り返す


"------------------------------------------------------------------------------------------------
" 基本設定
"------------------------------------------------------------------------------------------------
"-----------------------------------------------
" ファイル設定系
"-----------------------------------------------
set encoding=utf8
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set fileformats=unix,dos,mac
set noswapfile
set nowritebackup
set nobackup

"-----------------------------------------------
" 画面表示系
"-----------------------------------------------
set scrolloff=5                  " スクロールする時に下が見えるようにする
set number
set ruler
set title
set nostartofline                " 移動コマンドを使ったとき、行頭に移動しない
set matchpairs& matchpairs+=<:>  " 対応括弧に<と>のペアを追加
set showmatch                    " 対応括弧をハイライト表示する
set matchtime=3                  " 対応括弧の表示秒数を3秒にする
set nowrap
set textwidth=0                  " 入力されているテキストの最大幅を無効にする
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=0
set listchars=trail:-,extends:»  " 不可視文字を表示
set shiftround                   " インデントをshiftwidthの倍数に丸める
set showcmd
set laststatus=2                 " ステータスライン表示
set cursorline

"-----------------------------------------------
" 検索系
"-----------------------------------------------
set infercase    " 補完の際の大文字小文字の区別しない
set ignorecase   " 小文字の検索でも大文字も見つかるようにする
set smartcase    " ただし大文字も含めた検索の場合はその通りに検索する
set incsearch
set hlsearch
set history=100  " コマンド、検索パターンを10000個まで履歴に残す
set wrapscan

"-----------------------------------------------
" ステータスバー
"-----------------------------------------------
set statusline+=[%F]              " ファイルフォーマット表示
set statusline+=[%{&fileformat}]  " 文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]" ファイルタイプ表示
set statusline+=%y

"-----------------------------------------------
" その他
"-----------------------------------------------
set vb t_vb=                   " ビープ音を消す
set novisualbell
set backspace=indent,eol,start " バックスペースで各種消せるようにする
set mouse=a                    " マウスモード有効
set clipboard+=unnamed         " OSのクリップボードを使用
set clipboard=unnamed
set hidden                     " 変更中のファイルでも、保存しないで他のファイルを表示
set switchbuf=useopen          " 新しく開く代わりにすでに開いてあるバッファを開く
set ttymouse=xterm2            " xtermとscreen対応
set nocompatible               " compatibleオプションオフ
set shortmess+=I
syntax enable

"------------------------------------------------------------------------------------------------
" キー操作
"------------------------------------------------------------------------------------------------

"モード                                 再割当無し再割当有り
"-------------------------------------- --------- ----------
"ノーマルモード＋ビジュアルモード       noremap   map
"コマンドラインモード＋インサートモード noremap!  map!
"ノーマルモード                         nnoremap  nmap
"ビジュアル(選択)モード                 vnoremap  vmap
"コマンドラインモード                   cnoremap  cmap
"インサート(挿入)モード                 inoremap  imap
"
"<C-c>    : Ctrl + c
"<Left>   : カーソルキー←
"<S-Left> : Shift + ←
"<cr> CRコード
"&lt; &gt;  <>のこと

" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jk <Esc>

nnoremap j gj
nnoremap k gk
vnoremap h $v

"# 置換
nnoremap gs :<C-u>%s///g<Left><Left><Left>

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

nnoremap <S-h> ^
nnoremap <S-l> $

" imap ①入力キー ②①が入力された場合、このキー操作を行う
imap { {}<Left>
imap [ []<Left>
imap ( ()<Left>
imap " ""<Left>
imap ' ''<Left>
imap ` ``<Left>
imap < <><Left>


"-----------------------------------------------
" OS分岐用の設定
"-----------------------------------------------
"if has('win32')
"  " Windows 用の設定
"endif
"
"if has('win32unix')
"  " Cygwin 用の設定
"endif
"
"if has('gui_running')
"  " GUI 用の設定
"endif

"-----------------------------------------------
" 外部ファイル読込
"-----------------------------------------------
" filereadable() : ファイル読込可能か判定
" expand() : ~を$HOMEに展開する
"if filereadable(expand('~/.vimrc.local'))
"  source ~/.vimrc.local
"endif
