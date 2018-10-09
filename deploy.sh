#!/usr/bin/env bash

killTomcat()
{
    pid=`ps -ef|grep tomcat|grep java|awk '{print $2}'`
    echo "tomcat pid :$pid"
    if [ "$pid" = "" ]
    then
        echo "no tomcat pid alive"
    else
        kill -9 $pid
    fi
}

cd $PROJECT_PATH/Guns
mvn clean package -Dmaven.test.skip=true

killTomcat

rm -rf $TOMCAT_PATH/webapps/ROOT
rm -f $TOMCAT_PATH/webapps/ROOT.war
rm -f $TOMCAT_PATH/webapps/guns-admin-1.0.0.war

cp $PROJECT_PATH/Guns/guns-admin/target/guns-admin-1.0.0.war $TOMCAT_PATH/webapps/

cd $TOMCAT_PATH/webapps/
mv guns-admin-1.0.0.war ROOT.war

cd $TOMCAT_PATH/
sh bin/startup.sh