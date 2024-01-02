set -e

export JAVA_HOME=/usr/lib/jvm/java-1.8.0/

export PATH=$PATH:/usr/local/apache-maven-3.8.8/bin
export PATH=$PATH:/usr/local/pyenv/bin
export PATH=$PATH:/var/go/.pyenv/versions/2.7.18/bin
export PATH=$PATH:/usr/local/apache-ant-1.9.16/bin/

mvn clean install -DskipTests -Dbuild-rpm

mkdir -p output
RPMS=$(find . -type f | grep \.rpm$)

cp $RPMS output
tar -C output -czf ambari-metrics.tgz .
ls -ltra ambari-metrics.tgz

