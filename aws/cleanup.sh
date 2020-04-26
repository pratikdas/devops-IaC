#!/bin/bash

echo Cleaning ssh keys
aws ec2 delete-key-pair --key-name "mykey"
rm -rf ~/.ssh/mykey*

echo Cleaning profiles
unset AWS_PROFILE
rm -rf ~/.aws

