#!/bin/bash

PATHS_FILE="$DOTFILES/deploy/paths.txt"
IFS=','


# 1行ずつ読込む
cat $PATHS_FILE | while read line; do
    # ,で区切る
    read from to <<< "$line"

    # 空白削除
    from=$(eval "echo $from | tr -d ' '")
    to=$(eval "echo $to | tr -d ' '")

    # 引数ない場合、シンボリックリンクを作成する
    if [ $# -eq 0 ]; then
        ln -sf $from $to
        echo "createlink  [$from] -> [$to]"
    # ステータス表示
    elif [ $1 = "show" ]; then
        status="o"
        if [ ! -f $to ]; then
            status="x"
        fi

        echo "$to  $status"
    # シンボリックリンク削除
    elif [ $1 = "delete" ]; then
        if [ -f $to ]; then
            unlink $to
            echo "unlink $to"
        fi
    else
        echo "================================================="
        echo "[deploy]  or  [deploy show]   or  [deploy delete]"
        echo "================================================="
        exit -1
    fi
done
