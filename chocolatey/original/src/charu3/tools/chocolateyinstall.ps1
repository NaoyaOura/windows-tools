function CreateFolder ([string]$Path) {
  New-Item -Path $Path -type directory -Force
}

$packageName = 'charu3'
$url = 'http://ftp.vector.co.jp/27/65/2147/c3030301.zip'

$install_path = $env:choco_install_path
if($install_path -eq $null){
  # デフォルトのインストールフォルダ
  $install_path = join-path $env:systemdrive 'Software'
  [Environment]::SetEnvironmentVariable('CHOCO_INSTALL_PATH', $install_path, "User")
}

$install_path = join-path $install_path $packageName
if(Test-Path $install_path){
  $message = "「$install_path」フォルダが既に存在するため、インストールを実施しません"
  Write-ChocolateyFailure "$packageName" "$message"
  exit 1
}else{
  echo "[ECHO] create folder: $install_path"
  CreateFolder($install_path)
}

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $install_path
  url           = $url
}

Install-ChocolateyZipPackage @packageArgs

# warning ログを出力
$startUpPath = "$env:appdata\Microsoft\Windows\Start Menu\Programs\Startup\$packageName.lnk"
Write-Warning "[$startUpPath]スタートアップ（PC起動時に実行する設定）に追加します."

#スタートアップメニューに追加
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($startUpPath)
$Shortcut.TargetPath = "$install_path\$packageName.exe"
$Shortcut.Save()

# フォルダを開く
Invoke-Item $install_path
