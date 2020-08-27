#!/bin/bash

# Designed to switch DNS records on a BIND9 server.
# Subject to my own config, can be adapted for you.

# Setting static IP variables for LB's
LB1=''
LB2=''

# Grabbing jamdoog.forward zone
# Then will increment serial by one so it will push to slaves

SERIAL=`sed -n '3p' < /var/named/jamdoog.forward`
((SERIAL=SERIAL+1))
< /var/named/jamdoog.forward sed  "3a \\
         $SERIAL
" > file.txt
sed '3d' file.txt > jamdoog.forward
rm file.txt

# Modifying static lines which represent @ and www

if [ $1 != $LB1 ]
then
  < jamdoog.forward sed "13a \\
@        IN  A       $LB2
" > file.txt
  rm jamdoog.forward
  < file.txt sed "14a \\
www      IN  A       $LB2
" > jamdoog.forward
  rm file.txt
  sed '13d' jamdoog.forward > file.txt
  rm jamdoog.forward
  sed '15d' file.txt > jamdoog.forward
  rm file.txt
  rm /var/named/jamdoog.forward
  mv jamdoog.forward /var/named


  systemctl restart named
fi

if [ $1 == $LB1 ]
then
  < jamdoog.forward sed "13a \\
@        IN  A       $LB1
" > file.txt
  rm jamdoog.forward
  < file.txt sed "14a \\
www	 IN  A       $LB1
" > jamdoog.forward
  rm file.txt
  sed '13d' jamdoog.forward > file.txt
  rm jamdoog.forward
  sed '15d' file.txt > jamdoog.forward
  rm file.txt
  rm /var/named/jamdoog.forward
  mv jamdoog.forward /var/named
  systemctl restart named
fi

# Grabbing jamdoog.download zone
# Then will increment serial by one so it will push to slaves

SERIALDL=`sed -n '3p' < /var/named/jamdoogdl.forward`
((SERIALDL=SERIALDL+1))
< /var/named/jamdoogdl.forward sed  "3a \\
         $SERIALDL
" > file.txt
sed '3d' file.txt > jamdoogdl.forward
rm file.txt

# Modifying static lines which represent @ and www

if [ $1 != $LB1 ]
then
  < jamdoogdl.forward sed "13a \\
@        IN  A       $LB2
" > file.txt
  rm jamdoogdl.forward
  < file.txt sed "14a \\
www	 IN  A       $LB2
" > jamdoogdl.forward
  rm file.txt
  sed '13d' jamdoogdl.forward > file.txt
  rm jamdoogdl.forward
  sed '15d' file.txt > jamdoogdl.forward
  rm file.txt
  rm /var/named/jamdoogdl.forward
  mv jamdoogdl.forward /var/named


  systemctl restart named
fi

if [ $1 == $LB1 ]
then
  < jamdoogdl.forward sed "13a \\
@        IN  A       $LB1
" > file.txt
  rm jamdoogdl.forward
  < file.txt sed "14a \\
www	 IN  A       $LB1
" > jamdoogdl.forward
  rm file.txt
  sed '13d' jamdoogdl.forward > file.txt
  rm jamdoogdl.forward
  sed '15d' file.txt > jamdoogdl.forward
  rm file.txt
  rm /var/named/jamdoogdl.forward
  mv jamdoogdl.forward /var/named
  systemctl restart named
fi
