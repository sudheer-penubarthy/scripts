#!/bin/bash

oldName=eswaribala
newName=sudheer-penubarthy

oldRepo=$1
#newRepo=$2

git clone --bare https://github.com/$oldName/$oldRepo.git
cd $oldRepo.git
git lfs fetch --all
echo 'now to create a repo in' $newName
curl -H "Authorization: token <Add git oauth token here>" https://api.github.com/user/repos -d "{\"name\":\"$oldRepo\"}"
git push --mirror https://github.com/$newName/$oldRepo.git
git lfs push --all https://github.com/$newName/$oldRepo.git
cd ..
rm -rf $oldRepo.git

