(defun palindrom_check (lst)
    (
        every #'equal
        lst (reverse lst)
    )
)

(print (palindrom_check '(1 2 3 4 5 4 3 2 1)))