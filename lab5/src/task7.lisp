(defun decart (lst1 lst2)
    (
        mapcan 
        #'(lambda (a-el)
            (
                mapcar 
                (lambda (b-el)
                    (cons a-el b-el)
                )
                lst2
            )
        )
        lst1
    )
)

(print (decart '(1 2 3) '(1 2 3)))