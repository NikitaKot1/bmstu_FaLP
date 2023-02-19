(Defun how_alike (x y)
    (
        if (= x y) 'the_same
        (
            if (equal x y) 'the_same
            (
                if (oddp x)
                (if (oddp y) 'both_odd 'difference)
                (if (evenp y) 'both_even 'difference)
            )
        )
    ) 
)

(print(how_alike -9 8))