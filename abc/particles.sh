#!/bin/bash
#$ -pe smp 1
#$ -l h_vmem=32G
#$ -j y
#$ -l h_rt=01:0:0
#$ -t 1-60000
#$ -o jobs/$JOB_NAME.$JOB_ID.$TASK_ID.out
if [ "$#" -ne 1 ]; then
    echo "Illegal number of arguments: must provide one parameters.txt file"
    exit 2
fi
PATH2PARAMS=$1
PATH2HSC=/data/home/hfx923/hsc
# assume that the maj version nb is just one digit
VERSION=v$(sed -n '1,4 s/^version = "\([0-9]\.[0-9][0-9]*\.[0-9][0-9]*\)"/\1/p' ${PATH2HSC}/Cargo.toml)
PATH2SAVE=/data/scratch/hfx923/hsc-draft/${VERSION}

echo "run hsc seed ${SGE_TASK_ID} ${PATH2SAVE} $(date +"%T")"
INPUT_ARGS=$(sed -n "${SGE_TASK_ID}p" ${PATH2PARAMS})

${PATH2HSC}/target/release/hsc $INPUT_ARGS --p-asymmetric 0 --subsample 368 --snapshots 0 29 38 48 63 76 77 81 --seed $SGE_TASK_ID --sequential $PATH2SAVE

echo "end hsc $(date +"%T")"

