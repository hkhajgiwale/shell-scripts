hostname=$1
ip=`dig +short $hostname`

if [ -n "$ip" ]
then
	echo "DNS resolution successful"
	echo "DNS resolved to: $ip"
else
	while [ -z "$ip" ]
	do
		ip=`dig +short $hostname`
		if [ -z "$ip" ]
		then
			echo "Waiting for DNS resolution"
			sleep 15
		else
			echo "DNS resolution successful"
			echo "DNS resolved to: $ip"
			break
		fi
	done
fi
