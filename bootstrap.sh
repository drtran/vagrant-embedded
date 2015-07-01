#!/usr/bin/env bash

# ----------------------------------------
# configuring development environment for Java/C++
# ----------------------------------------
# sudo cp /vagrant/yum.conf /etc/.;
# sudo cp /vagrant/wgetrc /etc/.;

# Installing tools ...
if ! [ -f /usr/bin/unzip ]; then
  echo "Installing tools ...";
  sudo yum install -y unzip;
  sudo yum -y groups install "GNOME Desktop" 
else 
  echo "Skipping tools ...";
fi


## Installing JDK 8 from ORACLE
if ! [ -f /usr/bin/java ]; then
  echo "Installing JDK 1.8 ...";
  cd /opt;
  # sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz";
  cp /vagrant/bin/jdk-8u45-linux-x64.tar.gz .
  sudo tar xvf jdk-8u45-linux-x64.tar.gz;
  sudo chown -R root: jdk1.8.0_45;
  sudo alternatives --install /usr/bin/java java /opt/jdk1.8.0_45/bin/java 1;
  sudo alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_45/bin/javac 1;
  sudo alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_45/bin/jar 1;
  sudo rm /opt/jdk-8u45-linux-x64.tar.gz;
else
  echo "Skipping JDK 1.8 ...";
fi

## Install Tomee 1.7.2:
if ! [ -f /opt/tomee172/bin/catalina.sh ]; then
  echo "Installing TOMEE 1.7.2 ...";
  cd /tmp;
  cp /vagrant/bin/apache-tomee-1.7.2-plume.tar.gz .
  sudo tar xzf apache-tomee-1.7.2-plume.tar.gz;
  sudo mv apache-tomee-plume-1.7.2 /opt/tomee172;
  rm apache-tomee-1.7.2-plume.tar.gz
else
  echo "Skipping Tomee 7";
fi 

echo "Starting up TOMEE 7 Server ...";
sudo /opt/tomee172/bin/catalina.sh start;
sudo java -cp /opt/tomee172/lib/catalina.jar org.apache.catalina.util.ServerInfo

if ! [ -f /opt/eclipse ]; then
  echo "Installing C++ tools & Eclipse ..."
  sudo yum install -y gcc-c++.x86_64;
  cd /tmp;
  cp /vagrant/bin/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz .
  sudo tar -xvzf eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz -C /opt;
  sudo chmod -R +r /opt/eclipse;
  sudo touch /usr/bin/eclipse;
  sudo chmod 755 /usr/bin/eclipse;
else
  echo "Skip C++ tools ..."
fi 


