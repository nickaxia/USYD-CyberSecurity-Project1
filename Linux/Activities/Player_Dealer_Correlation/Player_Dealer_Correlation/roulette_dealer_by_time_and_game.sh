#!/bin/bash
echo "The Dealer Analysis Investigation"                             						 *Heading of the script *
echo "Enter one of the following dates: 0310 0312 0315"	                                                         *The user of the script will need to enter the 4 digit date as required*
read x														 *The read x variable coresponds to the date value entered*
echo "Enter time as  xx:xx:xx AM or PM"										 *The time format is  xx:xx:xx AM or PM* 
read y														 *The read y variable corresponds to the time value entered*
echo "The corresponding dealers working this date and time are:     "
cat "$x"_Dealer_schedule | awk -F" " '{print $1, $2, "Black Jack Dealer:  " $3, $4}' | grep "$y"                 *The cat command  inputs the value x= date. Pipes to awk command which will display dealer on duty, the pipe to the grep command is required for the time output*
cat "$x"_Dealer_schedule | awk -F" " '{print $1, $2, "Roulette Dealer:  " $5, $6}' | grep "$y"
cat "$x"_Dealer_schedule | awk -F" " '{print $1, $2, "Texas Hold em Dealer:  " $7, $8}' | grep "$y"


