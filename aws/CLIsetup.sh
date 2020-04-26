#!/bin/bash

echo Enter profile name:

read profileName

echo Creating profile with name $profileName

aws configure --profile $profileName

export AWS_PROFILE=$profileName

echo Creating ssh key
#ssh -key
ssh-keygen -t rsa -C 'mykey' -f ~/.ssh/mykey
aws ec2 delete-key-pair --key-name "mykey"
aws ec2 import-key-pair --key-name "mykey" --public-key-material file://~/.ssh/mykey.pub

echo Created ssh key mykey and importing public key in aws
