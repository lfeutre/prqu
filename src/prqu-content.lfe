(defmodule prqu-content
  (export all))

(include-lib "deps/exemplar/include/html-macros.lfe")

(defun get-side-menu ()
  "An example reusable menu."
  (list
    (li (a '(href "/") '"Main Page"))
    (li (a '(href "/content/1") '"/content/1"))
    (li (a '(href "/content/2") '"/content/2"))
    (li (a '(href "/content/3") '"/content/3"))
    (li
      (list
        (a '(href "/relation/1/2") '"/relation/1/2")))
    (li (a '(href "/bob") '"404"))))

(defun get-navbar()
  "A main navigation bar example."
  (nav '(class "navbar navbar-top" role "navigation")
    (div '(class "container")
      (div '(class "navbar-header")
        (div '(class "collapse navbar-collapse navbar-ex1-collapse")
          (list
            (ul '(class "nav navbar-nav navbar-right")
              (get-side-menu))))))))

(defun base-page (title remaining)
  "A function to provide the base for all pages."
  (list
    (!doctype 'html)
    (html '(lang "en")
      (list
        (head
          (list
            (title title)
            (link '(rel "stylesheet" href "/css/bootstrap-min.css"))
            (link '(rel "stylesheet" href "/css/bootstrap-slate-min.css"))
            (link '(rel "stylesheet" href "/css/styles.css"))
            (link '(rel "icon" type "image/png" href "/icons/favicon.png"))
            (script '(src "/js/bootstrap-min.js"))))
        (body
          (main
            (list
              (get-navbar)
              (a '(href "https://github.com/lfe/prqu")
                 (img '(style "position: absolute; top: 0; right: 0; border: 0;"
                        src "https://camo.githubusercontent.com/e7bbb0521b397edbd5fe43e7f760759336b5e05f/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f677265656e5f3030373230302e706e67"
                        alt "Fork me on GitHub"
                        data-canonical-src "https://s3.amazonaws.com/github/ribbons/forkme_right_green_007200.png")))
              (div '(class "section")
                (div '(class "container")
                  (div '(class "row well")
                    remaining))))))))))

(defun base-sidebar-page (title sidebar remaining)
  "We can also make building HTML easier by using functions."
  (base-page title
    (list
      sidebar
      remaining)))

(defun get-sidebar-content (arg-data)
  "1-arity content API function.

  This function generates its HTML from scratch."
  (let ((title '"prqu &#x21CB; Github PR Queues"))
    (: prqu-util make-200-result
        (base-sidebar-page
          title
          (div '(class "col-md-3 col-sm-4 sidebar")
            (ul '(class "nav nav-stacked nav-pills")
              (get-side-menu)))
          (div
            (list
              (img '(class "logo" src "/images/prqu.png"))
              (h1 title)
              (h2 "Queues")
              (h3 "Accounts")
              (div
                (p "[Account/user queues here]"))
              (h3 "Organziations")
              (div
                (p "[org queues here]"))
              (h3 "Projects")
              (div
                (p "[project queues here]"))
              ))))))

(defun get-content (item-id arg-data)
  "2-arity content API.

  This function generates its HTML from scratch."
  ;; we'll pretent to pull content from a data store here ...
  (let ((fetched-title '"Queried Title")
        (fetched-content '"Some super-great queried lorem ipsum."))
    (: prqu-util make-200-result
      (base-page
        fetched-title
        (div
          (list
            (h1 fetched-title)
            (h2 (++ '"Item " item-id))
            (div (p fetched-content))))))))

(defun get-content (user-id account-id arg-data)
  "3-arity content API.

  This function generates its HTML by calling another function. This is an
  example of how one could do templating -- including putting HTML-generating
  functions in their own modules."
  ;; we'll pretent to pull content from a data store here ...
  (let ((fetched-title '"Queried Title")
        (fetched-content '"Some super-great queried lorem ipsum."))
    (: prqu-util make-200-result
      (base-page
        fetched-title
        (div
          (list
            (h1 fetched-title)
            (h2 (++ '"Relation: "
                    user-id '" (user id) | "
                    account-id '" (account id)"))
            (div (p fetched-content))))))))

(defun four-oh-four (message)
  "Custom 404 page."
    (: prqu-util make-404-result
      (base-page
        '"404"
        (div
          (list
            (h1 '"404 - Not Found")
            (div (p message)))))))




