#This scripts adds the configuration to the configuration of the munin-master:
for file in /var/cache/salt/master/minions/*; do
  cat $file/files/etc/test >> /etc/test/munintest.conf
  rn $file/files/etc/test
done
