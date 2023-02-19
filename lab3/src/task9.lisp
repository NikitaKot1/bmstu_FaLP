(Defun how_alike (x y)
    (
        cond 
        ((or (= x y) (equal x y)) 'the_same)
        ((and (oddp x) (oddp y)) 'both_odd)
        ((and (evenp x) (evenp y)) 'both_even)
        (t 'difference) 
    ) 
)

(print(how_alike 5 -3))