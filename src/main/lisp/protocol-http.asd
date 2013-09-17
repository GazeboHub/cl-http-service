#|

  Copyright (c) 2013, Sean Champ. All rights reserved.

  This program and the accompanying materials are made available under
  the terms of the Eclipse Public License v1.0 which accompanies this
  distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html

|#


(in-package #:cl-user)

(eval-when (:compile-toplevel :load-toplevel :execute)
 (defpackage #:protocol/service/http/system
   (:use #:asdf #:cl)))

(in-package #:protocol/service/http/system)

(defsystem #:protocol-service-http
  :depends-on (#:protocol)
  :components
  ((:file "package-http")
   (:file "http"
	  :depends-on ("package-http"))
   ))
