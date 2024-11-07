#!/bin/bash
# SPDX-FileCopyrightText: 2024 Soichiro Suzuki 　　　　　
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違います
    res=1
}

res=0    

### 通常の入力 ###
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

### 誤った入力 ###
out=$(echo あ | ./plus)           #計算できない値を入力
[ "$?" = 1 ]      || ng "$LINENO" #終了ステータスが1になっていることを確認
[ "${out}" = "" ] || ng "$LINENO" #この行と上の行を入れ替えるのはNG 

out=$(echo | ./plus)              #なにも入力しない
[ "$?" = 1 ]      || ng "$LINENO" #これも異常終了する
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
