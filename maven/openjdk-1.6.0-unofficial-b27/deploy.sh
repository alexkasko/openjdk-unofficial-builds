#!/bin/bash
set -e

echo "jar"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.6.0-unofficial-b27.jar


echo "sources"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.6.0-unofficial-b27-sources.jar \
    -Dclassifier=sources

echo "javadoc"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.6.0-unofficial-b27-javadoc.jar \
    -Dclassifier=javadoc

echo "linux-amd64-jre"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.6.0-unofficial-b27-linux-amd64-jre.zip \
    -Dclassifier=linux-amd64-jre \
    -Dpackaging=zip

echo "linux-amd64-jdk"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.6.0-unofficial-b27-linux-amd64-jdk.zip \
    -Dclassifier=linux-amd64-jdk \
    -Dpackaging=zip

echo "linux-i586-jre"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.6.0-unofficial-b27-linux-i586-jre.zip \
    -Dclassifier=linux-i586-jre \
    -Dpackaging=zip

echo "linux-i586-jdk"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.6.0-unofficial-b27-linux-i586-jdk.zip \
    -Dclassifier=linux-i586-jdk \
    -Dpackaging=zip

echo "windows-amd64-jre"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.6.0-unofficial-b27-windows-amd64-jre.zip \
    -Dclassifier=windows-amd64-jre \
    -Dpackaging=zip

echo "windows-amd64-jdk"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.6.0-unofficial-b27-windows-amd64-jdk.zip \
    -Dclassifier=windows-amd64-jdk \
    -Dpackaging=zip

echo "windows-i586-jre"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.6.0-unofficial-b27-windows-i586-jre.zip \
    -Dclassifier=windows-i586-jre \
    -Dpackaging=zip

echo "windows-i586-jdk"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.6.0-unofficial-b27-windows-i586-jdk.zip \
    -Dclassifier=windows-i586-jdk \
    -Dpackaging=zip
