#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Soichiro Suzuki
# SPDX-License-Identifier: BSD-3-Clause

# 説明を表示
print("小文字を大文字に、大文字を小文字に変換します")

# 標準入力から文字を読み込む
input_text = input("何か入力してください: ")

# 小文字を大文字に、大文字を小文字に変換
processed_text = input_text.swapcase()

# 加工後の結果を標準出力に表示
print("変換後:", processed_text)

