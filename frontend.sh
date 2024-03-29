echo -e "${color}installing nginx${nocolor}"
yum install nginx -y &>>/tmp/roboshop.log

echo -e "${color}removing old directories content${nocolor}"
rm -rf /usr/share/nginx/html/ &>>/tmp/roboshop.log

echo -e "${color}copying the directories${nocolor}"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log

echo -e "${color}unzipping directories${nocolor}"
cd /usr/share/nginx/html &>>/tmp/roboshop.log
unzip /tmp/frontend.zip &>>/tmp/roboshop.log

echo -e "${color}copying the directories from service file${nocolor}"
cp /home/centos/roboshop.shell/roboshop.conf /etc/nginx/default.d/roboshop.conf

echo -e "${color}starting the service${nocolor}"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log