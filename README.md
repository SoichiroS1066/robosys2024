# robosys 2024
[![License: BSD 3-Clause](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
![IC](https://github.com/SoichiroS1066/robosys2024/actions/workflows/test.yml/badge.svg)

こちらは、2024年度 千葉工業大学先進工学部未来ロボティクス学科2年後期のロボットシステム学で使用しているリポジトリです。

## リポジトリ概要  
plus  
- lesson_7まで使用した標準入力を用いたコマンド  

test.bash  
- lesson_6で作成したテストコマンド

## 使用技術一覧
<img src="https://img.shields.io/badge/-Python-yellow.svg?logo=python&style=for-the-badge">

## *plus コマンド*

## 機能
- 標準入力から読み込んだ*数字を1~xの列として足し算*をします。

## 起動の手順  
- *GitHub* から *robosys2024* のリポジトリをクローン  
```
$ git clone https://github.com/SoichiroS1066/robosys2024  
```
- *robosys2024* のディレクトリへ移動  
```
$ cd ~/robosys2024
```  

- *plus* を実行  

## 使用例
- 1 ~ 5 を足し算したい場合  
```
$ seq 5 | ./plus  
15  
```

## 必要なソフトウェア
- *Python*  
テスト済みバージョン: 3.7〜3.10

## テスト環境
- *Ubuntu 24.04.1 LTS*
- *Python 3.7 ~ 3.10*

# LICENSE
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- このパッケージのコードは、下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを、本人の許可を得て自身の著作としたものです。
    - [ryuichiueda/my_slides robosys_2024](https://github.com/ryuichiueda/my_slides/tree/master/robosys_2024)
- © 2024 Soichiro Suzuki
