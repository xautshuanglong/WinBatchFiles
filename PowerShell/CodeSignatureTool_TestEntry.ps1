
# �����ש���
# �ǩ��贈��
# �����ߩ���
# �� �� ��
# �����ߩ���

# �X�T�j�T�[
# �d�T�p�T�g
# �U �U �U
# �^�T�m�T�a

# �X�T�T�T�T�T�T�j�T�T�T�T�T�T�[
# �d�T�T�T�T�T�T�p�T�T�T�T�T�T�g
# �c�������������o�������������f
# �c�������������o�������������f
# �^�T�T�T�T�T�T�m�T�T�T�T�T�T�a
#

#   �u�v�u�v
#   �v�u�v�u
  
  
# �q�������r
# �� �w ��
# �t�������s


function TestEntry()
{
    TestFunctionWithParams "xixi" "haha"
    TestFunctionParamDeclaration a b
}

# �������Ͳ鿴���жϡ�ת��
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
