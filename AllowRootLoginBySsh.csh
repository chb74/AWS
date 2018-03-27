#!/bin/tcsh 

# -- By chb@mz.co.kr -- # 
# -- On Mar 9, 2018 -- # 

set CloudConfig = '/etc/cloud/cloud.cfg.d/00_defaults.cfg'
set SshConfig = '/etc/ssh/sshd_config' 
set Date = `date '+%Y%m%d-%H%M%S'`
set SshDaemon = '/etc/init.d/sshd' 
set LocalTimeZone = 'Asia/Seoul'

rm -f /etc/localtime 
ln -s /usr/share/zoneinfo/$LocalTimeZone /etc/localtime

# -- Setup SSH -- # 
rm -f $CloudConfig.old 
rm -f $SshConfig.old 

mv $CloudConfig $CloudConfig.old 
mv $SshConfig $SshConfig.old 

sed 's/ssh_pwauth: false/ssh_pwauth: true/' $CloudConfig.old > $CloudConfig 
sed -e 's/^Permit/#Permit/' -e 's/#PermitRootLogin yes/PermitRootLogin yes/' -e 's/PasswordAuthentication no/PasswordAuthentication yes/' $SshConfig.old > $SshConfig
 
$SshDaemon restart 
