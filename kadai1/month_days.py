#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Soichiro Suzuki
# SPDX-License-Identifier: BSD-3-Clause

import sys

print("その月が何日まであるかをお答えします。")

def get_days_in_month(year, month):
    # うるう年の処理
    if month == 2:
        if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
            return 29
        else:
            return 28
    # 各月の日数
    elif month == 1 or month == 3 or month == 5 or month == 7 or month == 8 or month == 10 or month == 12:
        return 31
    elif month == 4 or month == 6 or month == 9 or month == 11:
        return 30
    else:
        return None  # 無効な月の場合

# ユーザーから年と月を入力してもらう
try:
    year = int(input("年を入力: "))
    month = int(input("月を入力: "))
except ValueError:
    print("無効な入力です。数字を入力してください。")
    exit(1)

if month < 1 or month > 12:
    print("存在しない月です。1～12 の間で入力してください。")
    exit(1)

# 月の日数を取得して出力
days = get_days_in_month(year, month)
if days:
    print(f"{year}年{month}月は{days}日まであります。")
else:
    print("無効な入力です。")

