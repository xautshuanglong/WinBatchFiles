. .\CodeSignatureTool_TestEntry.ps1
. .\CodeSignatureTool_SignFunctions.ps1

function PrintMenuTop
{
    Write-Host "╔══════════════════════════════════════════════════════════╗"
    Write-Host "║                     签名工具 V1.0                        ║"
    Write-Host "║                       2020-11-30                         ║"
    Write-Host "╠══════════════════════════════════════════════════════════╣"
    Write-Host "║                                                          ║"
    Write-Host "║                  00. 退出                                ║"
    Write-Host "╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢"
    Write-Host "║                  01. 创建签名证书                        ║"
    Write-Host "╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢"
    Write-Host "║                  02. 查看签名证书                        ║"
    Write-Host "╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢"
    Write-Host "║                  03. 开始签名                            ║"
    Write-Host "╠══════════════════════════════════════════════════════════╣"
    Write-Host "║                  98. 测试入口                            ║"
    Write-Host "╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢"
    Write-Host "║                  99. 用户密码测试                        ║"
    Write-Host "║                                                          ║"
    Write-Host "╚══════════════════════════════════════════════════════════╝"
}

function ProcessMenuItem($inputSelectNum)
{
    $selectNum = $inputSelectNum -as [int]
    if ($inputSelectNum -eq "" -or $selectNum -eq $null)
    {
        Write-Host "Please input an integer value ..." -fore red
    }
    else
    {
        switch($selectNum)
        {
            00 { "Bye bye !" }
            01 { MakeCodeCertificate }
            02 { ListCertificates }
            03 { CallSignTool }
            98 { TestEntry }
            99 { InputUsernameAndPassword }
            default { Write-Host "Invalid menu item ..." -fore red }
        }
    }
}

do
{
    PrintMenuTop
    $selectNum = Read-Host "Input your choice"
    ProcessMenuItem($selectNum)
} while($selectNum -ne 0)

# "Press any key to continue ..."
# $inputEmpty = [Console]::ReadLine()
