(defun palindrom_check (lst)
    (defun st_check (ls revls n)
        (
            cond
            (
                (> n 1)
                (
                    and
                    (= (car ls) (car revls))
                    (st_check (cdr ls) (cdr revls) (- n 2))
                )
            )
            (
                T 
                T
            )
        )
    )
    (st_check lst (reverse lst) (length lst))
)

(print (palindrom_check '(1 2 3 4 5 3 2 1)))