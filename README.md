
```
vagrant up
vagrant ssh
#cp -a /vagrant/.m2/ .
#git clone https://github.com/apache/spark.git -b branch-1.5
#git clone https://github.com/apache/spark.git -b v1.5.0
git clone https://github.com/apache/spark.git
cd spark

git checkout v1.5.3
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh --dist dist-1.5.3 -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.1 -DskipTests -Phive -Phive-thriftserver
git checkout -- make-distribution.sh

git checkout v1.6.0
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh --dist dist-1.6.0 -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.1 -DskipTests -Phive -Phive-thriftserver
git checkout -- make-distribution.sh

```
https://archive.clairvoyantsoft.com/spark/parcels/{latest_supported}/
https://archive.clairvoyantsoft.com/spark/parcels/latest/
https://archive.cloudera.com/spark/parcels/latest/
https://github.com/cloudera/cm_csds/blob/master/SPARK/src/descriptor/service.sdl
