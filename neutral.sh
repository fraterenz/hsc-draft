#!/bin/bash
#$ -pe smp 1
#$ -l h_vmem=32G
#$ -j y
#$ -l h_rt=01:0:0
#$ -t 1-500
#$ -o jobs/$JOB_NAME.$JOB_ID.$TASK_ID.out

PATH2HSC=/data/home/hfx923/hsc
# assume that the maj version nb is just one digit
VERSION=v$(sed -n '1,4 s/^version = "\([0-9]\.[0-9][0-9]*\.[0-9][0-9]*\)"/\1/p' ${PATH2HSC}/Cargo.toml)
PATH2SAVE=/data/scratch/hfx923/hsc-draft/${VERSION}/neutral

echo "run hsc seed ${SGE_TASK_ID} ${PATH2SAVE} $(date +"%T")"

${PATH2HSC}/target/release/hsc -c 100000 -y 91 -r 1 --tau 0.25 --mu-exp 4.4 --mu-division 1.2 --mu-background 13.4 --p-asymmetric 0 --mu0 1 --neutral --subsample 368 --snapshots 0 10 20 30 40 50 60 70 80 90 --seed ${SGE_TASK_ID} --sequential $PATH2SAVE/tau0dot25

# ${PATH2HSC}/target/release/hsc -c 100000 -y 91 -r 1 --tau 1 --mu-exp 4.4 --mu-division 1.2 --mu-background 11.6 --p-asymmetric 0 --mu0 1 --neutral --subsample 368 --snapshots 0 10 20 30 40 50 60 70 80 90 --seed ${SGE_TASK_ID} --sequential $PATH2SAVE/tau1

# ${PATH2HSC}/target/release/hsc -c 100000 -y 91 -r 1 --tau 4 --mu-exp 4.4 --mu-division 1.2 --mu-background 4.4 --p-asymmetric 0 --mu0 1 --neutral --subsample 368 --snapshots 0 10 20 30 40 50 60 70 80 90 --seed ${SGE_TASK_ID} --sequential $PATH2SAVE/tau4

echo "end hsc $(date +"%T")"

