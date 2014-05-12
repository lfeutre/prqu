(defmodule prqu-const
  (export all))

(defun config-name () 'prqu)

(defun project-name () '"PR Queues")

(defun project-url () '"https://github.com/lfe/prqu")

(defun user-agent ()
  (++ (project-name) "/"
      (prqu-util:get-prqu-version)
      " HTTP Client (+" (project-url) ")"))

(defun user-agent-header ()
  (tuple "User-Agent" (user-agent)))
