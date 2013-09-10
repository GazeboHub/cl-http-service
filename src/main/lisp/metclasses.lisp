
#|

  Copyright (c) 2013, Sean Champ. All rights reserved.

  This program and the accompanying materials are made available under
  the terms of the Eclipse Public License v1.0 which accompanies this
  distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html

|#


(in-package #:http-service)

;;; Generic Object System Protocol (network protocol clients)

(defclass protocol-client ()
  ())


;;; Generic Object System Protocol (request/response)

;; FIXME: Develop a protocol for strongly typed generic functions,
;; in reference to HTTP-RESPONSE-CODE.
;;
;; Approach 1: The ftype of a strongly typed generic function must be
;; the ftype of the primary method or (when present) the :AROUND method
;;
;; Approach 2: The ftype of a strongly typed generic function  must be
;; specified in the generic function's definition, at compile time.

(defgeneric protocol-request-remote-client (request))

(defgeneric protocol-request-local-client (request))


(defclass protocol-request ()
  ((remote-client
    :type protocol-client
    :initarg :remote-client
    :reader protocol-request-remote-client
    )
   (local-client
    :type protocol-client
    :initarg :local-client
    :reader protocol-request-local-client
    )))

(defclass protocol-request-class (protocol-request standard-class)
  ())


(defclass protocol-response ()
  ())

(defclass protocol-response-class (protocol-response standard-class)
  ())


;;; Generic Protocol Extended onto HTTP

(defclass http-client (protocol-client)
  ;; FIXME: Just because it's an HTTP-CLIENT does not indicate whether
  ;; it's an HTTP-CLIENT on an IPv4 or IPv6 network, or otherwise.
  ;;
  ;; The client's address type must be determined external to the
  ;; client metaclass, rather as a feature of an ADAPTOR onto a nework
  ;; INTERFACE
  ()
  )

(defclass http-request (protocol-request)
  ((request-type
    :type string ;;; ?
    )
   (request-uri
    ;; FIXME: Relative or absolute URI?
    ;; :type ???

    ;; FIXME: Develop an object system integrating URIs as resource
    ;; identifiers within the object model (trivial-resource ?)
    )
   ))

(defclass http-request-class (http-request protocol-request-class)
  ())

(defun http-response-code (response)
  (declare (values (mod 1000) &optional))
  (%http-response-code response))

(defclass http-response (protocol-response)
  ((response-code
    :accessor %http-response-code
    :type (mod 1000))))

(defclass http-response-class (http-response protocol-response-class)
  ())
