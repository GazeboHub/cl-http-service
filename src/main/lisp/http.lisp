#|

  Copyright (c) 2013, Sean Champ. All rights reserved.

  This program and the accompanying materials are made available under
  the terms of the Eclipse Public License v1.0 which accompanies this
  distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html

|#

(in-package #:protocol/service/http)


;;; Generic Protocol Extended onto HTTP

(defclass http-client (protocol-client)
  ;; FIXME: Just because it's an HTTP-CLIENT does not indicate whether
  ;; it's an HTTP-CLIENT on an IPv4 or IPv6 network, or otherwise.
  ;;
  ;; The client's address type must be determined external to the
  ;; client metaclass, rather as a feature of an ADAPTOR onto a nework
  ;; INTERFACE
  ())

(defclass http-server (protocol-server)
  ())

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

(deftype http-status-code ()
  '(mod #.(1+ 505)))

(defun http-status-code (response)
  ;; An effort in making a call to a generic function, in such a
  ;; manner as that ultimately produces a strongly typed return value
  ;;
  ;; Note that this approach of "Dispatch to a generic function from
  ;; within a conventinoal function" will ensure consistency of return
  ;; values, but may not serve to support some optimizations in method
  ;; combination and method dispatching - e.g. with regards to
  ;; discriminating  functions - such as at least hypothetically could
  ;; be optimized on known types of input values.
  ;;
  ;; cf. SBCL internals - specifically, with regars to discriminating
  ;; functions
  ;;   * http://www.sbcl.org/sbcl-internals/Discriminating-Functions.html
  ;;   * http://www.sbcl.org/sbcl-internals/Method_002dBased-Discriminating-Functions.html
  ;;   * http://www.sbcl.org/sbcl-internals/Accessor-Discriminating-Functions.html
  ;; and cf. AMOP (COMPUTE-DISCRIMINATING-FUNCTION and its uses)
  ;; also cf. memoization
  (declare (values http-status-code &optional))
  (%http-status-code response))

(defclass http-response (protocol-response)
  ((status-code
    :initarg :status-code
    :accessor %http-status-code
    :type http-status-code)))

(defclass http-response-class (http-response protocol-response-class)
  ;; Note that the HTTP-RESPONE-CLASS metaclasses may be indexed by
  ;; STATUS-CODE, as the STATUS-CODE representing an integral value
  ;; less than 505
  ;;
  ;; Though the indexing algorithm could use a tree for indexing the
  ;; classes by status code, but as due to the limited, fixed number
  ;; of possible status code values, a SIMPLE-ARRAY methodology will
  ;; be preferred
  ())


;;; * A Trivial Class Indexing Algorithm

(declaim (type (simple-array * (5 17)) %response-classes%))


(defparameter %response-classes%
  ;; FIXME: Mark this variable's value for stack allocation

  ;; Structure:
  ;;  5 seperate ranges of response code (1xx..5xx)
  ;;  Maximum 17 codes in any range (17 of 4xx codes)
  ;;  (Some empty space, in a tradeoff for optimized access)
  (make-array '(5 17) :initial-element nil
	      :element-type t))



#+NIL
(defun store-response-foo (code foo)
  (declare
   (type http-status-code code)
   #+NIL (values (or http-response-class null) &optional))
  (multiple-value-bind (m n)
      (truncate code 100)
    (setf (aref %response-classes% m n) foo)))

(defun find-response-class-using-code (code &optional (errorp t))
  (declare
   (type http-status-code code)
   (values (or http-response-class null) &optional))
  (multiple-value-bind (m n)
      (truncate code 100)
    (let ((it (aref %response-classes% m n)))
      (cond
	(it it)
	(errorp
	 ;; FIXME: Use a fancier error class
	 (error "No class registered for response code ~s" code))
	(t nil)))))

;; (store-response-foo 404 "Foo No Foo")
;; (find-response-class-using-code 404 nil)
