(defparameter +spad-project+ (asdf:system-source-directory :physqty))
(defparameter +spad-filebase+ "pqty")


(defun compile-spad-project (p f)
  (progn
    (|doSystemCommand| (format nil "cd ~Alib" p))
    (|doSystemCommand| (format nil "compile ../src/~A.spad )quiet" f))))

(defun load-spad-project (p f)
  (let ((uf (string-upcase f)))
    (if (probe-file (format nil "~Alib/~A.NRLIB/~A.lsp" p uf uf))
       (|doSystemCommand| (format nil "lib )dir ~Alib/" p))
       (compile-spad-project p f))))

(defun test-spad-project (p f)
  (if (probe-file (format nil "~Atest/~A.input" p f))
     (|doSystemCommand| (format nil "read ~Atest/~A )quiet" p f))
     (print "Test file not found ...")))


(catch 'spad_reader (load-spad-project +spad-project+ +spad-filebase+))
