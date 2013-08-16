@echo off
echo Creating ssh service users
net user sshd sshd /ADD
net user SvcCOPSSH SvcCOPSSH /ADD

echo Giving him proper rights
net localgroup Administrators SvcCOPSSH /add
c:\obf\rkit\ntrights +r SeTcbPrivilege -u SvcCOPSSH
c:\obf\rkit\ntrights +r SeIncreaseQuotaPrivilege -u SvcCOPSSH
c:\obf\rkit\ntrights +r SeCreateTokenPrivilege -u SvcCOPSSH
c:\obf\rkit\ntrights +r SeServiceLogonRight -u SvcCOPSSH
c:\obf\rkit\ntrights +r SeAssignPrimaryTokenPrivilege -u SvcCOPSSH
c:\obf\rkit\ntrights +r SeDenyInteractiveLogonRight -u SvcCOPSSH
c:\obf\rkit\ntrights +r SeDenyNetworkLogonRight -u SvcCOPSSH

echo Creating obf user
net user obf obf /ADD
net localgroup Administrators obf /add

echo Regenerating /etc/passwd for ssh
c:\obf\copssh\bin\mkpasswd -l > c:\obf\copssh\etc\passwd

echo Registering sshd service
c:\obf\copssh\bin\cygrunsrv.exe --install OpenSSHServer --args "-D" --path /bin/sshd --env "CYGWIN=binmode ntsec tty" -u SvcCOPSSH -w SvcCOPSSH 

echo Setting up network
start netsh interface ip set address "Local Area Connection 3" static 192.168.42.1 255.255.255.0 192.168.42.2 1
start netsh interface ip set address "Local Area Connection 2" static 192.168.42.1 255.255.255.0 192.168.42.2 1
start netsh interface ip set address "Local Area Connection" static 192.168.42.1 255.255.255.0 192.168.42.2 1

echo Disable firewall on winxp
start net stop SharedAccess
start c:\obf\rkit\sc config SharedAccess start= demand

echo Starting ssh server
net start OpenSSHServer

echo Creating and registering build service
c:\obf\rkit\instsrv.exe obf_build c:\obf\rkit\srvany.exe
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\obf_build\Parameters" /v Application /t reg_sz /d "C:\obf\build.bat"
c:\obf\rkit\sc config obf_build start= demand

echo Bootstrap complete
pause > nul
