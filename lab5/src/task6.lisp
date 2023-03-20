(defun select_between (lst a b)
    (
        remove-if-not
        #'(lambda (num)
            (
                cond
                (
                    (
                        and
                        (< num b)
                        (> num a)
                    )
                    num
                )
            )
        )
        lst
    )
)

(print (select_between '(1 2 3 4 5 6 7 8 9) 1 5))