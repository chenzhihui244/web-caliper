#!/bin/bash

requests={{ requests }}
connections={{ connections }}
threads={{ threads }}
target_url=http://{{ webserver_ip }}:{{ http_port }}
outputdir={{ httpress_path }}/output
datetime=`date +%Y%m%d-%H%M%S`
log_file=httpress-webserver-${datetime}.txt

mkdir -p ${outputdir}

httpress -n ${requests} -c ${connections} -t ${threads} ${target_url} | tee ${outputdir}/${log_file}
