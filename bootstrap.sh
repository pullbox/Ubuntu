#!/user/bin/env bash

sudo apt-get update
sudo apt-get upgrade

if [ -e /vagrant/share/jdk-8u161-linux-x64.tar.gz ]
then
  echo "JDK found!"
  JDK="/vagrant/share/jdk-8u161-linux-x64.tar.gz"
else
  wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz
  JDK="jdk-8u161-linux-x64.tar.gz"
  echo "JDK downloaded!"
fi

echo $JDK

# http://download.oracle.com/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jdk-9.0.4_linux-x64_bin.tar.gz
# http://download.oracle.com/otn-pub/java/jdk/10+46/76eac37278c24557a3c4199677f19b62/jdk-10_linux-x64_bin.tar.gz
mkdir /opt/java
tar -zxf jdk-8u161-linux-x64.tar.gz -C /opt/java

JAVA_HOME="/opt/java/jdk1.8.0_161/"
export Path=$Path:JAVA_HOME

sudo apt-get install -y apache2
wget -O - -o /dev/null http://get.takipi.com | sudo bash /dev/stdin -i --sk=S34819#pJnWhbCjcdoGwYLq#8pXHxLFXPky3cf/sZuo96kZwFnaZ9Mw+86jPIV83d1Y=#5f12

if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
