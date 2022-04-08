![snapp-task](https://user-images.githubusercontent.com/70238195/162207153-8c56c5bb-9aa2-46fe-8e99-1b687b4cad3b.jpg)
`I also use ingress for expossing service externally 
althought I could use loadbalancer and nodeport service to expose my application to external clients,have a lot of cost for us.
Because when we use loadbalancer servcie , for example in cloud providers , a load balancer is created for every loadbalancer servcice and each loadbalancer service requires own loadbalaner with its own public IP address. Whereass  in ingress only require ones, even providing dozen of service. when a client send HTTP request to ingress the host and path in the request determine which service the request is forwarded to.
Ingresses operate at the application layer of the network stack (HTTP)`
