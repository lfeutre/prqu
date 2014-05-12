(defmodule prqu-github
  (export all))

(defun get-user ()
  (prqu-settings:get-value 'api 'key))

(defun get-password ()
  (prqu-settings:get-value 'github 'basic_auth_password))

(defun get-base-url ()
  (prqu-settings:get-value 'github 'base_api_url))

(defun get-userpass ()
  (++ (get-user) ":" (get-password)))

(defun get-encoded-userpass ()
  (base64:encode_to_string (get-userpass)))

(defun get-auth-header ()
  (let ((encoded (get-encoded-userpass)))
    (tuple "Authorization" (++ "Basic " encoded))))

(defun get-headers ()
  (list
    (get-auth-header)
    (tuple "Accept" "application/vnd.github.v3+json")
    (prqu-const:user-agent-header)))

(defun get (path)
  (lhttpc:request
    (++ (get-base-url) path)
    'get
    (get-headers)
    5000))

(defun github-authorize ()
  )

(defun github-callback (arg-data)
  )
