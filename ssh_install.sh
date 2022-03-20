#! /bin/bash
clear
cd /tmp
apt-get update  > /dev/null 2>&1
echo ""
echo -e "\033[33;4mDropBear Kuruluyor\033[0m"
echo ""
apt-get -y install dropbear ssh
sed -i 's/NO_START\=1/NO_START\=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT\=22/DROPBEAR_PORT\=442/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS\=/DROPBEAR_EXTRA_ARGS\=\"\-p 442 \-p 443 \-p 80 \-p 8080 \-p 8484 \-p 143 \-p 109\"/g' /etc/default/dropbear
sed -i 's/#PermitRootLogin prohibit\-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin without\-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service dropbear start
service sshd restart
clear && printf '\e[3J'
echo ""
echo ""
echo -e "\033[31;7mDropBear Kuruldu\033[0m"
echo ""
echo "Dropbear erisilebilen portlar: 442, 443, 80, 8080, 8484, 143, 109"
echo ""
echo -e "\033[31;3m 1 kisi baglanabilir sadece\033[0m"
echo ""
echo ""
echo -e "\033[33;3m Sistem yeniden baslatiliyor baglantiniz kesilecek.\033[0m"
echo ""
echo "############################################"
echo ""
ip_add=$(wget -qO- ifconfig.me)
echo -e "\033[31;3m##  İp Adresiniz:\033[0m $ip_add:442"
echo -e "\033[31;3m##  Username:\033[0m root"
echo -e "\033[31;3m##  PassWord:\033[0m Putty Baglantı Sifreniz.."
echo ""
echo "############################################"
echo ""

sleep 0.9 ; reboot
