
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
    TestFunctionWithParams "xixi" "haha"
    TestFunctionParamDeclaration a b
}

# 数据类型查看、判断、转换
# $valueName.GetType()
# $valueName -is [int]
# $valueName -as [int]

function StartPowerShellAdmin
{
    Start-Process PowerShell -verb runas
}

function InputUsernameAndPassword
{
    $username = Read-Host "What is your name"
    $password = Read-Host "Input password for $username" -AsSecureString

    $msg = $username + ':' + [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
    $msg
}

function TestFunctionWithParams($Parameter1='param1.vlue', $Parameter2='param2.value')
{
    "You entered $Parameter1 and $Parameter2!"
}

function TestFunctionParamDeclaration
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
