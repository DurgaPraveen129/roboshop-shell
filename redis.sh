echo -e "${color}install redis repo${nocolor}"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>/tmp/roboshop.log

echo -e "${color}enabled redis${nocolor}"
yum module enable redis:remi-6.2 -y &>>/tmp/roboshop.log

echo -e "${color}installing redis${nocolor}"
yum install redis -y &>>/tmp/roboshop.log

echo -e "${color}installing redis${nocolor}"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/redis.conf  /etc/redis/redis.conf &>>/tmp/roboshop.log

echo -e "${color}starting redis ${nocolor}"
systemctl enable redis &>>/tmp/roboshop.log
systemctl restart redis &>>/tmp/roboshop.log