#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Soichiro Suzuki
# SPDX-License-Identifier: BSD-3-Clause

# テストケースを実行する関数
run_test_case() {
    input_data="$1"
    expected_output="$2"
    test_name="$3"

    # Pythonスクリプトを実行し、出力を取得
    result=$(echo "$input_data" | python3 math_operations)  # `math_operations` を呼び出す

    # 結果が期待通りかを検証
    if [[ "$result" == *"$expected_output"* ]]; then
        echo "$test_name: OK"
    else
        echo "$test_name: FAILED"
        echo "Expected: $expected_output"
        echo "Got: $result"
    fi
}

# テストケースの実行
run_test_case "1 1 +" "結果: 2.0" "Test Addition"
run_test_case "5 3 +" "結果: 8.0" "Test Addition"
run_test_case "5 3 *" "結果: 15.0" "Test Multiplication"

