# Wnet_dev_project
My project to help service engineers of an Internet provider.

Key:

-h --h -help --help #info
--version,  -v  :  check software version
--diagnostic, -d : nods diagnostic
--vlan, -v : show vlan info

To Use:

chmode +x err_rm.sh

For Clear ports
err_rm.sh hostname username port 
On Junipper: err_rm.sh 192.168.1.1 admin xe-1/0/25
On D-Link: err_rm.sh 192.168.1.1 admin 25

For diagnostic
err_rm.sh hostname username port -d
On Junipper: err_rm.sh 192.168.1.1 admin xe-1/0/25 -d
On D-Link: err_rm.sh 192.168.1.1 admin 25 -d

Diagnostic and show all Vlan
err_rm.sh hostname username port -d -vl
On Junipper: err_rm.sh 192.168.1.1 admin xe-1/0/25 -d -vl
On D-Link: err_rm.sh 192.168.1.1 admin 25 -d -vl

Diagnostic and show target Vlan
err_rm.sh hostname username port -d -vl number_vlan
On Junipper: err_rm.sh 192.168.1.1 admin xe-1/0/25 -d -vl 1001
On D-Link: err_rm.sh 192.168.1.1 admin 25 -d -vl 1001
