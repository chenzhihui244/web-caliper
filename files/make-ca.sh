#!/bin/sh

installdir=$1

mkdir -p ${installdir}/etc/pki/CA/private
cd ${installdir}/etc/pki/CA/

openssl genrsa -out private/cakey.pem 2048
openssl req -new -x509 -key private/cakey.pem -out cacert.pem <<EOF
CN
Guangdong
Shenzhen
Huawei
Huawei
Huawei
chenzhihui4@huawei.com
EOF

cd ${installdir}/conf

openssl genrsa -out nginx.key 2048
openssl req -new -key nginx.key -out nginx.csr <<EOF
CN
Guangdong
Shenzhen
Huawei
Huawei
Huawei
chenzhihui4@huawei.com


EOF

openssl x509 -req -in nginx.csr -CA ${installdir}/etc/pki/CA/cacert.pem -CAkey ${installdir}/etc/pki/CA/private/cakey.pem -CAcreateserial -out nginx.crt
