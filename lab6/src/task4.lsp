(defun select_between (lst a b)
    (
        cond
        ((null lst) Nil)
        (
            (and (< (car lst) b) (> (car lst) a))
            (cons (car lst) (select_between (cdr lst) a b))
        )
        (
            T
            (select_between (cdr lst) a b)
        )
    )
)

(print (select_between '(1 2 3 4 8) 1 6))