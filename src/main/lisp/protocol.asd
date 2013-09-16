
#|

  Copyright (c) 2013, Sean Champ. All rights reserved.

  This program and the accompanying materials are made available under
  the terms of the Eclipse Public License v1.0 which accompanies this
  distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html

|#


(in-package #:cl-user)

(eval-when (:compile-toplevel :load-toplevel :execute)
 (defpackage #:http-service/system
   (:use #:asdf #:cl)))

(in-package #:http-service/sysetm)

(defsystem #:http-service
  (:depends-on #:protocol)
  :components
  ((:file "package-protocol")
   (:file "protocol" :depends-on ("package-protocol"))
   (:file "metaclasses"
    :depends-on ("protocol" "package-protocol"))
   ))
