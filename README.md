cl-service-protocol (was: cl-http-service)
==========================================

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


## Project Items

### To Do (16 Sept 2013)

* Integrate [current Cubetto model](doc/Cubetto/) into codebase
    * Define package `#:protocol/host/posix`
        * Define generic functions illustrated in model
            * `Make-Socket`
     * Define package `#:protocol/inet/tcp`
        * Import packages `#:protocol`, `#:protocol/host/posix`
        * Define classes illustrated in model
            * `TCP-Server`
            * `TCP-Client`
            * `Inet-Interface`
            * `IPv4-Interface`
            * `IPv6-Interface`
        * Define methods illustrated in model
            * `Bind-Server (TCP-Server Inet-Interface)`
        * Define methods illustrated in model
            * `Make-Socket (IPv4-Interface)`
            * `Make-Socket (IPv6-Interface)`
* Develop a prototype for integration of `Protocol-Event` model into
  the operations of a simple, protocol-specific subclass of `TCP-Server`
* Develop `TCP-Client` model
    * Develop a prototype for integration of `Protocol-Event` model into
      the operations of a simple, protocol-specific subclass of 
      `TCP-Client`
* Name-migration (early) cl-http-service => cl-service-protocol
    * Fork GitHub repository => cl-service-protocol
    * Mark cl-http-service deprecated, with explanation
    * Continue development onto cl-service-protocol repository
