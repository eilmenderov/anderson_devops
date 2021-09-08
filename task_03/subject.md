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
sudo netstat -tunapl |
awk '/firefox/ {print$5}' |
cut -d: -f1 |
sort |
tail -n5 |
grep -oP '(\d+\.){3}\d+' |
while read IP ; do whois $IP |
awk -F':''/^Organization/{print $2}'; done
```