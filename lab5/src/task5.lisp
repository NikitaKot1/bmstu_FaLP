(defun set_equal_forv (ls1 ls2)
    (
        every
        #'(lambda (n)
            (
                member
                n ls2
            )
        )
        ls1
    )
)

(defun set_equal (lst1 lst2)
    (
        and
        (set_equal_forv lst1 lst2)
        (set_equal_forv lst2 lst1)
    )
)



(print (set_equal '(1 2 3 4 5 4 3 2 1) '(5 4 6 3 2 1)))