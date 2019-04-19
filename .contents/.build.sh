#!/usr/bin/env bash
set -ex
cd $(dirname $0)
content_root="public"
content_output_root="_book"
book sm --disableTitleFormatting --sortedBy 'num-' --root "$content_root"
gitbook build "$content_root" "$content_output_root"
set +x
# NOTE: '.'始まりのファイルは無視される
git_repo_root=$(git rev-parse --show-toplevel)
for name in $(ls "$git_repo_root"); do
	[[ $name == README.md ]] && continue
	echo git rm -r "$git_repo_root/$name"
done
set -x
cp "$content_root/README.md" "$git_repo_root"
cp -r _layouts "$git_repo_root"
cp -r "$content_output_root/"* "$git_repo_root"
git add "$git_repo_root"
