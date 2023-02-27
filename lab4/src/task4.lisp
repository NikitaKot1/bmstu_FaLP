(defun without_last_el (lst)
    (
        reverse (cdr (reverse lst))
    )
)

(print (without_last_el '(1 6 3 4 4 6)))

(defun without_last_el2 (lst)
    (
        cond 
        (
            (cdr lst) 
            (cons (car lst) (without_last_el2 (cdr lst)))
        )
        (
            T
            Nil
        )
    )
)

(print (without_last_el2 '(1 6 3 4 4 6)))