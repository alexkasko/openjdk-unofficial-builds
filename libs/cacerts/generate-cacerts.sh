#!/bin/bash
# source: https://github.com/hgomez/obuildfactory/blob/master/openjdk7/linux/build.sh
set -e

curl -L http://curl.haxx.se/ca/cacert.pem -o cacert.pem
cat cacert.pem | awk '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/{ print $0; }' > cacert-clean.pem
rm -f cacerts cert_*
# split  -p "-----BEGIN CERTIFICATE-----" cacert-clean.pem cert_
csplit -k -f cert_ cacert-clean.pem "/-----BEGIN CERTIFICATE-----/" {*}

for CERT_FILE in cert_*; do
    ALIAS=$(basename ${CERT_FILE})
    echo yes | keytool -import -alias ${ALIAS} -keystore cacerts -storepass 'changeit' -file ${CERT_FILE} || :
    rm -f $CERT_FILE
done

