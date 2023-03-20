(defun sum_of_len (lst)
    (
        reduce
        #'(lambda (init el2) 
            (
                + 
                init
                (
                    cond 
                    ((listp el2) (sum_of_len el2))
                    (T 1)
                )
            )
        )
        lst
        :initial-value 0
    )
)



(print (sum_of_len '((1 2) (3 4) ((3 5 6) (4 6 7 8 9)) (5 (7 6))) ))