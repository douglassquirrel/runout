#lang racket/base

(require racket/function)

(provide format-date)

(define MONTHS
  (list "" "January" "February" "March" "April" "May" "June"
           "July" "August" "September" "October" "November" "December"))
(define month-name (curry list-ref MONTHS))

(define (format-date d)
  (format "~a ~a ~a"
    (date-day d)
    (month-name (date-month d))
    (date-year d)))
