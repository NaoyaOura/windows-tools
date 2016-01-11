
# 利用上の注意

* ライブラリをインストールするフォルダ

環境変数`CHOCO_INSTALL_PATH`を設定してください
設定しない場合は、デフォルトで`C:\_lib`フォルダが作成されて、配置されます


# 作成上のおぼえがき

---------------

* 環境変数設定

```ps1
[Environment]::SetEnvironmentVariable('ENV_NAME', $path, "User")
```

* 環境変数参照

```ps1
$env:env_name
```

* 環境変数がなければ作成

```ps1
if($env:evn_name -eq $null){
  [Environment]::SetEnvironmentVariable('ENV_NAME', $path, "User")
}
```

* パスの合成

```ps1
$binRoot = join-path $env:systemdrive 'bin'
```

* フォルダを作成するfunction

```ps1
# defitinion
function CreateFolder ([string]$Path) {
  New-Item -Path $Path -type directory -Force
}

# use case
CreateFolder($path)
```

* ファイル＆フォルダ存在確認

```ps1
存在していればTRUE、していなければFalse
Test-Path $path
```

* 終了コード

exit 0 ... 正常終了
exit 1 ... 異常終了（1以上の値はデフォルトはすべて１に変換される）

* 64Bit判定

```ps1
if (Get-ProcessorBits 64) {
	# 64bitの処理
    $curentUrl = $url64
} else {
	# 32bit用の処理
    $curentUrl = $url
}
```

* Warningメッセージの書き方

```ps1
Write-Warning "message"
```

* フォルダを開く

```ps1
$path_str = "C:\"
Invoke-Item %path_str
```

## chocolatey用コマンド

---------------

* エラーログの書き出し

```ps1
Write-ChocolateyFailure "$packageName" "$message"
```

