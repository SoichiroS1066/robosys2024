#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Soichiro Suzuki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違います"
    res=1
}

res=0

### 通常の入力 ###
out=$(echo -e "2024\n2" | ./kadai1/month_days.py)  # 正常な年と月の入力
expected="2024年2月は29日まであります。"  # うるう年2月
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo -e "2023\n2" | ./kadai1/month_days.py)  # 正常な年と月の入力（うるう年ではない）
expected="2023年2月は28日まであります。"  # 通常の2月
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo -e "2024\n12" | ./kadai1/month_days.py)  # 正常な年と月の入力（12月）
expected="2024年12月は31日まであります。"  # 12月
[ "${out}" = "${expected}" ] || ng "$LINENO"

### 誤った入力 ###
out=$(echo -e "abc\n2" | ./kadai1/month_days.py)  # 年に文字列を入力
[ "$?" = 1 ] || ng "$LINENO"  # 異常終了ステータスが1であることを確認
[ "${out}" = "" ] || ng "$LINENO"  # 出力が空であることを確認

out=$(echo -e "2024\n13" | ./kadai1/month_days.py)  # 月に無効な値を入力（13月）
[ "$?" = 1 ] || ng "$LINENO"  # 異常終了ステータスが1であることを確認
[ "${out}" = "" ] || ng "$LINENO"  # 出力が空であることを確認

out=$(echo -e "2024\n" | ./kadai1/month_days.py)  # 月を入力しない
[ "$?" = 1 ] || ng "$LINENO"  # 異常終了ステータスが1であることを確認
[ "${out}" = "" ] || ng "$LINENO"  # 出力が空であることを確認

[ "$res" = 0 ] && echo OK
exit $res

