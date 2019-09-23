#!/bin/sh
working=${GITHUB_WORKSPACE:-build}
name="ghost-theme-$(jq --raw-output '.name' package.json)"
tag="v$(jq --raw-output '.version' package.json)"

target="${working}/$name.zip" 
mkdir -p "${working}"
if [ -e $target ]; then
    rm $target
fi
zip $target -r * -x \*${working}\* -x \*.git\* -x \*~
echo ::set-output name=file::"${target}"
echo ::set-output name=name::"${name}"
echo ::set-output name=tag::"${tag}"

