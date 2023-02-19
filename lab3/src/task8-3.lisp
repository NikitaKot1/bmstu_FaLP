(defun is_first_between (first second third)
    (
        or 
        (and (> first second) (< first third))
        (and (> first third) (< first second))
    )
)

(print(is_first_between 5 -6 7))