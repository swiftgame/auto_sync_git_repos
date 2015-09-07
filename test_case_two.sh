#!/bin/bash
FULL_PATH=`pwd`

echo "Please specify all the remote sshfs clones, seperated by , without spaces: "

read SSHFS_SERVERS

echo "Now specify all the mount points in the same order as the servers, seperated by , without spaces: "

read MOUNT_POINTS

echo "declare EXT_SERVERS=(" > test_case_two_config_file

sshfsservers=$(echo $SSHFS_SERVERS | tr "," "\n")
mountpoints=$(echo $MOUNT_POINTS | tr "," "\n")
iterator="0"

for x in $sshfsservers
do
	echo "\"$x\"" >> test_case_two_config_file
echo "\"" >> test_case_two_config_file
	echo ${mountpoints[$iterator]} >> test_case_two_config_file
echo "\"" >> test_case_two_config_file
((iterator+=1))
done


echo ")" >> test_case_two_config_file

chmod 644 test_case_two_config_file

echo "Run git sync script with this command:
./automaticGitSyncing test_case_two_config_file NO_COMMENT_GIT_AUTOSYNC YES

"


