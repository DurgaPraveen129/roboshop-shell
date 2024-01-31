echo -e "${color}installing nodejs${nocolor}"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "${color}aading user${nocolor}"
useradd roboshop &>>/tmp/roboshop.log

echo -e "${color}changing the directoriesx${nocolor}"
rm - rf / app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "${color}unzipping the files${nocolor}"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/roboshop.log
cd /app &>>/tmp/roboshop.log
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log

echo -e "${color}installing and chaning directories${nocolor}"
cd /app &>>/tmp/roboshop.log
npm install &>>/tmp/roboshop.log

echo -e "${color}copying services${nocolor}"
cp /home/centos/roboshop.shell/catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log

echo -e "${color}starting the services${nocolor}"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable catalogue &>>/tmp/roboshop.log
systemctl start catalogue &>>/tmp/roboshop.log

echo -e "${color}copying the mongo directories${nocolor}"
cp /home/centos/roboshop.shell/mongodb.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "${color}installing mogoshema${nocolor}"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "${color}installing mongoservice${nocolor}"
mongo --host mongodb-dev.durgapraveendevops </app/schema/catalogue.js &>>/tmp/roboshop.log