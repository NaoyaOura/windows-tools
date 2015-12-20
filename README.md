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

* eclipseのキーバインドが利用できるように変更したSublimeのキーバインド設定
    * [sublime_keybind](sublime_keybind/Default (Windows).sublime-keymap)

## VisualStudio2013-KeyBind(Eclipse化)

* eclipseのキーバインドが利用できるように変更したVisualStudioのキーバインド設定

	* [vs_keyvind](vs_keybind/Eclipse-Key-Binding.vssettings)


|                          | VisualStudio2013.Command.Name | Eclipse                  | VisualStudio          |
| 宣言を開く               | Edit.GoToDefinition           | F3                       | F12                   |
| ファイルを閉じる         | Window.CloseDocumentWindow,   | Ctrl+W                   | Ctrl+F4               |
| コメント化               | Edit.CommentSelection         | Ctrl+/                   | Ctrl+K,Ctrl+C         |
| コメント化解除           | Edit.UncommentSelection       | Ctrl+/                   | Ctrl+K,Ctrl+U         |
| 名前の変更               | Refactor.Rename               | Shift+Alt+R              | Ctrl+R,Ctrl+R         |
| 戻る                     | View.NavigateBackward         | Alt+←                    | Ctrl+-                |
| 進む                     | View.NavigateForward          | Alt+→                    | Ctrl+Shift+-          |
| 拡大                     | View.ZoomIn                   | ctrl+[+]                 | Ctrl+Shift+>          |
| 縮小                     | View.ZoomOut                  | ctrl+[-]                 | Ctrl+Shift+<          |
| 呼び出し階層を開く       | Edit.FindAllReference         | ctrl+Shift+H             | Shift+F12             |
| 行削除                   | Edit.LineDelete               | Ctrl+D                   | Ctrl+Shift+L          |
| 行選択                   | Edit.GoTo                     | Ctrl+L                   | Ctrl+G                |
| Open Type                | Edit.Navigate                 | Ctrl+Shift+T             | Ctrl+,                |
| リソース検索             | Edit.Navigate                 | Ctrl+Shift+R             | Ctrl+,                |
| 開始と同時にデバッグ実行 | Debug.StartWithoutDebugging   | Ctrl+F11                 | Ctrl+F5               |
| デバッグ                 | Debug.Start                   | F11                      | F5                    |
| StepOver                 | Debug.StepOver                | F6                       | F10                   |
| Stepイン                 | Debug.StepInto                | F5                       | F11                   |
| Stepリターン             | Debug.StepOut                 | F7                       | Shift+F11             |
| Resume                   | Debug.Refresh                 | F8                       | F5                    |
| 行複製                   | none                          | Ctrl+Alt+Up,Down         | None(※1)              |
| 変数選択                 | Edit.FindNext                 | Ctrl+K                   | F3                    |
| 変数選択(戻る)           | Edit.FindPrevious             | Ctrl+Shift+K             | Shift+F3              |

※1:http://stackoverflow.com/questions/2279000/visual-studio-short-cut-key-duplicate-line