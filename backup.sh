#!/bin/bash

usage() { echo "Usage: $0 [-h <hostname>] [-n <port>] [-u <user>] [-p <password>]" 1>&2; exit 1; }

while getopts ":h:n:u:p:" o; do
    case "${o}" in
        h)
            h=${OPTARG}
            ;;
	n)
	    n=${OPTARG}
	    ;;
	u)
	    u=${OPTARG}
	    ;;
        p)
            p=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${h}" ] || [ -z "${n}" ] || [ -z "${u}" ] || [ -z "${p}" ]; then
    usage
fi

mysqldump --host "${h}" --port "${n}" --user "${u}" --password "${p}" | lpr
