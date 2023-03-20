(defun rec-add (lst)
    (defun add_fun (lst sum)
        (
            cond
            ((null lst) sum)
            ((listp (car lst)) (+ sum (add_fun (car lst) 0)))
            ((numberp (car lst)) (+ (car lst) (add_fun (cdr lst) sum)))
        )
    )
    (add_fun lst 0)
)

(defun rec-add-b (lst)
    (defun add_fun (lst sum)
        (
            cond
            ((null lst) sum)
            ((numberp (car lst)) (+ (car lst) (add_fun (cdr lst) sum)))
        )
    )
    (add_fun lst 0)
)

(print (rec-add '(1 2 3 (4 8))))