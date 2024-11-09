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
actual=$(echo "$out" | grep -oP '\d{4}年\d{1,2}月は\d{1,2}日まであります。' | tr -d '\n\r' | sed 's/[[:space:]]*$//')  # 改行と空白を削除
expected=$(echo "$expected" | tr -d '\n\r' | sed 's/[[:space:]]*$//')  # 同様にexpectedも整形
if [ "${actual}" != "${expected}" ]; then
    ng "$LINENO"
fi

out=$(echo -e "2023\n2" | ./kadai1/month_days.py)  # 正常な年と月の入力（うるう年ではない）
expected="2023年2月は28日まであります。"  # 通常の2月
actual=$(echo "$out" | grep -oP '\d{4}年\d{1,2}月は\d{1,2}日まであります。' | tr -d '\n\r' | sed 's/[[:space:]]*$//')
expected=$(echo "$expected" | tr -d '\n\r' | sed 's/[[:space:]]*$//')
if [ "${actual}" != "${expected}" ]; then
    ng "$LINENO"
fi

out=$(echo -e "2024\n12" | ./kadai1/month_days.py)  # 正常な年と月の入力（12月）
expected="2024年12月は31日まであります。"  # 12月
actual=$(echo "$out" | grep -oP '\d{4}年\d{1,2}月は\d{1,2}日まであります。' | tr -d '\n\r' | sed 's/[[:space:]]*$//')
expected=$(echo "$expected" | tr -d '\n\r' | sed 's/[[:space:]]*$//')
if [ "${actual}" != "${expected}" ]; then
    ng "$LINENO"
fi

### 誤った入力 ###
out=$(echo -e "abc\n2" | ./kadai1/month_days.py)  # 年に文字列を入力
expected="無効な入力です。数字を入力してください。"  # エラーメッセージ
out=$(echo "$out" | tr -d '\n\r' | sed 's/[[:space:]]*$//')  # 不要な改行と空白を削除
expected=$(echo "$expected" | tr -d '\n\r' | sed 's/[[:space:]]*$//')
if [[ "$out" != *"$expected"* ]]; then
    ng "$LINENO"
fi
# 異常終了ステータスが1であることを確認
if [ "$?" != 1 ]; then
    ng "$LINENO"
fi

out=$(echo -e "2024\n13" | ./kadai1/month_days.py)  # 月に無効な値を入力（13月）
expected="存在しない月です。1～12 の間で入力してください。"  # エラーメッセージ
out=$(echo "$out" | tr -d '\n\r' | sed 's/[[:space:]]*$//')
expected=$(echo "$expected" | tr -d '\n\r' | sed 's/[[:space:]]*$//')
if [[ "$out" != *"$expected"* ]]; then
    ng "$LINENO"
fi
# 異常終了ステータスが1であることを確認
if [ "$?" != 1 ]; then
    ng "$LINENO"
fi

out=$(echo -e "2024\n" | ./kadai1/month_days.py)  # 月を入力しない
expected="無効な入力です。数字を入力してください。"  # エラーメッセージ
out=$(echo "$out" | tr -d '\n\r' | sed 's/[[:space:]]*$//')
expected=$(echo "$expected" | tr -d '\n\r' | sed 's/[[:space:]]*$//')
if [[ "$out" != *"$expected"* ]]; then
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

