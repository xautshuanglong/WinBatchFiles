#################################################################
#  用于以管理员权限启动 PowerShell 时初始化运行环境：
#  签名工具
#################################################################

# 更新当前工作目录
Split-Path -Parent $MyInvocation.MyCommand.Definition | Set-Location 

# 设置临时环境变量
$env:Path += ';C:\Program Files (x86)\Windows Kits\10\bin\x64'
