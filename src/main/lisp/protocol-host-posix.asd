#|

  Copyright (c) 2013, Sean Champ. All rights reserved.

  This program and the accompanying materials are made available under
  the terms of the Eclipse Public License v1.0 which accompanies this
  distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html

|#


(in-package #:cl-user)

(eval-when (:compile-toplevel :load-toplevel :execute)
 (defpackage #:protocol/host/posix
   (:use #:asdf #:cl)))

(in-package #:protocol/host/posix)

(defsystem #:protocol-host-posix
  :depends-on (#:protocol)
  :components
  ((:file "package-posix")
   (:file "posix-socket"
	  :depends-on ("package-host-posix"))
   ))
