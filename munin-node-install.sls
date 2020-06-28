Make sure munin-node is installed:
  pkg.installed:
    - pkgs:
    - munin-node

Configure Munin-node accordingly:
  file.managed:
    - name: /etc/munin/munin-node.conf
    - source: salt://munin-config.conf

Make a file with data which is needed for the munin-monitor config file:
  file.append:
    - name: /etc/test
    - text:
      - [{{ grains['host'] }}.example.com]
      - address {{ grains['ipv4'] | first }}
      - use_node_name yes

Copy the made file to the munin-monitor server:
  module.run:
    - name: cp.push
    - path: /etc/test

Shutdown Munin-node service:
  service.dead:
    - name: munin-node

Start Munin-node service:
  service.running:
    - name: munin-node
