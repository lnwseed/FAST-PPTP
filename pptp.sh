#!/bin/bash
clear
	echo ""
	echo ""
echo -e "                  \033[38;5;255m\033[48;5;234m\033[1m 📊 L O W C L A S S - V P N ™ 📊   \033[0m"
echo -e "              \033[1;38;48m ======================================= \033[0m"
echo ""
echo -e "                      \033[38;5;255m\033[48;5;234m\033[1m 📊 P P T P ➕ V P N 📊    \033[0m"
echo ""
echo -e "              \033[1;38;48m ======================================= \033[0m"
echo ""
read -n1 -r -p "                     📊 E N T E R - N O W 📊     "
echo ""
sleep 5
clear
echo -e "                  \033[38;5;255m\033[48;5;234m\033[1m 📊 L O W C L A S S - V P N ™ 📊   \033[0m"
sleep 4
echo -e "              \033[1;38;48m ======================================= \033[0m"
sleep 3
echo ""
echo -e "                      \033[38;5;255m\033[48;5;234m\033[1m 📊 P P T P ➕ V P N 📊    \033[0m"
sleep 2

echo -e "    \033[38;5;255m\033[48;5;234m\033[1m 📊 ดิ้นเรื่อยๆ เหนื่อยก้อพัก รักษาไข่ หายดีแล้วดิ้นต่อน่ะ 555  📊    \033[0m"
echo ""
echo ""
echo ""
apt-get install pptpd -y

MYIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
if [[ "$MYIP" = "" ]]; then
		MYIP=$(wget -qO- nyobascript.esy.es/ip.php)
fi

echo "localip $MYIP" >> /etc/pptpd.conf
echo "remoteip 10.1.0.1-100" >> /etc/pptpd.conf

echo "ms-dns 8.8.8.8" >> /etc/ppp/pptpd-options
echo "ms-dns 8.8.4.4" >> /etc/ppp/pptpd-options

echo "ifconfig ppp0 mtu 1400" >> /etc/ppp/ip-up

echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.d/ipv4_forwarding.conf
sysctl --system

if [[ `ifconfig -a | grep "venet0"` ]]
then
cekvirt='OpenVZ'
elif [[ `ifconfig -a | grep "venet0:0"` ]]
then
cekvirt='OpenVZ'
elif [[ `ifconfig -a | grep "venet0:0-00"` ]]
then
cekvirt='OpenVZ'
elif [[ `ifconfig -a | grep "venet0-00"` ]]
then
cekvirt='OpenVZ'
elif [[ `ifconfig -a | grep "eth0"` ]]
then
cekvirt='KVM'
elif [[ `ifconfig -a | grep "eth0:0"` ]]
then
cekvirt='KVM'
elif [[ `ifconfig -a | grep "eth0:0-00"` ]]
then
cekvirt='KVM'
elif [[ `ifconfig -a | grep "eth0-00"` ]]
then
cekvirt='KVM'
fi

if [ $cekvirt = 'KVM' ]; then
	iptables -I INPUT -s 10.1.0.1/8 -i ppp0 -j ACCEPT  
	iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  
	iptables -t nat -A POSTROUTING -s 10.1.0.1/24 -o eth0 -j MASQUERADE
elif [ $cekvirt = 'OpenVZ' ]; then
	iptables -I INPUT -s 10.1.0.1/8 -i ppp0 -j ACCEPT  
	iptables -t nat -A POSTROUTING -o venet0 -j MASQUERADE  
	iptables -t nat -A POSTROUTING -s 10.1.0.1/24 -o venet0 -j MASQUERADE
fi

service pptpd restart
cd
apt-get install gcc g++ -y
wget https://raw.githubusercontent.com/LOWCLASS-SCRIPT/FAST-PPTP/master/addpptp.c
gcc addpptp.c -o addpptp
mv addpptp /bin/addpptp
chmod +x /bin/addpptp
rm addpptp.c
clear
sleep 10
echo "............"
sleep 5
echo "........."
sleep 4
echo "......."
sleep 3
echo "....."
sleep 2
echo ".."
sleep 1
clear
echo ""
echo ""
echo -e "                  \033[38;5;255m\033[48;5;234m\033[1m 📊 L O W C L A S S - V P N ™ 📊   \033[0m"
echo -e "        \033[1;38;48m ===================================================== \033[0m"
echo ""
echo -e "                  \033[38;5;255m\033[48;5;234m\033[1m 📊 P P T P - V P N 📊   \033[0m"
echo ""
echo -e "     \033[38;5;255m\033[48;5;234m\033[1m พิมพ์ addpptp สำหรับสร้าง user จบ แค่นี้ ขี้เกลียดทำไรเยอะไม่ดีด 55 \033[0m"
echo ""
history -c
rm -rf /root/.bash_history
rm -rf /root/.history
rm /root/pptp*
