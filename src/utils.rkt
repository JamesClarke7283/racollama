#lang racket

(require net/http-client json "connection.rkt")

(provide make-request handle-error)

(define (make-request endpoint method data)
  (let* ((url (string-append (get-connection) endpoint))
         (headers '(("Content-Type" . "application/json")))
         (body (if data (jsexpr->string data) "")))
    (handle-error (case method
                    ((GET) (http-sendrecv url #:method "GET" #:headers headers))
                    ((POST) (http-sendrecv url #:method "POST" #:headers headers #:data body))))))

(define (handle-error response)
  (if (not (= (response-status response) 200))
      (error "API request failed" (response-body response))
      (response-body response)))
