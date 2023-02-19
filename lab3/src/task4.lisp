(defun is_first_between (first second third)
	(
	    if 
            (
                or 
	            (and (> first second) (< first third))
	            (and (> first third) (< first second))
	        )
	    t
	    nil
	)
)

(print(is_first_between 5 -6 7))