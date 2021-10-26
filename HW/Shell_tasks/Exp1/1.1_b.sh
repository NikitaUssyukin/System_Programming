#!/bin/bash

for n in {30..37} 
do 
echo -e fg$n '\E['$n';'01'm SS64'
tput sgr0 
done