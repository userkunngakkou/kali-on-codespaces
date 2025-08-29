#!/bin/bash
set -e

echo "[*] Updating packages..."
apt update

echo "[*] Installing XFCE Desktop and VNC server..."
DEBIAN_FRONTEND=noninteractive apt install -y kali-linux-core kali-desktop-xfce tigervnc-standalone-server

echo "[*] Setting VNC password..."
mkdir -p /root/.vnc
echo "changeme" | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

echo "[*] Creating VNC startup script..."
cat << 'EOF' > /root/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x /root/.vnc/xstartup

echo "[*] Launching VNC server on :1 ..."
vncserver :1 -geometry 1280x800 -depth 24

echo "[*] Done. Connect via VNC viewer to <host>:5901 (password: changeme)"
