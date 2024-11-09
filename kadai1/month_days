#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Soichiro Suzuki
# SPDX-License-Identifier: BSD-3-Clause

import sys

print("その月が何日まであるかをお答えします。")

def is_leap_year(year):

    ###うるう年かどうかを判定する関数###
    if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
        return True
    return False

def get_days_in_month(year, month):
    
    ###指定された年と月に基づいてその月の日数を返す関数###
    days_in_month = {
        1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30,
        7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31
    }
    
    # うるう年の場合は2月の日数を29に変更
    if month == 2 and is_leap_year(year):
        return 29
    
    return days_in_month.get(month, "無効な月")

def main():
    # 年と月を標準入力から受け取る
    try:
        year = int(input("年を入力: "))
        month = int(input("月を入力: "))
        
        if month < 1 or month > 12:
            print("存在しない月です。1～12 の間で入力してください。")
        else:
            days = get_days_in_month(year, month)
            print(f"{year}年{month}月は{days}日まであります。")
    except ValueError:
        print("無効な入力です。数字を入力してください。")

if __name__ == "__main__":
    main()
