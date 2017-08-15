#!/bin/bash
echo -e -n '\x03' | netcat -U /run/user/1000/windows-gaming-driver/control.sock
