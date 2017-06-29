# docker-nagios-plugins

## Steps after first start
- Change password for nagios webadmin user

## Optimization & todos
- [ ] Write docu how to change default password for nagios webadmin

## Workaround to start nagios
- open shell
- htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
- apache2ctl start
- /usr/local/nagios/bin/nagios /usr/local/nagios/etc/nagios.cfg
