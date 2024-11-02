# robosys2024
2024年ロボットシステム学

# plusコマンド
![test](https://github.com/SoichiroS1066/robosys2024/actions/workflows/test.yml/badge.svg)

## 機能
- 標準入力から読み込んだ数字の列を足す。

## 前準備
- Ubuntu をインストールしていない場合はUbuntu をインストール  
※ バージョンはテスト環境と同じ *Ubuntu 24.04 LTS* をオススメします
- Ubuntu 内にGitHub を入れていない場合は以下を入力しインストール  
$`sudo apt install git`<br>
<br>
- GitHub からrobosys2024 のリポジトリをクローン  
$`git clone https://github.com/SoichiroS1066/robosys2024`

## 起動の手順
- 前準備が済んでいる場合は次のコードを入力  
$`cd ~/robosys2024`

## 使用例
- 1~5 を足したい場合  
$`seq 1 5 | ./plus` または $`seq 5 | ./plus`
- 5~100 を足したい場合  
$`seq 5 100 | ./plus`

## 必要なソフトウェア
- Python  
テスト済みバージョン: 3.7〜3.10

## テスト環境
- Ubuntu 24.04 LTS

## ライセンス等
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- このパッケージのコードは，下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを，本人の許可を得て自身の著作としたものです．
- [ryuichiueda/my_slides robosys_2024](https://github.com/ryuichiueda/my_slides/tree/master/robosys_2024)
- © 2024 Soichiro Suzuki
