
```
vagrant up
vagrant ssh
#cp -a /vagrant/.m2/ .
#git clone https://github.com/cloudera/spark.git -b cdh5.5.2-release
git clone https://github.com/cloudera/spark.git
cd spark

git checkout cdh5.5.2-release
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh --dist dist-c-1.5.0-cdh5.5.2 -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.2 -DskipTests -Phive -Phive-thriftserver
git checkout -- make-distribution.sh

git checkout cdh5.5.2-release
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh --dist dist-c-1.5.0-cdh5.5.2-nodeps -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.2 -DskipTests -Phive -Phive-thriftserver \
-Pflume-provided \
-Phadoop-provided \
-Phbase-provided \
-Phive-provided \
-Pparquet-provided
git checkout -- make-distribution.sh



git checkout cdh5.5.2-release
patch -p0 </vagrant/make-distribution.sh.patch
patch -p0 </vagrant/pom.xml-joda.patch
./make-distribution.sh --dist dist-c-1.5.0-cdh5.5.2-nodeps-joda -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.2 -DskipTests -Phive -Phive-thriftserver \
-Pflume-provided \
-Phadoop-provided \
-Phbase-provided \
-Phive-provided \
-Pparquet-provided
git checkout -- make-distribution.sh pom.xml


# test for sparkR
git checkout cdh5.5.2-release
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh --dist dist-c-1.5.0-cdh5.5.2-nodeps-R -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.2 -DskipTests -Phive -Phive-thriftserver -Psparkr \
-Pflume-provided \
-Phadoop-provided \
-Phbase-provided \
-Phive-provided \
-Pparquet-provided
git checkout -- make-distribution.sh

git fetch origin
git checkout cdh5.7.0-release
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh --dist dist-c-1.6.0-cdh5.7.0-nodeps -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.7.0 -DskipTests -Phive -Phive-thriftserver \
-Pflume-provided \
-Phadoop-provided \
-Phbase-provided \
-Phive-provided \
-Pparquet-provided
git checkout -- make-distribution.sh


```








```
vagrant up
vagrant ssh
#cp -a /vagrant/.m2/ .
#git clone https://github.com/apache/spark.git -b branch-1.5
#git clone https://github.com/apache/spark.git -b v1.5.0
git clone https://github.com/apache/spark.git
cd spark

git checkout v1.5.0
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh --dist dist-1.5.0-cdh5.5.2 -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.2 -DskipTests -Phive -Phive-thriftserver

#./make-distribution.sh --dist dist-1.5.0-cdh5.5.3 -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.3 -DskipTests -Phive -Phive-thriftserver
git checkout -- make-distribution.sh

git checkout v1.5.2
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh --dist dist-1.5.2-cdh5.5.2 -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.2 -DskipTests -Phive -Phive-thriftserver
git checkout -- make-distribution.sh

git checkout v1.6.0
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh --dist dist-1.6.0-cdh5.5.2 -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.2 -DskipTests -Phive -Phive-thriftserver
git checkout -- make-distribution.sh


git checkout branch-1.5
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh --dist dist-branch1.5-cdh5.5.2 -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.2 -DskipTests -Phive -Phive-thriftserver
git checkout -- make-distribution.sh

git checkout branch-1.5
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh --dist dist-branch1.5-cdh5.5.2-nodeps -Phadoop-2.6 -Pyarn -Dhadoop.version=2.6.0-cdh5.5.2 -DskipTests -Phive -Phive-thriftserver \
-Pflume-provided \
-Phadoop-provided \
-Phbase-provided \
-Phive-provided \
-Pparquet-provided
git checkout -- make-distribution.sh

```
https://archive.clairvoyantsoft.com/spark/parcels/{latest_supported}/
https://archive.clairvoyantsoft.com/spark/parcels/latest/
https://archive.cloudera.com/spark/parcels/latest/
https://github.com/cloudera/cm_csds/blob/master/SPARK/src/descriptor/service.sdl
