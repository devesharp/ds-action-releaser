#!/bin/sh
set -e

npm install -g @devesharp/ds-releaser --unsafe-perm
ds-releaser -t ${INPUT_TYPE} --nonRoot

INPUT_BRANCH=${INPUT_BRANCH:-master}
INPUT_FORCE=${INPUT_FORCE:-false}
INPUT_TAGS=${INPUT_TAGS:-false}
INPUT_DIRECTORY=${INPUT_DIRECTORY:-'.'}
_FORCE_OPTION=''
REPOSITORY=${INPUT_REPOSITORY:-$GITHUB_REPOSITORY}

echo "Push to branch $INPUT_BRANCH";
[ -z "${INPUT_GITHUB_TOKEN}" ] && {
    echo 'Missing input "github_token: ${{ secrets.GITHUB_TOKEN }}".';
    exit 1;
};

if ${INPUT_FORCE}; then
    _FORCE_OPTION='--force'
fi

if ${INPUT_TAGS}; then
    _TAGS='--tags'
fi

cd ${INPUT_DIRECTORY}

remote_repo="https://devesharp[bot]@users.noreply.github.com:${INPUT_GITHUB_TOKEN}@github.com/${REPOSITORY}.git"

git config user.name "devesharp"
git config user.email "devesharp[bot]@users.noreply.github.com"
git config user.password ${INPUT_GITHUB_TOKEN}

git push "${remote_repo}" HEAD:${INPUT_BRANCH} --follow-tags $_FORCE_OPTION $_TAGS;