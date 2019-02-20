sudo yum install -y epel-release
sudo yum install -y java-1.8.0-openjdk-devel
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install -y jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkins
systemctl status jenkins
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload



sudo cat /var/lib/jenkins/secrets/initialAdminPassword

#use above password at URL to create users;
#http://hostname:8080
