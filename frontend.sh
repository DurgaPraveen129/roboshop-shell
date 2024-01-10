echo -e "${color}installing nginx${nocolor}"
yum install nginx -y &>>/tmp/roboshop.log

echo -e "${color}clearing app repos${nocolor}"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log

echo -e "${color}copying directories${nocolor}"
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component.zip &>>/tmp/roboshop.log

echo -e "${color}changing directories${nocolor}"
cd /usr/share/nginx/html &>>/tmp/roboshop.log
unzip /tmp/$component.zip &>>/tmp/roboshop.log

echo -e "${color}finally installing${nocolor}"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log