#!/bin/sh -xe

target=${1:-out}

rm -rf $target
mkdir -p $target
cp index.* SourceSans3.ttf $target

sed -i "s/build_version_note/${VERSION_NOTE:0:11}/" $target/index.*
sed -i "s/build_emoji/${EMOJI:-🐄}/" $target/index.*
sed -i "s/build_hello/${HELLO:-Moo}/" $target/index.*
sed -i "s/build_name/${NAME:-cow}/" $target/index.*
