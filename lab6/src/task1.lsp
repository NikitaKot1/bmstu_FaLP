(defun rev-add (lst el)
    (
        cond
        ((null lst) el)
        (T (rev-add (cdr lst) (cons (car lst) el)))
    )
)

(defun my-reverse (lst)
    (rev-add lst nil)
)

(print (my-reverse '(1 2 3 4 (5 6) 8)))