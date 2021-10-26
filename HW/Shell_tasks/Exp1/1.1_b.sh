#!/bin/bash

hello="Hello World!"

#Bold Text
echo 'Bold Text:'
echo -e '\033[1m'$hello'\033[0m'

#Blinking Text
echo 'Blinking Text:'
echo -e '\033[36;5m'$hello'\033[0m'

#Coloured Text
echo 'Coloured Text:'
for n in {30..37} 
do 
echo -e Foreground Color $n '\E['$n'm '$hello''
tput sgr0 
done

#Background Coloured Text
for n in {41..46} 
do 
echo -e Background Color $n '\033['$n'm '$hello''
tput sgr0 
done

#Blinking Bold Coloured Text
echo 'Blinking Coloured Text:'
for n in {30..37} 
do 
echo -e Foreground Color $n '\033['$n';5;1m '$hello'\033[0m'
tput sgr0 
done
