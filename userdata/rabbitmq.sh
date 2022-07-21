#!/bin/bash
sudo amazon-linux-extras install epel -y
sudo yum update -y
cd /tmp/
sudo yum install rabbitmq-server -y
sudo rabbitmq-plugins enable rabbitmq_management
sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server
sudo systemctl status rabbitmq-server
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator
sudo systemctl restart rabbitmq-server
