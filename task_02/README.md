## Plan
* ✅ write an application:
	* ✅ the service listens at least on port 80 (443 as an option)
	* ✅ the service accepts GET and POST methods
	* ✅ the service should receive JSON object
* ✅ create a test_VM(Debian 10)
* use Ansible to deploys the service to the test_VM with playbook
* use Ansible to set up a test_VM with playbook:
	* allow connections only to the ports 22, 80, 443
	* configure systemd so that the application starts after reboot
	* disable root login
	* disable all authentication methods except "public keys"
	* bonus points for SSL/HTTPS support with self-signed certificates
	* bonus points for using ansible vault
