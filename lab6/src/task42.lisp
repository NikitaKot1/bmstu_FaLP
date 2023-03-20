(defun revapp (lstrev rez)
    (
        cond 
        ((null lstrev) rez)
        ((null rez) lstrev)
        (T (revapp (cdr lstrev) (cons (car lstrev) rez)))
    )
)

(defun add_in_sorted (lst num &optional ost)
    (
        cond
        ((null lst) (revapp ost (cons num nil)))
        (   (< (car lst) num) 
            (add_in_sorted (cdr lst) num (cons (car lst) ost))
        )
        (T (revapp ost (cons num lst)))
    )
)

(defun select_between (lst a b &optional rez)
    (
        cond
        ((null lst) rez)
        (
            (and (< (car lst) b) (> (car lst) a))
            (select_between (cdr lst) a b (add_in_sorted rez (car lst)))
        )
        (T (select_between (cdr lst) a b rez))
    )
)

(print (select_between '(1 4 2 5 3 2 3 4 8) 1 6))