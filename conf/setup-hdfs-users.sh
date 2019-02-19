hadoop fs -ls /
hadoop fs -chmod 777 /tmp
hadoop fs -ls /
hadoop fs -ls /user

hadoop fs -mkdir /user/hdfs
hadoop fs -chown hdfs:supergroup /user/hdfs

hadoop fs -mkdir /user/sasdemo
hadoop fs -chown sasdemo:sasdemo /user/sasdemo
hadoop fs -mkdir /user/sas;hadoop fs -chown sas:sas /user/sas
hadoop fs -mkdir /user/sassrv;hadoop fs -chown sassrv:sassrv /user/sassrv
hadoop fs -mkdir /user/lasradm;hadoop fs -chown lasradm:lasradm /user/lasradm
hadoop fs -mkdir /user/cas;hadoop fs -chown cas:sas /user/cas
