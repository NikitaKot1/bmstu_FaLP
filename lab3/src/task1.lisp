(defun make_even (x)
    ( 	if (evenp x)
        x
        (+ x 1)
    )
)

(print(make_even 5))
