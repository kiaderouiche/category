#!/bin/bash
#
usage(){
    echo $"Usage: $0 [-v <15|75>] [-p <chaine de string>]"
    1>&2 exit 1;
}

while getopts ":v:g:" option; do
    case "${option}" in
    v)
        v=${OPTARG} 
        ((v== 15 || v == 75)) || usage
        ;;
    g)
    g=${OPTARG}
    ;;
    *)
    usage;;
esac
done
shift $((OPTIND-1))
if [ -z "${v}" ] || [ -z "${g}" ] ; then
    usage
fi
echo "v=${v}"
echo "g=${g}"