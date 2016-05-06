#! /bin/bash -e

echo "Updating apt-get"
apt-get update

echo "Installing prerequisites"
apt-get install -y supervisor vim less net-tools inetutils-ping curl git telnet nmap socat dnsutils netcat software-properties-common maven

echo "Adding WebUpd8 repository"
add-apt-repository -y ppa:webupd8team/java
apt-get update

echo "Installing JDK 7"
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java7-installer oracle-java7-set-default

echo "Downloading Zookeeper"
curl http://mirrors.ibiblio.org/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz -o zookeeper-3.4.6.tar.gz
tar -xzf zookeeper-3.4.6.tar.gz
rm -rf zookeeper
mv zookeeper-3.4.6 zookeeper
cp zookeeper/conf/zoo_sample.cfg zookeeper/conf/zoo.cfg

echo "Downloading Druid"
curl -O http://static.druid.io/artifacts/releases/druid-0.9.0-bin.tar.gz
tar -xzf druid-0.9.0-bin.tar.gz
rm -rf druid
mv druid-0.9.0 druid
chown -R vagrant:vagrant druid
# cd druid
# bin/init
# cd /home/vagrant

echo "Starting Services"
mkdir -p /var/log/{zookeeper,druid} && \
chown -R vagrant:vagrant /var/log/{zookeeper,druid}
service supervisor restart
cp /vagrant/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
supervisorctl reload
