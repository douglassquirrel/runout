#lang racket/base

(require racket/cmdline
         racket/list
         "day-arith.rkt")

(define (run-out stock dose)
  (days-from-today (quotient stock dose)))

(define args (command-line #:args args args))
(define stock (string->number (first args)))
(define dose (string->number (second args)))

(run-out stock dose)
