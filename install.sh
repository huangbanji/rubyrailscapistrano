#!/bin/bash

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo mv sources.list /etc/apt


sudo apt-get update


sudo apt-get -y  install ruby git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev openssl python-software-properties libffi-dev libcurl3-dev


#如何快速正确的安装 Ruby, Rails 运行环境

#步骤0 － 安装系统需要的包

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"




#RVM 是干什么的这里就不解释了，后面你将会慢慢搞明白。

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

curl -sSL https://get.rvm.io | bash -s stable

# 如果上面的连接失败，可以尝试:
# curl -L https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable

#期间可能会问你 sudo 管理员密码，以及自动通过 Homebrew 安装依赖包，等待一段时间后就可以成功安装好 RVM。

#然后，载入 RVM 环境（新开 Termal 就不用这么做了，会自动重新载入的）

source ~/.rvm/scripts/rvm
#修改 RVM 下载 Ruby 的源，到 Ruby China 的镜像:

echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db
#检查一下是否安装正确

rvm -v

#步骤2 － 用 RVM 安装 Ruby 环境

 rvm requirements


 rvm install 2.3.0



#这个时候你可以测试是否正确


gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/


sudo dpkg --configure -a

#安装 Bundler

 gem install bundler

#步骤4 － 安装 Rails 环境

#上面 3 个步骤过后，Ruby 环境就安装好了，接下来安装 Rails

 gem install rails

#然后测试安装是否正确


cd /opt/
sudo mkdir nginx
sudo chown rails:rails nginx


sudo apt-get install ruby-dev -y

gem install passenger
passenger-install-nginx-module

sudo mkdir -p /opt/nginx/conf/sites-enabled 
sudo mv /opt/nginx/conf/nginx.conf /opt/nginx/conf/nginx.conf.bak
sudo mv nginx.conf /opt/nginx/conf/
sudo mv nginx.conf.defaule /opt/nginx/conf/sites-enabled 
sudo mv nginx.conf.ssl /opt/nginx/conf/sites-enabled 

#第二部分：安装capistrano

#安装
gem install capistrano
cap --version
gem install capistrano-ext

