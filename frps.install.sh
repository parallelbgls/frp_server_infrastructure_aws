FRP_token=a123456
FRP_version=0.44.0
FRP_admin_password=a123456

wget https://github.com/fatedier/frp/releases/download/v${FRP_version}/frp_${FRP_version}_linux_amd64.tar.gz
tar -zxvf frp_${FRP_version}_linux_amd64.tar.gz
cd frp_${FRP_version}_linux_amd64/
cat <<EOF > frps.ini
[common]
bind_port = 7000
token = $FRP_token

dashboard_port = 7001
dashboard_user = admin
dashboard_pwd = $FRP_admin_password
enable_prometheus = true

log_file = /var/log/frps.log
log_level = info
log_max_days = 3

EOF
cat <<EOF > frps.service
[Unit]
Description=frps
After=network.target

[Service]
TimeoutStartSec=30
ExecStart=/usr/local/bin/frps -c /etc/frp/frps.ini
ExecStop=/bin/kill $MAINPID

[Install]
WantedBy=multi-user.target

EOF
sudo mv frps.service /usr/lib/systemd/system/
sudo mkdir -p /etc/frp
sudo cp frps.ini /etc/frp
sudo cp frps /usr/local/bin
sudo systemctl enable frps
sudo systemctl start frps
