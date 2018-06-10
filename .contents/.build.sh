#!/usr/bin/env sh
set -ex
cd $(dirname $0)
book sm
gitbook build
set +x
# NOTE: '.'始まりのファイルは無視される
for name in $(ls ../); do
	[[ $name == README.md ]] && continue
	rm -r "../$name"
done
set -x
cp -r _book/* ../
git add ../
