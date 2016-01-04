# Visual Studio 2013 shortcut&KeyBind

## Eclipse化バインド利用の際

* (Eclipse-Key-Binding.vssettings)[https://github.com/NaoyaOura/windows-tools/blob/master/vs_keybind/Eclipse-Key-Binding.vssettings]をダウンロードする
* Tools > Import and Export Settings >
    * > Import selected enviroment setting > No,just import settings, overriting my current settings > Next
        * Browser([※1](https://github.com/NaoyaOura/windows-tools/blob/master/vs_keybind/Eclipse-Key-Binding.vssettings))にて、ダウンロードしたファイルを指定 > Next
            * 変更箇所がKeyboardであることを確認 > Finish

|                          | VisualStudio2013.Command.Name |     Eclipse      |  VisualStudio |
|--------------------------|-------------------------------|------------------|---------------|
| 宣言を開く               | Edit.GoToDefinition           | F3               | F12           |
| ファイルを閉じる         | Window.CloseDocumentWindow,   | Ctrl+W           | Ctrl+F4       |
| コメント化               | Edit.CommentSelection         | Ctrl+/           | Ctrl+K,Ctrl+C |
| コメント化解除           | Edit.UncommentSelection       | Ctrl+/           | Ctrl+K,Ctrl+U |
| 名前の変更               | Refactor.Rename               | Shift+Alt+R      | Ctrl+R,Ctrl+R |
| 戻る                     | View.NavigateBackward         | Alt+←            | Ctrl+-        |
| 進む                     | View.NavigateForward          | Alt+→            | Ctrl+Shift+-  |
| 拡大                     | View.ZoomIn                   | ctrl+[+]         | Ctrl+Shift+>  |
| 縮小                     | View.ZoomOut                  | ctrl+[-]         | Ctrl+Shift+<  |
| 呼び出し階層を開く       | Edit.FindAllReference         | ctrl+Shift+H     | Shift+F12     |
| 行削除                   | Edit.LineDelete               | Ctrl+D           | Ctrl+Shift+L  |
| 行選択                   | Edit.GoTo                     | Ctrl+L           | Ctrl+G        |
| Open Type                | Edit.Navigate                 | Ctrl+Shift+T     | Ctrl+,        |
| リソース検索             | Edit.Navigate                 | Ctrl+Shift+R     | Ctrl+,        |
| 開始と同時にデバッグ実行 | Debug.StartWithoutDebugging   | Ctrl+F11         | Ctrl+F5       |
| デバッグ                 | Debug.Start                   | F11              | F5            |
| StepOver                 | Debug.StepOver                | F6               | F10           |
| Stepイン                 | Debug.StepInto                | F5               | F11           |
| Stepリターン             | Debug.StepOut                 | F7               | Shift+F11     |
| Resume                   | Debug.Refresh                 | F8               | F5            |
| 行複製                   | none                          | Ctrl+Alt+Up,Down | None(※1)      |
| 変数選択                 | Edit.FindNext                 | Ctrl+K           | F3            |
| 変数選択(戻る)           | Edit.FindPrevious             | Ctrl+Shift+K     | Shift+F3      |
| 選択した行を上へ※2           | Edit.MoveSelectedLinesUp             | Alt+↑     | Alt+↑      |
| 選択した行を下へ※2           | Edit.MoveSelectedLinesDown             | Alt+↓     | Alt+↓      |

* ※1:[マクロを組み込む方法](http://stackoverflow.com/questions/2279000/visual-studio-short-cut-key-duplicate-line)
* ※2:デフォルト設定だが、ReSharperにの設定に殺されるため、Resharperを入れている方は設定に気を付ける必要あり

---

## 矩形選択

* Eclipse
    * Ctrl+Shift+Aモード切替え
* VisualStudio2013
    * Ctrl+マウスで範囲選択

---

## 行番号の表示

* DEBUG > Options and Settings... > Text Editor > All Languages > General > Line Number > Check

---

## スクロールバーの表示

* DEBUG > Options and Settings... > Text Editor > All Languages > Scroll Bars > Line Number > Use map mode for vertical scroll bar

