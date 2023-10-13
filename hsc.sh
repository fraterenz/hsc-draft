#!/bin/bash
#$ -pe smp 1
#$ -l h_vmem=8G
#$ -j y
#$ -l h_rt=01:0:0
#$ -t 1-10000
# #$ -tc 5000
#$ -o jobs/$JOB_NAME.$JOB_ID.$TASK_ID.out

PATH2HSC=/data/home/hfx923/hsc
# assume that the maj version nb is just one digit
VERSION=v$(sed -n '1,4 s/^version = "\([0-9]\.[0-9][0-9]*\.[0-9][0-9]*\)"/\1/p' ${PATH2HSC}/Cargo.toml)
PATH2SAVE=/data/scratch/hfx923/hsc-draft/${VERSION}

echo "run hsc seed ${SGE_TASK_ID} ${PATH2SAVE} $(date +"%T")"

${PATH2HSC}/target/release/hsc -c 200000 -y 100 -r 1 --b0 1 --mu-exp 4 --mu-division 1.2 --mu-background 11.6 --p-asymmetric 0 --subsample 368 --snapshots 20 --save-sfs-only --seed ${SGE_TASK_ID} --sequential $PATH2SAVE

echo "end hsc $(date +"%T")"

