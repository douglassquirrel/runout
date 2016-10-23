#lang racket/base

(provide read-integer string->integer
         n-times)

(define (read-and-convert convert)
  (define value (convert (read-line)))
  (if value
      value
      (read-and-convert convert)))

(define (string->integer s)
  (define value (string->number s))
  (if (integer? value)
      value
      #f))

(define (read-integer)
  (read-and-convert string->integer))

(define (n-times n)
  (cond ((= n 1) "once")
        ((= n 2) "twice")
        (else (format "~a times" n))))
