# Advanced Kubernetes Features

A web application deployed using Kubernetes with a load balancer and a horizontal pod auto-scaler.

Created for CS3219 Software Engineering Principles and Patterns Own Time Own Target (OTOT) Task A3.

Note that this makes use of the Todo application created for OTOT Task B:
* Frontend: https://github.com/ianyong/todo-frontend
* Backend: https://github.com/ianyong/todo-backend

However, the images have been pre-built and pushed to GitHub's container registry for your convenience:
* Frontend: https://github.com/ianyong/simple-kubernetes-deployment/pkgs/container/todo-frontend
* Backend: https://github.com/ianyong/simple-kubernetes-deployment/pkgs/container/todo-backend

## Getting Started

1. Follow the instructions in the [Getting Started](https://github.com/ianyong/simple-kubernetes-deployment/tree/master/task-a2#getting-started) and [Running the Web Application](https://github.com/ianyong/simple-kubernetes-deployment/tree/master/task-a2#running-the-web-application) sections of Task A2.

## Setting up Ingress Controller

**The instructions below continue on from where Task A2 left off.**

1. If you are using minikube, enable the NGINX ingress controller.
   ```sh
   minikube addons enable ingress
   ```
1. Update the frontend `Deployment` with a new value for `BASE_SERVER_URL`.
   ```sh
   kubectl apply -f frontend-deployment-updated.yml
   ```
1. Update the frontend `Service` type from `LoadBalancer` to `ClusterIP`. This is because the ingress controller will act as the load balancer as well as the entrypoint for all external requests.
   ```sh
   kubectl apply -f frontend-service-updated.yml
   ```
1. Create the ingress controller.
   ```sh
   kubectl apply -f ingress.yml
   ```
1. To verify that the ingress controller is working, run:
   ```sh
   kubectl -n cs3219-otot-a describe ingress todo-ingress
   ```
   The output should look something like:
   <p align="center">
     <img src="assets/kubernetes_ingress.png">
   </p>
1. Note the value of `Address` returned in the command. (In the screenshot above, it is `192.168.49.2`.) Add a temporary mapping from the hostname `todo.cs3219.com` to the specified address in the hosts file which can be found at `/etc/hosts`.
