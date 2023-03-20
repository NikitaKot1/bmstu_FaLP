(defun mult_a (lst num)
    (
        and lst
        (
            cons 
            (* (car lst) num)
            (mult_a (cdr lst) num)
        )
    )
)

(defun mult_b (lst num)
    (
        and lst
        (
            cons 
            (
                or 
                (and (numberp (car lst)) (* (car lst) num))
                (car lst)
            )
            (mult_b (cdr lst) num)
        )
    )
)

(print (mult_b '(1 2 3 4 5 g y) 3))