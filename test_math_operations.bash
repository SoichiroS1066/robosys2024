#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Soichiro Suzuki
# SPDX-License-Identifier: BSD-3-Clause

# テストケースを実行する関数
run_test_case() {
    input_data="$1"
    expected_output="$2"
    test_name="$3"

    # Pythonスクリプトを実行し、入力データを標準入力として渡す
    result=$(echo -e "$input_data" | python3 math_operations)  # 標準入力をパイプで渡す

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
run_test_case "1\n1\n=\n+" "結果: 2.0" "Test Addition"
run_test_case "5\n3\n=\n+" "結果: 8.0" "Test Addition"
run_test_case "5\n3\n=\n*\n=" "結果: 15.0" "Test Multiplication"
run_test_case "10\n0\n=\n/" "結果: Error: Division by zero" "Test Division by Zero"
run_test_case "5\n3\n=\n-" "結果: 2.0" "Test Subtraction"

