#!/bin/bash
clear
#REGISTER CONFIG
 echo ""
          echo -e "\e[031;1m     
                         
                =============== OS-32 & 64-bit ================
                #                                             #
                #     AUTOSCRIPT CREATED BY เฮียเบิร์ด แงะตลอด   #
                #       -----------About Us------------       # 
                #            Telp : 097-026-7262              #
                #         { VPN / SSH / OCS PANEL }           # 
                #       http://facebook.com/Ceolnw            #    
                #             Line id : ceolnw                #
                #                                             #
                =============== OS-32 & 64-bit ================
                
                    >>>>> โปรดชำระเงินก่อนใช้สคริปต์อัตโนมัติ <<<<<
                                      
                            Thank You For Choice Us"
			
	echo ""
	echo -e "\e[034;1m----SCRIPT V.1 VIP"
	echo ""
	echo -e "\e[032;1m ( ใส่รหัสผ่านติดตั้ง... )"
	echo ""
read -p "๏๏๏โปรดใส่รหัสสำหรับติดตั้งสคลิปนี้.. : " passwds
wget -q -O /usr/bin/pass xn--l3clxf6cwbe0gd7j.com/config.txt
if ! grep -w -q $passwds /usr/bin/pass; then
clear
echo ""
echo ""
echo " เสียใจด้วย รหัสผิดว่ะ ถ้าไม่มีรหัสติดต่อแอดมินฯ เฮียเบิร์ด"
echo ""
echo " เด้งไปเลยเฟสนี้แน่นอน : www.facebook.com/ceonw"
echo ""
echo ""
rm /usr/bin/pass
rm config.txt
rm pptp.sh
exit
fi

apt-get install boxes
sudo apt-get -y install ruby
sudo gem install lolcat
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
wget https://raw.githubusercontent.com/lnwseed/FAST-PPTP/master/addpptp
mv addpptp /bin/addpptp
chmod +x /bin/addpptp
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
echo -e "                  \033[38;5;255m\033[48;5;234m\033[1m >>> P P T P - V P N <<<   \033[0m"
echo ""
echo -e "     \033[38;5;255m\033[48;5;234m\033[1m พิมพ์ addpptp สำหรับสร้าง user จบ แค่นี้ ขี้เกลียดแงะเยอะไม่ดีด 55 \033[0m"
echo ""
history -c
rm -rf /root/.bash_history
rm -rf /root/.history
rm /root/pptp*
