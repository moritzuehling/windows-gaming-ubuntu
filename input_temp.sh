#!/bin/bash

echo "Entry"
echo -e -n '\x03' | netcat -w 1  -U /run/user/1000/windows-gaming-driver/control.sock

sleep 20s

echo "Exit"
echo -e -n '\x04' | netcat -w 1 -U /run/user/1000/windows-gaming-driver/control.sock
	

