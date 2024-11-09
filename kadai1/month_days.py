#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Soichiro Suzuki
# SPDX-License-Identifier: BSD-3-Clause

import sys

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
    year = int(input(": "))  # プロンプトなしで年を入力
    month = int(input(": "))  # プロンプトなしで月を入力
except ValueError:
    exit(1)

if month < 1 or month > 12:
    exit(1)

# 月の日数を取得して出力
days = get_days_in_month(year, month)
if days:
    print(f"1~{days}")
else:
    print("無効な入力です。")
