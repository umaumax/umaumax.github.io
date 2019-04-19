#!/usr/bin/env bash
set -ex
cd $(dirname $0)
book sm --disableTitleFormatting --sortedBy 'num-' --root public
pushd public
gitbook build
popd
set +x
# NOTE: '.'始まりのファイルは無視される
for name in $(ls ../); do
	[[ $name == README.md ]] && continue
	git rm -r "../$name"
done
set -x
cp README.md ../
cp -r _layouts ../
cp -r _book/* ../
git add ../
