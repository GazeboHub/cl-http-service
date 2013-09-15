cl-http-service
===============

An HTTP Service Implementation for Common Lisp


## Design Concepts

### An Abstract Model for Server/Client Peer Services

A _Service Adaptor_ is bound to an _Interface_, on which the
_Service Adaptor_ must service _Client_ connections, as between a
_Remote Client_ _Peer_ and a _Local Server_ _Peer_.

Typically, a _Service Adaptor_ would present _Service Responses_ to
_Service Requests_, using a client/server _protocol_, previously
defined in each of its _server_ and _client_models at each respective
endpoint. The _protocol_ as such would represent an effective
_Service Contract_ between _Peers_ at the _Client_ and _Server_
endpoints.

### Extending the Abstract Model for HTTP Services

(To Do)


### URI as Resources References

(To Do)

### Additional Protocol: Strongly Typed Generic Functions

(?)

### References

(Cite here - RFCs onto HTTP; later, a WebDAV module; possibly,
something after the Java servlet model, and something after the Java
portal model, although programmed in Common Lisp)
