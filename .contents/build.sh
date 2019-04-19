#!/usr/bin/env bash
set -ex
cd $(dirname $0)
content_root="public"
content_output_root="_book"
pushd "$content_root"
# NOTE: don't use --root option
book sm
popd
# NOTE: you must run gitbook install at "$content_root" directory not current dir
gitbook build "$content_root" "$content_output_root"
set +x
# NOTE: '.'始まりのファイルは無視される
git_repo_root=$(git rev-parse --show-toplevel)
for name in $(ls "$git_repo_root"); do
	[[ $name == README.md ]] && continue
	rm -r "$git_repo_root/$name"
done
set -x
cp "$content_root/README.md" "$git_repo_root"
cp -r _layouts "$git_repo_root"
cp -r "$content_output_root/"* "$git_repo_root"
git add "$git_repo_root"
