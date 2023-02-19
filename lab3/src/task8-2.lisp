(defun is_first_between (first second third)
	(
	    cond 
        (
            (> first second) 
            (
                cond ((< first third) t)
                     (T nil)
            )
        )
            
	    (
            (< first second) 
            (
                cond ((> first third) t)
                     (T nil)
            )
        )
	)
)

(print(is_first_between 5 -6 7))