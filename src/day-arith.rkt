#lang racket/base

(require racket/date
         racket/function)

(provide add-days days-from-today)

(define (normalise d)
  (struct-copy date d (hour 12)))

(define current-pure-date (compose normalise current-date))

(define seconds->pure-date (compose normalise seconds->date))

(define SECONDS-PER-DAY 86400)
(define (days->seconds n) (* n SECONDS-PER-DAY))

(define (add-days d n)
  (seconds->pure-date (+ (date->seconds d) (days->seconds n))))

(define days-from-today (curry add-days (current-pure-date)))

(display (days-from-today 21))
