#!/bin/bash
set -e

echo "[*] Updating package list..."
apt update

echo "[*] Installing Kali Linux Top 10 tools..."
DEBIAN_FRONTEND=noninteractive apt install -y kali-linux-top10

echo "[*] Setup complete! You can now use nmap, metasploit, hydra, etc."
