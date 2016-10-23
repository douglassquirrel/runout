#lang racket/base

(require racket/undefined
         "format-date.rkt"
         "util.rkt")

(provide init-item print-item
         item item-name item-usage item-stock item-last-day
         set-last-day set-stock)

(struct item (name usage stock last-day))

(define (init-item n u) (item n u undefined undefined))

(define (set-stock i s)     (struct-copy item i (stock s)))
(define (set-last-day i ld) (struct-copy item i (last-day ld)))

(define (print-item i)
  (printf "You have ~a units of ~a. Using ~a a day, you will run out on ~a.\n"
          (item-stock i) (item-name i) (n-times (item-usage i))
          (format-date (item-last-day i))))
