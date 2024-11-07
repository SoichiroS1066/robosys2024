#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Soichiro Suzuki 　　　　　
# SPDX-License-Identifier: BSD-3-Clause

import subprocess

def run_test_case(input_data, expected_output, test_name):
    process = subprocess.Popen(
        ['python3', 'math_operations'],  # テスト対象のファイル名
        stdin=subprocess.PIPE, 
        stdout=subprocess.PIPE, 
        stderr=subprocess.PIPE,
        text=True
    )
    stdout, stderr = process.communicate(input=input_data)

    assert expected_output in stdout, f"Test failed: {test_name}\nExpected: {expected_output}\nGot: {stdout}"
    
    # テストが成功した場合にOKを表示
    print(f"{test_name}: OK")

def test_invalid_input():
    input_data = """10
a
"""
    expected_output = "エラー: 数字以外の入力がありました: a"
    run_test_case(input_data, expected_output, "Test Invalid Input")

def test_less_than_two_numbers():
    input_data = """1
"""
    expected_output = "エラー: 計算には2つ以上の数字が必要です。"
    run_test_case(input_data, expected_output, "Test Less Than Two Numbers")

def test_addition_operation():
    input_data = """5
3
=
+
"""
    expected_output = "結果: 8.0"
    run_test_case(input_data, expected_output, "Test Addition")

def test_invalid_operation():
    input_data = """5
3
=
$
"""
    expected_output = "無効な入力です。もう一度「ｙ 」、「r 」、または「ｎ 」を入力してください。"
    run_test_case(input_data, expected_output, "Test Invalid Operation")

def test_continue_with_new_number():
    input_data = """5
3
=
+
y
2
+
"""
    expected_output = "結果: 10.0"
    run_test_case(input_data, expected_output, "Test Continue with New Number")

def test_reset_operation():
    input_data = """5
3
=
+
r
7
4
=
+
"""
    expected_output = """1行ごとに数字を入力してください (終了するには「＝」を入力してください):
加算、減算、乗算、除算を選択してください: +, -, *, /
結果: 8.0
計算を続けますか？ (続行: ｙ, リセット: r, 終了: ｎ): リセットしました
1行ごとに数字を入力してください (終了するには「＝」を入力してください):
加算、減算、乗算、除算を選択してください: +, -, *, /
結果: 11.0
計算を続けますか？ (続行: ｙ, リセット: r, 終了: ｎ):"""
    run_test_case(input_data, expected_output, "Test Reset Operation")

def test_exit():
    input_data = """5
3
=
+
n
"""
    expected_output = """1行ごとに数字を入力してください (終了するには「＝」を入力してください):
加算、減算、乗算、除算を選択してください: +, -, *, /
結果: 8.0
計算を続けますか？ (続行: ｙ, リセット: r, 終了: ｎ): 計算を終了します。"""
    run_test_case(input_data, expected_output, "Test Exit")


if __name__ == "__main__":
    test_invalid_input()
    test_less_than_two_numbers()
    test_addition_operation()
    test_invalid_operation()
    test_continue_with_new_number()
    test_reset_operation()
    test_exit()
    print("All OK!")

