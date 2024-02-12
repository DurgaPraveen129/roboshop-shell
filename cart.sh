echo -e "${color}installing nginx${nocolor}"
curl -sl https://rpm.nodesource.com/setup_lts.x | bash  &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
yum install nodejs -y  &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
useradd roboshop  &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
mkdir /app  &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip  &>>/tmp/roboshop.log
cd /app  &>>/tmp/roboshop.log
unzip /tmp/cart.zip  &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
cd /app  &>>/tmp/roboshop.log
npm install  &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
cp / home/centos/roboshop.shell/cart.service /etc/systemd/system/cart.service &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
systemctl daemon-reload  &>>/tmp/roboshop.log
systemctl enable cart &>>/tmp/roboshop.log
systemctl restart cart  &>>/tmp/roboshop.log