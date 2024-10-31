#!/bin/bash
# SPDX-FileCopyrightText: 2024 Soichiro Suzuki 　　　　　
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

## a=山田
## [ "$a" = 上田 ] || ng "$LINENO"  # LINENOは，この行の行番号の入る変数

## [ "$a" = 山田 ] || ng "$LINENO"  # ngに第一引数として$LINENOを付与

out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK #通ったのが（人間に）分かるように表示
exit $res     # このシェルスクリプトの終了ステータスを返して終了

