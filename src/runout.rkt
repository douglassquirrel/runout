#lang racket/base

(require racket/cmdline
         racket/file
         racket/function
         racket/list
         "day-arith.rkt"
         "format-date.rkt"
         "item.rkt"
         "util.rkt")

(define (get-stock i)
  (printf "~a: How many are in stock?\n" (item-name i))
  (struct-copy item i (stock (read-integer))))

(define (compute-last-day i)
  (define days-left (quotient (item-stock i) (item-usage i)))
  (define ld (days-from-today days-left))
  (struct-copy item i (last-day ld)))

(define process-item (compose compute-last-day get-stock))

(define items-filename (car (command-line #:args args args)))
(define items (map (curry apply init-item) (file->value items-filename)))

(for-each print-item (map process-item items))
