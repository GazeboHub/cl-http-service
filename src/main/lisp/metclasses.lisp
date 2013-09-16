
#|

  Copyright (c) 2013, Sean Champ. All rights reserved.

  This program and the accompanying materials are made available under
  the terms of the Eclipse Public License v1.0 which accompanies this
  distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html

|#

(in-package #:protocol)

(defclass protocol-request-class (protocol-request standard-class)
  ())

(defclass protocol-response-class (protocol-response standard-class)
  ())

(defclass protocol-client-class (protocol-client standard-class)
  ())

(defclass protocol-server-class (protocol-client standard-class)
  ())
