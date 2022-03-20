#! /bin/bash
clear
cd /tmp
echo "Dang cap nhat tai nguyen..."
apt-get update  > /dev/null 2>&1
echo ""
echo -e "\033[33;4mDropBear Kuruluyor\033[0m"
echo ""
apt-get -y install dropbear ssh
sed -i 's/NO_START\=1/NO_START\=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT\=22/DROPBEAR_PORT\=442/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS\=/DROPBEAR_EXTRA_ARGS\=\"\-p 442 \-p 80 \-p 8080 \-p 8484 \-p 143 \-p 109\"/g' /etc/default/dropbear
sed -i 's/#PermitRootLogin prohibit\-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin without\-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service dropbear start
service sshd restart
echo ""
echo ""
echo -e "\033[31;4mDropBear Kuruldu\033[0m"
echo "Dropbear erisilebilen portlar: 442, 80, 8080, 8484, 143, 109"
echo -e "\033[31;4m 1 kisi baglanabilir sadece\033[0m"
echo ""
echo ""
echo -e "\033[33;4m1 Sistem yeniden baslatiliyor baglantiniz kesilecek.\033[0m"

echo "############################################"
ip_add=$(wget -qO- ifconfig.me)
echo -e "\033[31;4m##  İp Adresiniz: $ip_add:442\033[0m"
echo "############################################"
echo ""

sleep 0.9 ; reboot
