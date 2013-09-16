#|

  Copyright (c) 2013, Sean Champ. All rights reserved.

  This program and the accompanying materials are made available under
  the terms of the Eclipse Public License v1.0 which accompanies this
  distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html

|#

(in-package #:cl-user)

(defpackage #:protocol
  (:use #:c2mop #:cl)
  (:shadowing-import-from
   #:c2mop

   #:defmethod
   #:defgeneric
   #:standard-generic-function
   )
  (:export
   #:protocol-peer
   #:protocol-client
   #:protocol-server

   #:bind-server

   #:protocol-event
   #:protocol-event-remote-peer
   #:protocol-event-local-peer
   #:protocol-event
   #:protocol-request
   #:protocol-response

   #:protocol-request-class
   #:protocol-response-class
   #:protocol-client-class
   #:protocol-server-class
   ))

(defpackage #:protocol/http
  (:use #:protocol #:cl)
  (:export
   #:http-client
   #:http-server
   #:http-request
   #:http-request-class
   #:http-response-code
   #:http-response
   #:http-response-class
   ))
