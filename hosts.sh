# add disallowed hosts to /etc/hosts
# run with super user permissions

hosts=(
  "mycustomersupport365.com"
  "mackeeper.com"
  "mackeeperapp.mackeeper.com"
  "mackeeperapp2.mackeeper.com"
  "mackeeperapp3.mackeeper.com"
  "macsecurityalert.net"
  "systemupdatenow.com"
  "urgent-computer-alert.com"
  "testpc24.theupgradeweb.com"
  "paid.outbrain.com"
  "static.6min.today"
  "onclickads.net"
)

for host in "${hosts[@]}";do
    grep -q "127.0.0.1 $host" /etc/hosts || echo "127.0.0.1 $host" >> /etc/hosts
done

sudo killall -HUP mDNSResponder
