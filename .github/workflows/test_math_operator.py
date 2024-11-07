import unittest
from unittest.mock import patch
import sys

class TestCalculator(unittest.TestCase):

    @patch('builtins.input', side_effect=['2', '3', '+', '3', 'ｎ'])
    def test_calculation_continue_and_exit(self, mock_input):
        with patch('sys.stdout', new_callable=sys.StringIO) as mock_stdout:
            # テスト実行
            sys.stdin = sys.__stdin__  # 標準入力をリセット
            nums = [2, 3]
            result = calc(nums, '+')
            self.assertIn('結果: 5', mock_stdout.getvalue())

    @patch('builtins.input', side_effect=['2', 'abc', '+'])
    def test_invalid_number_input(self, mock_input):
        with patch('sys.stdout', new_callable=sys.StringIO) as mock_stdout:
            # テスト実行
            sys.stdin = sys.__stdin__  # 標準入力をリセット
            nums = [2, 'abc']
            result = calc(nums, '+')
            self.assertIn('エラー: 数字以外の入力がありました: abc', mock_stdout.getvalue())

if __name__ == "__main__":
    unittest.main()
