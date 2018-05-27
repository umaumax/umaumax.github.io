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
cp _book/* ../
git add ../
