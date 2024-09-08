(define (square n) (* n n))

(define (pow base exp) 
        (cond
              ((= 1 exp) 1)
              ((even? exp) (* (square base) (pow base (/ exp 2))))
              ((odd? exp)(* base (pow base (- exp 1)))))     
)

(define (repeatedly-cube n x)
        (if (= n 1)
            (* x x x)  
            (repeatedly-cube (- n 1) (* x x x)))
)

(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cdr (cdr s))))
