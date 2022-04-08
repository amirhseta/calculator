![snapp-task](https://user-images.githubusercontent.com/70238195/162207153-8c56c5bb-9aa2-46fe-8e99-1b687b4cad3b.jpg)



`I also use ingress for expossing service externally.`
`althought I could use loadbalancer and nodeport service to expose my application to external clients,have a lot of cost for us.`
`Because when we use loadbalancer servcie , for example in cloud providers , a load balancer is created for every loadbalancer servcice and each loadbalancer service requires own loadbalaner with its own public IP address. Whereass  in ingress only require ones, even providing dozen of service. when a client send HTTP request to ingress the host and path in the request determine which service the request is forwarded to.
Ingresses operate at the application layer of the network stack (HTTP)`

you can see the view of project in docs direcory in the root of the repository.
in root directory of project I also create a several file:

`Dockerfile:`
  in Dockerfile we have two stage that the first stage is building the source code and next stage is copying that all files and dependecies into the image that container needs to start application. and we start application with “npm start” in CMD field

`.gitlab-ci.yml`
   I write a pipeline to build and deploy the source code into production environment  automatically
    we have two stage in this pipeline:  build and deploy
    In build stage we use machine to build source code.we build this code with runner that has builder
    tag . We should login to registry, it can be public or private.for example I  login to my 
    public dockerhub  that it’s address is amirhseta/calculator  with my own credential that  
    I definde them as variable before pushing my code to Gitlab-repository with $REGISTRY_USER 
    and REGISTRY_PASSWORD and  aslo I define the url of my dockerhub as variable with                             
    $REGISTRY_URL.after that we build image and push it dockerhub.
    Then In deploy stage we use runner that has deployer tag and kubernetes machine is ready there.
    We deploy three files in kubernetes machine that we have created there a cluster with minikube 
    1-deployment.yml: in this file I write the manifest of my application.
    2-service.yml: in this file I write the service that route traffic to pods.
    3-ingress.yml: in this file I write the manifest of ingress that route traffic from external client to
         service.
