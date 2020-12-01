. .\CodeSignatureTool_TestEntry.ps1
. .\CodeSignatureTool_SignFunctions.ps1

function PrintMenuTop
{
    Write-Host '╔══════════════════════════════════════════════════════════╗'
    Write-Host '║                     签名工具 V1.0                        ║'
    Write-Host '║                       2020-11-30                         ║'
    Write-Host '╠══════════════════════════════════════════════════════════╣'
    Write-Host '║                                                          ║'
    Write-Host '║                  00. 退出                                ║'
    Write-Host '╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢'
    Write-Host '║                  01. 创建签名证书                        ║'
    Write-Host '╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢'
    Write-Host '║                  02. 查看签名证书                        ║'
    Write-Host '╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢'
    Write-Host '║                  03. 开始签名                            ║'
    Write-Host '╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢'
    Write-Host '║                  04. 启动新控制台（管理员权限）          ║'
    Write-Host '╠══════════════════════════════════════════════════════════╣'
    Write-Host '║                  98. 测试入口                            ║'
    Write-Host '╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢'
    Write-Host '║                  99. 用户密码测试                        ║'
    Write-Host '║                                                          ║'
    Write-Host '╚══════════════════════════════════════════════════════════╝'
}

function ProcessMenuItem($inputSelectNum)
{
    $selectNum = $inputSelectNum -as [int]
    if ($inputSelectNum -eq '' -or $null -eq $selectNum)
    {
        Write-Host '请输入一个整型数字 ...' -fore Yellow
    }
    else
    {
        switch($selectNum)
        {
            00 { '拜拜！' }
            01 { MakeCodeCertificate }
            02 { ListCertificates }
            03 { CallSignTool }
            04 { StartPowerShellAdmin }
            98 { TestEntry }
            99 { InputUsernameAndPassword }
            default { Write-Host '无效选项 ...' -fore red }
        }
    }
}

do
{
    PrintMenuTop
    $selectNum = Read-Host '输入您的选择'
    ProcessMenuItem($selectNum)
} while($selectNum -ne 0)
