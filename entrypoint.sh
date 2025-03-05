#!/bin/sh -l

svlint --version
printf 'SVLINT_CONFIG=%s\n' ${SVLINT_CONFIG}

files=$1
filelists=""
for filelist in $2
do
    filelists="$filelists -f $filelist"
done

args=""
if [ -n "$filelists" ]; then
    args="$filelists"
else
    args="$files"
fi

ruleset=$3
if [ -z "$3" ]
then
  svlint="svlint"
else
  svlint="svlint-$ruleset"
fi
printf 'svlint command: %s --github-actions %s\n' $svlint $args
$svlint --github-actions $args
