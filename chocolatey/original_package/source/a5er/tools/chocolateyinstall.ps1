function CreateFolder ([string]$Path) {
  New-Item -Path $Path -type directory -Force
}

$packageName= 'a5er'
$url        = 'http://ftp.vector.co.jp/65/85/2526/a5m2_2.11.2_x86.zip' # download url
$url64      = 'http://ftp.vector.co.jp/65/85/2526/a5m2_2.11.2_x64.zip' # 64bit URL here or remove - if installer is both, use $url

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
#  fileType      = 'EXE_MSI_OR_MSU' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64
}

Install-ChocolateyZipPackage @packageArgs

# フォルダを開く
Invoke-Item $install_path
