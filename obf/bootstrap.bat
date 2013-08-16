@echo off
echo Creating ssh service user
net user SvcCOPSSH SvcCOPSSH /ADD

echo Giving him proper rights
net localgroup Administrators SvcCOPSSH /add
c:\obf\ntrights\ntrights +r SeTcbPrivilege -u SvcCOPSSH
c:\obf\ntrights\ntrights +r SeIncreaseQuotaPrivilege -u SvcCOPSSH
c:\obf\ntrights\ntrights +r SeCreateTokenPrivilege -u SvcCOPSSH
c:\obf\ntrights\ntrights +r SeServiceLogonRight -u SvcCOPSSH
c:\obf\ntrights\ntrights +r SeAssignPrimaryTokenPrivilege -u SvcCOPSSH
c:\obf\ntrights\ntrights +r SeDenyInteractiveLogonRight -u SvcCOPSSH
c:\obf\ntrights\ntrights +r SeDenyNetworkLogonRight -u SvcCOPSSH

echo Creating obf user
net user obf obf /ADD

echo Registering sshd service
c:\obf\copssh\bin\cygrunsrv.exe --install OpenSSHServer --args "-D" --path /bin/sshd --env "CYGWIN=binmode ntsec tty" -u SvcCOPSSH -w SvcCOPSSH 

echo Setting up network
start netsh interface ip set address "Local Area Connection 3" static 192.168.42.1 255.255.255.0 192.168.42.2 1
start netsh interface ip set address "Local Area Connection 2" static 192.168.42.1 255.255.255.0 192.168.42.2 1
start netsh interface ip set address "Local Area Connection" static 192.168.42.1 255.255.255.0 192.168.42.2 1

echo Starting ssh server
net start OpenSSHServer

echo Creating and registering build service
c:\obf\rkit\instsrv.exe obf_build c:\obf\rkit\srvany.exe
regedit /s bootstrap.reg
sc config obf_build start= demand

echo Bootstrap complete
pause < nul