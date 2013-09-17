
#|

  Copyright (c) 2013, Sean Champ. All rights reserved.

  This program and the accompanying materials are made available under
  the terms of the Eclipse Public License v1.0 which accompanies this
  distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html

|#

(in-package #:protocol)


;;; Generic Object System Protocol (network protocol clients)

(defclass protocol-peer ()
  ())


(defclass protocol-client (protocol-peer)
  ())


(defclass protocol-server (protocol-peer)
  ())


(defclass protocol-interface ()
  ())


(defgeneric bind-server (server interface))


;;; Generic Object System Protocol (request/response)

;; FIXME: Develop a protocol for strongly typed generic functions,
;; in reference to HTTP-RESPONSE-CODE.
;;
;; Approach 1: The ftype of a strongly typed generic function must be
;; the ftype of the primary method or (when present) the :AROUND method
;;
;; Approach 2: The ftype of a strongly typed generic function  must be
;; specified in the generic function's definition, at compile time.

(defgeneric protocol-event-remote-peer (event))

(defgeneric protocol-event-local-peer (event))

(defclass protocol-event ()
  ((remote-peer
    :type protocol-peer
    :initarg :remote-peer
    :reader protocol-event-remote-peer
    )
   (local-peer
    :type protocol-peer
    :initarg :local-peer
    :reader protocol-event-local-peer
    )))


(defclass protocol-request (protocol-event)
  ())


(defclass protocol-response (protocol-event)
  ())
