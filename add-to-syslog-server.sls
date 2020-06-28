Make sure syslog-ng is installed:
  pkg.installed:
    - pkgs:
    - syslog-ng

Connect minion to syslog_server:
  file.managed:
    - name: /etc/syslog-ng/syslog-ng.conf
    - source: salt://syslog-config.conf

Shutdown syslog service:
  service.dead:
    - name: syslog-ng

Start syslog service:
 service.running:
    - name: syslog-ng
