#!/bin/bash

requests={{ requests }}
connections={{ connections }}
threads={{ threads }}
target_url=https://{{ webserver_ip }}:{{ https_port }}
outputdir={{ httpress_path }}/output
datetime=`date +%Y%m%d-%H%M%S`
log_file=httpress-https-webserver-${datetime}.txt

mkdir -p ${outputdir}

httpress -n ${requests} -c ${connections} -t ${threads} -k ${target_url} | tee ${outputdir}/${log_file}
