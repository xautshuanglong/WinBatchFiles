
function MakeCodeCertificate()
{
    New-SelfSignedCertificate -Type Custom -Subject "E=xjshuanglong@126.com, CN=Shuanglong Code, O=Shuanglong, C=CN"`
     -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3","2.5.29.19={text}")`
     -KeyUsage DigitalSignature -FriendlyName "Shuanglong Code Signature"`
     -KeyAlgorithm RSA -KeyLength 2048 -SmimeCapabilities -CertStoreLocation "Cert:\CurrentUser\My"`
}

function ListCertificates()
{
    Get-ChildItem Cert:CurrentUser\My -CodeSigningCert
}

function ExportPfxCertificate()
{
    $thumbprint = Read-Host "请输入证书指纹"
    if ($thumbprint -eq '')
    {
        Write-Warning('输入的证书指纹无效 ...')
        return
    }
    $certItem = Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert | Where-Object {$_.Thumbprint -eq $thumbprint}
    if ($certItem.Count -le 0)
    {
        Write-Warning '指定代码签名证书不存在 ...'
        return
    }
    $password = Read-Host "请为私钥设置密码" -AsSecureString
    $passwordVerify = Read-Host "请确认私钥密码" -AsSecureString

    if ([Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringtoBSTR($password))`
    -eq [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringtoBSTR($passwordVerify)))
    {
        Export-PfxCertificate -cert "Cert:\CurrentUser\My\$thumbprint" -FilePath ExportedSoftwareSignature.pfx -Password $password
    }
    else
    {
        Write-Warning '两次输入的密码不一致 ...'
    }
}

function CallSignTool()
{
    $password = Read-Host "请输入私钥设置密码" -AsSecureString
    $codeFile = Read-Host "请输待签名代码文件"
    $passwordPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringtoBSTR($password))
    signtool sign /v /fd SHA256 /p $passwordPlain /f ExportedSoftwareSignature.pfx /t http://timestamp.globalsign.com $codeFile
}

function StartPowerShellAdmin
{
    $curLocation = Get-Location
    # 非管理员权限启动 -WorkingDirectory 参数才有效
    # Start-Process PowerShell -WorkingDirectory $curLocation -ArgumentList "-NoExit -File $curLocation\CodeSignatureTool_Initialize.ps1"
    Start-Process PowerShell -verb runas -WorkingDirectory $curLocation -ArgumentList "-NoExit -File $curLocation\CodeSignatureTool_Initialize.ps1"
}
