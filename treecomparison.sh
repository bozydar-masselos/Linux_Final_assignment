#!/usr/bin/bash
echo "Provide relevant path of input folder for the many trees as first argument"
echo "Provide relevant path with .treefile of the super tree as second argument"
echo "Provide relevant path for output .txt file as third argument"
#get_number_of_trees(){
folder=$1
nu_of_trees=$(ls ${folder} | grep ".treefile" | wc -l) 
which_trees=$(ls ${folder} | grep ".treefile" | sort -g)

large_alignment=$2 
newfile=$3

ls ${folder} | grep ".treefile" | sort -g |while read x; do
	echo ${folder}/${x}	
	./compare_trees.R ${large_alignment} ${folder}/${x} >> ${newfile}
done
