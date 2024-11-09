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
actual=$(echo "$out" | sed -n 's/.*\([0-9]\{4\}年[0-9]\{1,2\}月は[0-9]\{1,2\}日まであります\).*/\1/p' | tr -d '\n\r' | sed 's/[[:space:]]*$//')

# expectedも整形
expected=$(echo "$expected" | tr -d '\n\r' | sed 's/[[:space:]]*$//')

if [ "${actual}" != "${expected}" ]; then
    ng "$LINENO"
fi

# 異常終了ステータスが1であることを確認
if [ "$?" != 1 ]; then
    ng "$LINENO"
fi

# 最後にOKを表示する
if [ "$res" -eq 0 ]; then
    echo "OK"
fi

exit $res

