#!/usr/bin/env sh

# V5

exit_code=0

# get the staged files
s_files=$(git diff --name-only --cached --diff-filter=d)

# if a staged file contains the keyword, get it out of the staged list
for s_file in ${s_files};do
    if git grep -q -E -F TODO :$s_file;then
        echo "WARNING: ${s_file} contains the keyword nocheckin"
        exit_code=1
    fi
done

exit $exit_code
