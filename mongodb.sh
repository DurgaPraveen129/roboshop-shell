echo -e "${color}copying the directories${nocolor}"
cp mongodb.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "${color}installing mongodb server${nocolor}"
yum install mongodb-org -y &>>/tmp/roboshop.log

echo -e "${color}update mongod listen adress${nocolor}"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

echo -e "${color}starting the mongodb service${nocolor}"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl start mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log