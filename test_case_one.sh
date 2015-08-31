#!/bin/bash
FULL_PATH=`pwd`

mkdir gitTestSetup
cd gitTestSetup
git init --bare gitBareRepoMain
mkdir clones
cd clones

##clone1
mkdir clone1
cd clone1
git clone $FULL_PATH/gitBareRepoMain
cd gitBareRepoMain
echo "Test File 1 from clone1" > test_file_one_clone1
CLONE1_LOCATION=`pwd`

cd ../

#clone2
mkdir clone2
cd clone2
git clone $FULL_PATH/gitBareRepoMain
cd gitBareRepoMain
echo "Test File 1 from clone2" > test_file_one_clone2
CLONE2_LOCATION=`pwd`

cd ../../../../

echo "declare CLONE_DIRS=(\"$CLONE1_LOCATION\" \"$CLONE2_LOCATION\" )" > test_case_one_config_file

echo "Run git sync script with this command:
./auto_sync_git test_case_one_config_file NO_COMMENT_GIT_AUTOSYNC NO

"


