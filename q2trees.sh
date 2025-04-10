#!/usr/bin/bash

echo "Provide input dir as first arguement."
echo "Provide output dir as second arguement."

in_folder=$1
OUTPUT_DIR=$2
if [[ ! -d ${OUTPUT_DIR} ]]; then 
	mkdir ${OUTPUT_DIR}
fi

ls ./${in_folder} | while read x ; do
	echo $x
	FILEPATH=${in_folder}/${x}	
	NEWFILE=$(echo ${x})

	echo $FILEPATH
	echo $NEWFILE

	iqtree2 -s ${FILEPATH} -redo -pre ${OUTPUT_DIR}/${NEWFILE} -B 1000 -T AUTO || true
done
