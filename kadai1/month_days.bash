#!/bin/bash
# SPDX-FileCopyrightText: 2024 Soichiro Suzuki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違います
    res=1
}

res=0    

### 通常の入力 ###
out=$(echo -e "2024\n2" | ./month_days.py)
[ "${out}" = "1~29" ] || ng "$LINENO"

out=$(echo -e "2023\n4" | ./month_days.py)
[ "${out}" = "1~30" ] || ng "$LINENO"

out=$(echo -e "2023\n12" | ./month_days.py)
[ "${out}" = "1~31" ] || ng "$LINENO"

### 誤った入力 ###
out=$(echo -e "2023\n13" | ./month_days.py)  # 存在しない月
[ "$?" = 1 ]      || ng "$LINENO"            # 終了ステータスが1になっていることを確認
[ "${out}" = "" ] || ng "$LINENO"            # 出力がないことを確認

out=$(echo -e "abc\n2" | ./month_days.py)    # 無効な年
[ "$?" = 1 ]      || ng "$LINENO"            # 終了ステータスが1になっていることを確認
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e "" | ./month_days.py)          # 入力がない場合
[ "$?" = 1 ]      || ng "$LINENO"            # これも異常終了する
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res

