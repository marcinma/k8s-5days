#!/bin/sh
while :
do

	spec=$(kubectl get deploycreators example-deploy-creator -o json | jq ".spec") 
	deployname=$(echo $spec | jq -r ".createDeploy")
	svcname=$(echo $spec | jq -r ".createSvc")
	imagename=$(echo $spec | jq -r ".imageName")
	echo $deployname
	echo $svcname
	echo $imagename
	echo "Checking $deployname"
	kubectl get deploy | grep -q "$deployname"
	if [ $? -eq 1 ]
	then
		kubectl create deployment $deployname --image=$imagename
		kubectl expose deployment $deployname --type=NodePort --name=$svcname --port=80
	else
		echo "$deployname found"
	fi
	sleep 30
done