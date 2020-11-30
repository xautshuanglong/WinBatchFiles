
function MakeCodeCertificate()
{
    New-SelfSignedCertificate -Type Custom -Subject "E=xjshuanglong@126.com, CN=Shuanglong Code, O=Shuanglong, C=CN"`
     -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3","2.5.29.19={text}")`
     -KeyUsage DigitalSignature -FriendlyName "Shuanglong Code Signature"`
     -KeyAlgorithm RSA -KeyLength 2048 -SmimeCapabilities -CertStoreLocation "Cert:\CurrentUser\My"`
}

function ListCertificates()
{
    Dir Cert:CurrentUser\My -CodeSigningCert
}

function CallSignTool()
{
    "Call SignTool.exe"
}

function StartPowerShellAdmin
{
    Start-Process PowerShell -verb runas
}
