(defun is_first_between (first second third)
	(
	    if (> first second) 
        (
            if (< first third)
            t
            nil
        )
            
	    (
            if (< first second) 
            (
                if (> first third)
                t
                nil
            )
        )
	)
)

(print(is_first_between 5 -6 7))