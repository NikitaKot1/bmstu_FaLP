(defvar lll)
(setf lll '(1 2 3 4 5 6 7 b))

(defun mult_a (lst num)
    (
        mapcar 
        #'(
            lambda 
            (cr) 
            (
                and
                (numberp cr)
                (* cr num)
            )
        )
        lst
    )
)

(defun mult_b (lst num)
    (
        mapcar 
        #'(
            lambda 
            (cr) 
            (
                or
                (
                    and
                    (numberp cr)
                    (* cr num)
                )
                cr
            )
        )
        lst
    )
)

(print (mult_b lll 3))