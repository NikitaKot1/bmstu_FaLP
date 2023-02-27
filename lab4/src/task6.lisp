(defvar rs (make-random-state T))
(defvar thr1)
(defvar thr2)

(defun bones_throw ()
    (
        list
        (+ (random 6 rs) 1)
        (+ (random 6 rs) 1)
    )
)

(defun win_check (lst)
    (
        or
        (   
            = 
            (+ (car lst) (cadr lst))
            7
        )
        (   
            = 
            (+ (car lst) (cadr lst))
            11
        )
    )
)

(defun pass_check (lst)
    (
        or
        (   
            and 
            (= (car lst) 1)
            (= (cadr lst) 1)
        )
        (   
            and 
            (= (car lst) 6)
            (= (cadr lst) 6)
        )
    )
)

(defun gameplay2 ()
    (princ "Second player throw: ") 
    (setq thr2 (bones_throw))
    (princ thr2)
    (terpri)
    (
        cond 
        (
            (win_check thr2)
            (princ "Second player wins!") 
        )
        (
            (pass_check thr2)
            (gameplay2)
        )
        (
            T
            (
                cond
                (
                    (
                        >
                        (+ (car thr1) (cadr thr1))
                        (+ (car thr2) (cadr thr2))
                    )
                    (princ "First player wins!") 
                )
                (
                    (
                        <
                        (+ (car thr1) (cadr thr1))
                        (+ (car thr2) (cadr thr2))
                    )
                    (princ "Second player wins!") 
                )
                (
                    T
                    (princ "Draw in the game!")
                )
            )
        )
    )
)

(defun gameplay1 ()
    (princ "First player throw: ") 
    (setq thr1 (bones_throw))
    (princ thr1)
    (terpri)
    (
        cond 
        (
            (win_check thr1)
            (princ "First player wins!") 
        )
        (
            (pass_check thr1)
            (gameplay1)
        )
        (
            T
            (gameplay2)
        )
    )
    (terpri)
)

(gameplay1)