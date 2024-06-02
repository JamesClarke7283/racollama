#lang racket

(require "utils.rkt")

(provide generate-completion)

(define (generate-completion model prompt #:images [images #f] #:stream [stream #t])
  (let ((data `(("model" . ,model)
                ("prompt" . ,prompt)
                ,@(if images `(("images" . ,images)) '())
                ("stream" . ,stream))))
    (make-request "/api/generate" 'POST data)))
