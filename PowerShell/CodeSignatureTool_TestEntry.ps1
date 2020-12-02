
# ┏━┳━┓
# ┣━╋━┫
# ┗━┻━┛
# ┃ ┃ ┃
# ┗━┻━┛

# ╔═╦═╗
# ╠═╬═╣
# ║ ║ ║
# ╚═╩═╝

# ╔══════╦══════╗
# ╠══════╬══════╣
# ╟┈┈┈┈┈┈╫┈┈┈┈┈┈╢
# ╟┅┅┅┅┅┅╫┅┅┅┅┅┅╢
# ╚══════╩══════╝
#

#   ╱╲╱╲
#   ╲╱╲╱
  
  
# ╭───╮
# │ ╳ │
# ╰───╯


function TestEntry()
{
    # TestFunction_WithParams "xixi" "haha"
    # TestFunction_ParamDeclaration a b

    $thumbprint = Read-Host "指定证书指纹"
    TestFunction_FormateListCertificate $thumbprint
}

# 数据类型查看、判断、转换
# $valueName.GetType()
# $valueName -is [int]
# $valueName -as [int]

function InputUsernameAndPassword
{
    $username = Read-Host "What is your name"
    $password = Read-Host "Input password for $username" -AsSecureString

    $msg = $username + ':' + [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
    $msg

    $passwordCipherText = ConvertTo-SecureString -String TestPassword -Force -AsPlainText 
    $passwordCipherText
    $passwordPlainText = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($passwordCipherText))
    $passwordPlainText
}

function TestFunction_WithParams($Parameter1='param1.vlue', $Parameter2='param2.value')
{
    "You entered $Parameter1 and $Parameter2!"
}

function TestFunctionz_ParamDeclaration
{
    param(
        $aa,
        $bb,
        $cc
    )

    <#
    for($idx=0; $idx -lt $args.Count; $idx++)
    {
        $msg = "arg[" + $idx + "]=" + $args[$idx]
        $msg
    }
    #>
}

function TestFunction_FormateListCertificate
{
    param (
        $thumbprint
    )
    
    $certificate = Get-ChildItem Cert:\CurrentUser\My | Where-Object {$_.Thumbprint -eq $thumbprint}
    $certificate | Format-List *
}
