(defun make_increase_list (a b)
	(
		if (< a b)
		(cons a (cons b Nil))
		(cons b (cons a Nil))
	)
)

(print(make_increase_list 5 -6))
