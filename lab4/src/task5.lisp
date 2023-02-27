(defun swap_first_last (lst)
    (
        append 
        (last lst)
        (reverse (cdr (reverse (cdr lst))))
        (cons (car lst) Nil)
    )
)

(print (swap_first_last '(1 2 3 4 5)))