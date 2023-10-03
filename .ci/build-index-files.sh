#!/bin/sh -xe

target=${1:-out}
name=${NAME:-cow}

rm -rf $target
mkdir -p $target
cp index.html index.txt SourceSans3.ttf $target

sed -i "s/build_version_note/${VERSION_NOTE:0:11}/" $target/index.*
sed -i "s/build_emoji/${EMOJI:-🐮}/" $target/index.*
sed -i "s/build_hello/${HELLO:-Moo}/" $target/index.*
sed -i "s/build_name/$name/" $target/index.*

tar -czvf animals-$name.tar.gz -C $target .
