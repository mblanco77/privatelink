# Azure Private Link Scenarios

This is intended to review different scenarios where azure privatelink could be used 

## Table of Contents

- [General Info](#geninfo)
- [Private Link Endpoint to a blob storage](#privateendpointblob)
- [Private Link Service scenario](#privateendpointblob)
- [Webapp and azure sql scenario](#privateendpointblob)
# General Info

[Azure's Private Link Service](https://docs.microsoft.com/en-us/azure/private-link/) allows to consume privately PaaS services like (storage accounts,sql database, cosmos db) 

There is two main features:
1. [private link endpoint](https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview) : Consume privately a PaaS service through a private IP deployed into a VNet, allowing the consumption of the blob service where that IP address can be reached, like on-prem or peered VNets 


2. [private link service](https://docs.microsoft.com/en-us/azure/private-link/private-link-service-overview) : Expose a service that is running behind Azure Standard Load Balancer can be enabled for Private Link access so that consumers to your service can access it privately from their own VNets. 


# [Private Link Endpoint to a blob storage](endpointblob/README.md)
This scenario is intended to demonstrate private link enpoint in an 
 [spoke an hub architecture](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/hub-spoke) allowing the consumption of a blob storage through a privatelink endpoint, enabling the use case where the information must not be accessible from internet and exposed privately to certain clients, also demonstrates the consumption of the blob in a private manner from an on-prem vnet connected via vpn.

![](endpointblob/images/privatelinkenpointblob.png)



# [Private Link Service](privatelinkservice/README.md)

This scenario is intended to demonstrate a connection between a privatelink service (provider) and a privatelink endpoint (consumer) where the provider wants to expose privately a service behind a standard load balancer and can be consumed by multiple clients using a private ip on the client address space.

 
![](privatelinkservice/images/scenarioprivateservice.png)