(defun first_el_list2 (lst)
    (
        and lst
        (
            cond 
            (
                (and (car lst) (listp (car lst))) 
                (car lst)
            )
            (
                T
                (first_el_list (cdr lst))
            )
        )
    )
)

(defun first_el_list (lst)
    (
        cond 
        ((listp (car lst)) (first_el_list (car lst)))
        (T (car lst))
    )
)

(print (first_el_list '((1 2) 3 4 8)))