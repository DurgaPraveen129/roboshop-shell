echo -e "${color}installing nginx${nocolor}"
dnf install nginx -y &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl start nginx &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
rm -rf /usr/share/nginx/html/ &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
cd /usr/share/nginx/html &>>/tmp/roboshop.log
unzip /tmp/frontend.zip &>>/tmp/roboshop.log

echo -e "${color}installing nginx${nocolor}"
systemctl restart nginx &>>/tmp/roboshop.log