up=1
rem=0
col=0
j=0
k=0
speed=0.075
for((i=1;1;i++)); do
	if [ $up -eq 1 ] 
		then
		for((j=$i % 11 ;j < 10; j++)); do
			echo -n " ";
		done
		col=$((i%256))
		echo -n -e "\x1B[38;5;${col}m//"
		for((k=0;k<5;k++)); do
			echo -n "           //"
		done
		echo -e "\x1B[0m"
		sleep $speed
		rem=$((i % 11))
		if [ $rem -eq 10 ]
		then
			up=0
		fi 
	else
		for((k=$i % 11;k > 0;k--)); do
			echo -n " ";
		done
		col=$((i%256))
		echo -n -e "\x1B[38;5;${col}m"
		echo -n '\\'
		for((j=0;j<5;j++)); do
			echo -n '           \\'
		done
		echo -e "\x1B[0m"
		sleep $speed
		rem=$((i % 11))
		if [ $rem -eq 10 ]
		then
			up=1
		fi
	fi;
done
