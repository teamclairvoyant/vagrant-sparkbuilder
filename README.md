# Build Cloudera Spark with Various Extras

A Vagrant setup on a CentOS 7 machine to allow for the quick build/rebuild of Cloudera's [Apache Spark](https://spark.apache.org/) from https://github.com/cloudera/spark .

## Requirements

Make sure that you have the following softwares installed:

- [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant 1.3+](http://www.vagrantup.com/downloads.html)
- [Git](http://git-scm.com/downloads)
- [vagrant-librarian-puppet](https://github.com/voxpupuli/vagrant-librarian-puppet)
- [vagrant-puppet-install](https://github.com/petems/vagrant-puppet-install) (optional)

## Get Started

Clone this git repository to your local workstation:
```
git clone https://github.com/teamclairvoyant/vagrant-sparkbuilder.git
cd vagrant-sparkbuilder
```

Start the Vagrant instance:
```
vagrant up
vagrant ssh
```

Inside the instance, change to the spark directory:
```
cd spark
```

Checkout the branch/tag that corresponds to the target CDH version and build Spark with the Hive Thriftserver while excluding dependencies that are shipped as part of CDH:
```
git fetch origin
git checkout cdh5.7.0-release
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh -DskipTests \
  --dist dist-cdh5.7.0-nodeps \
  -Dhadoop.version=2.6.0-cdh5.7.0 \
  -Phadoop-2.6 \
  -Pyarn \
  -Phive -Phive-thriftserver \
  -Pflume-provided \
  -Phadoop-provided \
  -Phbase-provided \
  -Phive-provided \
  -Pparquet-provided
git checkout -- make-distribution.sh
```

Copy the resulting distribution back to your local workstation:
```
rsync -av dist-* /vagrant/
```

## More Examples

Checkout the branch/tag that corresponds to the target CDH version and build Spark with the Hive Thriftserver:
```
git checkout cdh5.5.2-release
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh -DskipTests \
  --dist dist-cdh5.5.2 \
  -Dhadoop.version=2.6.0-cdh5.5.2 \
  -Phadoop-2.6 \
  -Pyarn \
  -Phive -Phive-thriftserver
git checkout -- make-distribution.sh
```

Checkout the branch/tag that corresponds to the target CDH version and build Spark with the Hive Thriftserver while excluding dependencies that are shipped as part of CDH:
```
git checkout cdh5.5.2-release
patch -p0 </vagrant/make-distribution.sh.patch
./make-distribution.sh -DskipTests \
  --dist dist-cdh5.5.2-nodeps \
  -Dhadoop.version=2.6.0-cdh5.5.2 \
  -Phadoop-2.6 \
  -Pyarn \
  -Phive -Phive-thriftserver \
  -Pflume-provided \
  -Phadoop-provided \
  -Phbase-provided \
  -Phive-provided \
  -Pparquet-provided
git checkout -- make-distribution.sh
```

Checkout the branch/tag that corresponds to the target CDH version and build Spark with the SparkR bits while excluding dependencies that are shipped as part of CDH:
```
sudo yum -y -e1 -d1 install epel-release
sudo yum -y -e1 -d1 install R
git checkout cdh5.7.0-release
patch -p0 </vagrant/make-distribution.sh.patch
patch -p0 </vagrant/sparkR.patch
./make-distribution.sh -DskipTests \
  --dist dist-cdh5.7.0-nodeps-R \
  -Dhadoop.version=2.6.0-cdh5.7.0 \
  -Phadoop-2.6 \
  -Pyarn \
  -Psparkr \
  -Pflume-provided \
  -Phadoop-provided \
  -Phbase-provided \
  -Phive-provided \
  -Pparquet-provided
git checkout -- make-distribution.sh
```

## License
Copyright (C) 2016 [Clairvoyant, LLC.](http://clairvoyantsoft.com/)

Licensed under the Apache License, Version 2.0.
