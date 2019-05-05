#!/bin/sh

pem_path=$1
certificate=$2
cert_path=/etc/nginx

[ -f ${cert_path}/${certificate}.crt ] && exit 0

mkdir -p ${pem_path}/etc/pki/CA/private
cd ${pem_path}/etc/pki/CA/

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

cd ${cert_path}

openssl genrsa -out ${certificate}.key 2048
openssl req -new -key ${certificate}.key -out ${certificate}.csr <<EOF
CN
Guangdong
Shenzhen
Huawei
Huawei
Huawei
chenzhihui4@huawei.com


EOF

openssl x509 -req -in ${certificate}.csr -CA ${pem_path}/etc/pki/CA/cacert.pem -CAkey ${pem_path}/etc/pki/CA/private/cakey.pem -CAcreateserial -out ${certificate}.crt
