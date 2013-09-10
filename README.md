cl-http-service
===============

An HTTP Service Implementation for Common Lisp


## Design Concepts

### An Abstract Model for Network Services

A _Service Adaptor_ is bound to a _Network Interface_, on which the
_Service Adaptor_ must service _Client_ connections, as between a
_Remote Client_ _Peer_ and a _Local Server_ _Peer_.

Typically, a _Service Adaptor_ would present _Service Responses_ to
_Service Requests_, using a client/server _protocol_, previously
defined at both endpoints, such that would represent an effective
_Service Contract_ between _Peers_ at the _Client_ and _Server_
endpoints.

### Extending the Abstract Model for HTTP Services

(To Do)
