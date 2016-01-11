function CreateFolder ([string]$Path) {
  New-Item -Path $Path -type directory -Force
}

$packageName = 'osqledit'
$url = 'http://www.hi-ho.ne.jp/a_ogawa/osqledit/osqledit_9632.zip'

$install_path = $env:choco_install_path
if($install_path -eq $null){
  # デフォルトのインストールフォルダ
  $install_path = join-path $env:systemdrive '_lib'
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

# 64Bitのときの警告
if (Get-ProcessorBits 64) {
  Write-Warning "64bit環境で利用する場合、32bit版のOracle Clientが必要です"
}

# フォルダを開く
Invoke-Item $install_path
