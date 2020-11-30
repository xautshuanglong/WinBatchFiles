. .\CodeSignatureTool_TestEntry.ps1
. .\CodeSignatureTool_SignFunctions.ps1

function PrintMenuTop
{
    Write-Host "�X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�["
    Write-Host "�U                     ǩ������ V1.0                        �U"
    Write-Host "�U                       2020-11-30                         �U"
    Write-Host "�d�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�g"
    Write-Host "�U                                                          �U"
    Write-Host "�U                  00. �˳�                                �U"
    Write-Host "�c���������������������������������������������������������������������������������������������������������������������f"
    Write-Host "�U                  01. ����ǩ��֤��                        �U"
    Write-Host "�c���������������������������������������������������������������������������������������������������������������������f"
    Write-Host "�U                  02. �鿴ǩ��֤��                        �U"
    Write-Host "�c���������������������������������������������������������������������������������������������������������������������f"
    Write-Host "�U                  03. ��ʼǩ��                            �U"
    Write-Host "�d�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�g"
    Write-Host "�U                  98. �������                            �U"
    Write-Host "�c���������������������������������������������������������������������������������������������������������������������f"
    Write-Host "�U                  99. �û��������                        �U"
    Write-Host "�U                                                          �U"
    Write-Host "�^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a"
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
