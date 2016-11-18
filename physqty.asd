(in-package :common-lisp-user)

(asdf:defsystem #:physqty
  :serial t
  :description "Physical Quantities"
  :version "1.0.4"
  :author "Kurt Pagani , <nilqed@gmail.com>"
  :license "BSD, see file LICENSE"
  :pathname "src/"
  :components ((:file "pqty")))