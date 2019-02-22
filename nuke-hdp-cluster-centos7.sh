#!/bin/bash

#script to completely uninstall/remove Hortonworks hadoop cluster installation from a CentOS 7 / RHEL 7 server. 
##Stop cluster or host services in ambari first then the script
#will stop ambari and agent services on the node you run it from, yum remove the installation packages and wipe out left over files...
#if you do not use the embedded database you will have to drop the tables or remove the db service on your own .

#if you just want to reconfigure the cluster you should first try just running ambari-server stop then ambari-server reset. This script is usually good for when this doesn't work and ambari won't install the cluster after reset.






ambari-server status
ambari-server stop
ambari-agent stop






yum remove -y ambari*
yum remove -y knox* ranger* kafka* storm\* hive\*  hbase\* phoenix\* accumulo\* tez\* zookeeper\*  oozie\*  pig\* hadooplzo\* knox\* hadoop\* 

#yum remove extjs-2.2-1 mysql-connector-java-5.0.8-1\*


yum -y remove `yum list installed | grep -i hadoop | cut -d. -f1 | sed -e :a -e ‘$!N; s/\n/ /; ta’`




# yum -y remove `yum list installed | grep -i hadoop | cut -d. -f1 | sed -e :a -e ‘$!N; s/\n/ /; ta’`
# yum -y remove ambari*
# yum -y remove `yum list installed | grep -w ‘HDP’ | cut -d. -f1 | grep -v “^[ ]” | sed -e :a -e ‘$!N; s/\n/ /; ta’`
# yum -y remove `yum list installed | egrep -w ‘hcatalog|hive|hbase|zookeeper|oozie|pig|sqoop|snappy|hadoop-lzo|knox|hadoop|hue’ | cut -d. -f1 | grep -v “^[ ]” | sed -e :a -e ‘$!N; s/\n/ /; ta’`

rm -rf /hadoop/nn /hadoop/data* 

rm -rf /hadoop/*


ps -ef | grep -e ambari -e hdp -e hcatalog -e hive -e hbase -e zookeeper -e oozie -e pig -e sqoop -e snappy -e hadoop-lzo -e knox -e hadoop -e hue


echo "kill -9 anything left running for hadoop services"

echo ""

echo "Remove third party database or drop tables if needed (when not using embedded).
