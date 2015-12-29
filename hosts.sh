# add disallowed hosts to /etc/hosts
# run with super user permissions

echo "# malware and ads
127.0.0.1 mycustomersupport365.com
127.0.0.1 mackeeper.com
127.0.0.1 mackeeperapp.mackeeper.com
127.0.0.1 mackeeperapp2.mackeeper.com
127.0.0.1 mackeeperapp3.mackeeper.com
127.0.0.1 macsecurityalert.net
127.0.0.1 systemupdatenow.com
127.0.0.1 urgent-computer-alert.com
127.0.0.1 testpc24.theupgradeweb.com
127.0.0.1 paid.outbrain.com
127.0.0.1 static.6min.today" >> /etc/hosts