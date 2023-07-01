!#/bin/bash

sudo su -c ‘curl https://download.mono-project.com/repo/centos7-stable.repo | tee /etc/yum.repos.d/mono-centos7-stable.repo’
sudo yum install mono-devel
sudo curl -o /usr/share/dotnet/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe
sudo su dotnetuser
vi ~/.bashrc , i , copy/paste bold text below, :wq
alias nuget=”mono /usr/share/dotnet/nuget.exe”
source ~/.bashrc
