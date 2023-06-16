#lang racket

(require pollen/tag)
(provide title
         link
         chapter-link
         term
         text-quote)

(define (filter-non-strings lst)
  (filter string? lst))

(define (join-strings lst [sep ""])
  (string-join (filter-non-strings lst) sep))

(define (join-ignore-nl strs)
  (string-replace
   (string-join
    (filter-non-strings strs)
    "")
   "\n" ""))

(define-tag-function (title attrs elems)
  `(title "# " ,(join-ignore-nl elems)))

(define-tag-function (link attrs elems)
  (define the-ref
    (let ([ref-pair (assoc 'ref attrs)])
      (unless ref-pair
        (error 'link "expected ref, attrs: ~e. elems: ~e" attrs elems))
      (cadr ref-pair)))
  
  `(link "[" ,(join-ignore-nl elems) "](" ,the-ref ")"))

(define-tag-function (chapter-link attrs elems)
  (define the-ref
    (let ([ref-pair (assoc 'ref attrs)])
      (unless ref-pair
        (error 'chapter-link "expected ref, attrs: ~e. elems: ~e" attrs elems))
      (format "~a.md" (cadr ref-pair))))

  (apply link #:ref the-ref elems))

(define-tag-function (term attrs elems)
  `(@ ,@elems))

(define-tag-function (text-quote attrs elems)
  (define elems-joined (string-join (filter-non-strings elems) ""))
  (string-append ">     " (string-replace elems-joined "\n" "\n>    ")))

(define-tag-function (cmd-fn attrs elems)
  (join-strings elems))
