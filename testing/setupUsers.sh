groupadd --gid 54321 oinstall
useradd -u 54321 -d /home/oracle -g oinstall -m -s /bin/bash oracle

chmod 666 /etc/sudoers
echo "oracle       ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
chmod 440 /etc/sudoers