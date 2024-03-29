#/bin/sh

#local of the ping log file:
log=/tmp/pinger.log

#file with stats:
stats=/tmp/stats.log

if [ "$#" -lt 1 ]; then
	echo "No arguments, please add the times to be monitored."
	exit 0
fi

#Clean lines by double the last amount.
clear_lines=$(echo "${@: -1} * 2"|bc)

#while true;
#do
> $stats
for var in "$@"
do
	value=$(tail -n $var $log|grep -c "^$"|xargs -i echo "({}/$var) * 100"|bc -l|sed 's/..................$//')
	echo "$value%" >> $stats
done
echo $(cat $stats|tr "\n" " ")
#blabla=$(cat $stats|tr "\n" " ")
#printf "%b" $blabla
#printf "%s" $(cat $stats)
t_lines=$(cat $log|wc -l)
if [ $t_lines -gt $clear_lines ]; then
	#clear the first ${@: -1} lines
	sed -i 1,${@: -1}d $log
fi
#sleep 1
#> $stats
exit 0
#done
