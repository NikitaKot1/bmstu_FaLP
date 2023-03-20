(defvar lll)
(setf lll '(1 2 3 4 5 6 7 b))

(defun min10 (lst)
    (
        mapcar 
        (
            lambda 
            (num) 
            (
                or
                (
                    and
                    (numberp num)
                    (- num 10)
                )
                num
            )
        )
        lst
    )
)


(print (min10 lll))