#!/bin/bash

#Display the list of  options e.g (a,b,c,d)

options() {
echo "Choose the operation you want to perform"
echo "1.Option A for Addition"
echo "2.option B for Sbstraction"
echo "3.option c for Multiplication"
echo "4.option D for Division"
}

#Function for prompting user to select an option.

selection() {
read -p "Enter your  option: " i
}

#Validating the option selected by user.
retry_limit=3
retries=0

options
selection

while [[ $retries -lt $retry_limit ]]
do
	if [[ $i != A ]] && [[ $i != B ]] && [[ $i != C ]] && [[ $i != D ]]
	then
		echo "Invalid Option. Try again."
		options #Function for list of options given to user
		selection #Function for User selection of option
		((retries++))
	else
		break
	fi
done
if [[ $retries -ge $retry_limit ]]
then
	echo "Too many invalid inputs. Exiting"
	exit 1
fi

echo "You Selected option: $i"

#Prompting user to enter two numbers
read -p "Enter your first number: " first_number
read -p "Enter your second number: " second_number
addition() {
	echo "Performing addition"
	result=$(( $first_number+$second_number ))
	echo "$result"
}
subtraction() {
        echo "Performing Subtraction"
        result=$(( $first_number-$second_number ))
        echo "$result"
}
multiplication() {
        echo "Performing Multiplication"
        result=$(( $first_number*$second_number ))
        echo "$result"
}
division() {
        echo "Performing division"
	if [[ $second_number -ne 0 ]]
	then
		result=$((echo "scale=2;  $first_number/$second_number" | bc ))
		echo "$result"
	else
		echo "Error: Division by Zero"
	fi
}
case $i in
	A|a)addition;;
	B|b)subtraction;;
	C|c)multiplication;;
	D|d)division;;
	*)echo "Invalid Option"
esac
