#!/bin/bash
echo "The Dealer Analysis Investigation"						*Heading of the script*
echo "Enter the following datein the following format: 0310 0312 0315"			*The script request you enter the 4 digit date value*
read x											*The read x will save the date value and send it to the cat command* 
echo "Enter time in this format:  xx:xx:xx AM or PM"					*The script request you enter the time in the required format*
read y											*The read y will save the time value and send to the grep command *
echo "The corresponding dealer for this date and time is:     " 
cat "$x"_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' | grep "$y"		*The cat command will receive the  date value and  output the correct folder  and pipe to awk to print out the dealer*


