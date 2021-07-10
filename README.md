# ITI_Project
1) Forwarding port in pod to my localhost command
   $kubectl port-forward pods/jenkins-deployment-54fc7c469f-2d57h --namespace=iti-namespace 8000:8080

2) Entering the exec shell in a pod command
   $kubectl exec --stdin --tty jenkins-deployment-54fc7c469f-2d57h --namespace=iti-namespace -- /bin/bash

3) Creating Docker Image
   $docker build -t docker-jenkins .

4) Tagging Image by my DockerHub Account Name   
   $docker tag docker-jenkins 139646/docker-jenkins

5) Login to DockerHub
   $docker login   

6) Pushing Image to DockerHub
   $docker push 139646/docker-jenkins

7) Entering a pod in bash shell
   $kubectl exec -it jenkins-deployment-7498c97fd4-h4w2b --namespace=iti-namespace -- bash
