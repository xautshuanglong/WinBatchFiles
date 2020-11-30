@echo off

@echo ---------------------------------------------------------
@echo            Initialize some environment variable
@echo ---------------------------------------------------------

set SignatureToolPath=C:\Program Files (x86)\Windows Kits\10\bin\x64
@rem set SignatureToolPath=%SignatureToolPath%;C:\Program Files (x86)\Windows Kits\10\bin\x64

set path=%path%;%SignatureToolPath%
