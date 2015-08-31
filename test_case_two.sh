#!/bin/bash
FULL_PATH=`pwd`

echo "Please specify all the remote sshfs clones, seperated by , without spaces: "

read SSHFS_SERVERS

echo "Now specify all the mount points in the same order as the servers, seperated by , without spaces: "

read MOUNT_POINTS

echo "declare EXT_SERVERS=(" > test_case_two_config_file

IFS=","
iterator=0
for v in $SSHFS_SERVERS do 
echo "\"$v\"" >> test_case_two_config_file
echo " \"${$MOUNT_POINTS[$iterator]}\" " >> test_case_two_config_file
done

echo ")" >> test_case_two_config_file

chmod 644 test_case_two_config_file

echo "Run git sync script with this command:
./automaticGitSyncing test_case_two_config_file NO_COMMENT_GIT_AUTOSYNC YES

"


