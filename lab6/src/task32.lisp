(defun mult_a_add (lst rez num)
        (
            cond
            ((null lst) rez)
            ((numberp (car lst))
                (mult_a_add 
                    (cdr lst) 
                    (cons (* (car lst) num) rez) ;; b
                    num
                ))
            (T (mult_a_add 
                    (cdr lst) 
                    (cons (car lst) rez)
                    num
                )
            )
        )
    )

(defun mult_a (lst num)
    (mult_a_add (mult_a_add lst nil num) nil 1)
)

(print (mult_a '(1 2 3 4 5 d f g) 3))