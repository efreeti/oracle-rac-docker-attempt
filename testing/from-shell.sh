systemctl enable rpcbind
systemctl start rpcbind
#systemctl restart nfs-server
sudo systemctl start rpc-statd
/usr/lib/systemd/systemd --system

sudo mount -t nfs -o resvport,rw 192.168.17.25:/oradata /oradata -v
sudo mount -t nfs -o resvport,rw,vers=3 192.168.17.25:/oradata /oradata -v
rpcinfo 192.168.17.25
rpcinfo 192.168.17.25 | egrep nfs