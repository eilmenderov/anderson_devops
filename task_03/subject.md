## Task
### Deadline - September 14, 2021
### Convert the following script:
```
sudo netstat -tunapl | awk '/firefox/ {print$5}' | cut -d: -f1 | sort | tail -n5 | grep -oP '(\d+\.){3}\d+' | while read IP ; do whois $IP | awk -F':''/^Organization/{print $2}'; done
```
* create a README and describe what your script will do
* the script must take the PID or the process name as an argument
* the number of lines of output must be user-regulated
* it should be possible to see other connection states
* the script should output understandable error messages
* the script should not depend on startup privileges, give a warnings
* bonus - the script outputs the number of connections to each organization
* bonus - the script allows you to get other data from the 'whois' output
* bonus - the script can work with 'ss', you use /built-ins utilities, not included in base script
### Commands description:
```
sudo 
netstat -tunapl 							| - displays different network-related information
	-l - all open ports (LISTEN)
	-t - over the TCP protocol
	-u - over the UDP protocol
	-n - without IP/name resolution
	-a - list of all ports (both listened and not)
	-p - which port is occupied by a certain program
awk '/firefox/ {print$5}' 					| - a tool for processing and filtering text
cut -d: -f1 								| - allows you to cut out part of the text
sort 										| - sort
tail -n5 									| - allows you to output a specified number of lines from the end of the file
grep -oP '(\d+\.){3}\d+' 					| - gives users the ability to search for a string
while read IP ; do whois $IP 				| - it will tell you a lot of information about who owns an Internet domain
awk -F':''/Organization/{print $2}'; done 	| - a tool for processing and filtering text
```