# windows-tools
windowsに利用するツール群を配置する

## ショートカット作成アプリ

script/setup.batを実行すると配置される

### SendToに便利メニューを追加

* 「送る」メニューに追加（script/vbs/SendTo.vbs）
* PC起動時に実行する(script/vbs/SendStartUp.vbs)

## 初期インストール作業

### chocolateyによるセットアップ

0. chocolatey のインストールがまだのとき
    * chocolatey-install.batを実行
0. chocolateyのライブラリを一括でダウンロード
    * defaultSetting.configを修正、不要なものを削除
    * package-install.batを実行

### chocolateyで補えなかったインストール

* charu3(clipボードの内容を記憶するアプリ、軽量で非常に使いやすい)
    * [本家のサイト](http://keijiweb.com/software.html)
    * テキスト拡張の内容は、整理中...
* craftlaunch（とても軽量で機能性も十分）
    * [本家のサイト](https://sites.google.com/site/craftware/clnch)
    * [拡張](https://github.com/nitoyon/clnch3_extensions)

## sublimeのキーバインド設定（Eclipse化）

* eclipseのキーバインドが利用できるように変更したSublimeのキーバインド
    * [sublime_keybind](sublime_keybind/Default (Windows).sublime-keymap)