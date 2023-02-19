(Defun how_alike (x y)
    (
        or 
        (and (or (= x y) (equal x y)) 'the_same)
        (and (oddp x) (oddp y) 'both_odd)
        (and (evenp x) (evenp y) 'both_even)
        'difference 
    ) 
)

(print(how_alike -3 -5))