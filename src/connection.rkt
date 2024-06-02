#lang racket

(provide set-connection get-connection)

(define connection
  (make-parameter
   (let ((env-host (getenv "OLLAMA_HOST")))
     (if env-host
         env-host
         "http://localhost:11434"))))

(define (set-connection url)
  (connection url))

(define (get-connection)
  (connection))
