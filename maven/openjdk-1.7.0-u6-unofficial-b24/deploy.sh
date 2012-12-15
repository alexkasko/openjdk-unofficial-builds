#!/bin/bash
set -e

echo "jar"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24.jar


echo "sources"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-sources.jar \
    -Dclassifier=sources

echo "javadoc"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-javadoc.jar \
    -Dclassifier=javadoc

echo "linux-amd64-jre"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-linux-amd64-jre.zip \
    -Dclassifier=linux-amd64-jre \
    -Dpackaging=zip

echo "linux-amd64-jdk"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-linux-amd64-jdk.zip \
    -Dclassifier=linux-amd64-jdk \
    -Dpackaging=zip

echo "linux-i586-jre"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-linux-i586-jre.zip \
    -Dclassifier=linux-i586-jre \
    -Dpackaging=zip

echo "linux-i586-jdk"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-linux-i586-jdk.zip \
    -Dclassifier=linux-i586-jdk \
    -Dpackaging=zip

echo "macosx-x86_64-jre"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-macosx-x86_64-jre.zip \
    -Dclassifier=macosx-x86_64-jre \
    -Dpackaging=zip

echo "macosx-x86_64-jdk"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-macosx-x86_64-jdk.zip \
    -Dclassifier=macosx-x86_64-jdk \
    -Dpackaging=zip

echo "windows-amd64-jre"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-windows-amd64-jre.zip \
    -Dclassifier=windows-amd64-jre \
    -Dpackaging=zip

echo "windows-amd64-jdk"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-windows-amd64-jdk.zip \
    -Dclassifier=windows-amd64-jdk \
    -Dpackaging=zip

echo "windows-i586-jre"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-windows-i586-jre.zip \
    -Dclassifier=windows-i586-jre \
    -Dpackaging=zip

echo "windows-i586-jdk"
mvn gpg:sign-and-deploy-file \
    -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
    -DrepositoryId=sonatype-nexus-staging \
    -DpomFile=pom.xml \
    -Dfile=openjdk-1.7.0-u6-unofficial-b24-windows-i586-jdk.zip \
    -Dclassifier=windows-i586-jdk \
    -Dpackaging=zip
