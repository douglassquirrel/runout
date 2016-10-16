#lang racket/base

(require racket/cmdline
         racket/list
         "day-arith.rkt"
         "format-date.rkt")

(define (run-out stock dose)
  (format-date (days-from-today (quotient stock dose))))

(define args (command-line #:args args args))
(define stock (string->number (first args)))
(define dose (string->number (second args)))

(displayln (run-out stock dose))
