#!/usr/bin/env sh
set -ex
cd $(dirname $0)
book sm
gitbook build
set +x
for name in $(ls ../); do
	[[ $name == README.md ]] && continue
	rm -r "../$name"
done
set -x
mv _book/* ../
rm -rf _book/
