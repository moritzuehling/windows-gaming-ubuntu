#!/bin/bash

sleep .3
echo -e -n '\x01' | netcat -w 1 -U /run/user/1000/windows-gaming-driver/control.sock


