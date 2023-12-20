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
PATH2SAVE=/data/scratch/hfx923/hsc-draft/${VERSION}/variants

echo "run hsc seed ${SGE_TASK_ID} ${PATH2SAVE} $(date +"%T")"

${PATH2HSC}/target/release/hsc -c 100000 -y 91 -r 1 --tau 0.5 --mu0 4 --mu-exp 4 --mu-division 1.2 --mu-background 11.6 --p-asymmetric 0 --mean-std 0.09 0.04 --subsamples 368 --snapshots 0 10 20 30 40 50 60 70 80 90 --seed ${SGE_TASK_ID} --sequential $PATH2SAVE/tau0dot5

# ${PATH2HSC}/target/release/hsc -c 100000 -y 91 -r 1 --tau 1 --mu0 4 --mu-exp 4 --mu-division 1.2 --mu-background 11.6 --p-asymmetric 0 --mean-std 0.09 0.04 --subsamples 368 --snapshots 0 10 20 30 40 50 60 70 80 90 --seed ${SGE_TASK_ID} --sequential $PATH2SAVE/tau1

# ${PATH2HSC}/target/release/hsc -c 100000 -y 91 -r 1 --tau 2 --mu0 4 --mu-exp 4 --mu-division 1.2 --mu-background 11.6 --p-asymmetric 0 --mean-std 0.09 0.04 --subsamples 368 --snapshots 0 10 20 30 40 50 60 70 80 90 --seed ${SGE_TASK_ID} --sequential $PATH2SAVE/tau2

# ${PATH2HSC}/target/release/hsc -c 100000 -y 91 -r 1 --tau 5 --mu0 4 --mu-exp 4 --mu-division 1.2 --mu-background 11.6 --p-asymmetric 0 --mean-std 0.09 0.04 --subsamples 368 --snapshots 0 10 20 30 40 50 60 70 80 90 --seed ${SGE_TASK_ID} --sequential $PATH2SAVE/tau5

echo "end hsc $(date +"%T")"

