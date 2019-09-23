#!/bin/sh
working=${GITHUB_WORKSPACE:-build}
name="ghost-theme-$(jq --raw-output '.name' package.json)"
tag="v$(jq --raw-output '.version' package.json)"

target="${working}/$name.zip" 
mkdir -p "${working}"
if [ -e $target ]; then
    rm $target
fi
zip "$target" -r * -x \*${working}\* -x \*.git\* -x \*~
stat "$target"
# https://github.com/actions/toolkit/blob/2c6d31be8f9c8201d3cc9384133b933543b69075/docs/commands.md
echo ::set-output name=release_file::"${target}"
echo ::set-output name=release_name::"${name}"
echo ::set-output name=release_tag::"${tag}"

#CMD_STRING + this.command + ' ' + '$key=$val' + :: + $message
