(defvar lll)
(setf lll '(1 2 3 4 5 6 7))

(defun squ (lst)
    (
        mapcar 
        #'(
            lambda 
            (num) 
            (
                or
                (
                    and
                    (numberp num)
                    (* num num)
                )
                num
            )
        )
        lst
    )
)

(print(funcall #'squ '(1 2 3 4 5 6 7)))
