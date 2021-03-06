#lang racket

(require plot plot/utils)

(define (norm mx my x y)
  (exp (* -1/2 (+ (sqr (- x mx)) (sqr (- y my))))))

(define (f x y)
  (+ (* 1.1 (norm -1.5 -1.5 x y))
     (* 2 (norm 1 1 x y))
     (* 1.3 (norm 2 -2 x y))))

(define (dest fn)
  (build-path (find-system-path 'temp-dir) fn))

(plot-title "Survival Rate of Torsion Widgets")
(plot-x-label "Torsion")
(plot-y-label "Widgetyness")

(time
 (plot (contour-intervals f #:alphas '(1/4 3/4))
       #:x-min -5 #:x-max 5 #:y-min -5 #:y-max 5
       #:out-file (dest "contour-test.png")))

(time
 (plot (contour-intervals f #:alphas '(1/4 3/4))
       #:x-min -5 #:x-max 5 #:y-min -5 #:y-max 5
       #:out-file (dest "contour-test.ps")))

(time
 (plot (contour-intervals f #:alphas '(1/4 3/4))
       #:x-min -5 #:x-max 5 #:y-min -5 #:y-max 5
       #:out-file (dest "contour-test.pdf")))

(time
 (plot (contour-intervals f #:alphas '(1/4 3/4))
       #:x-min -5 #:x-max 5 #:y-min -5 #:y-max 5
       #:out-file (dest "contour-test.svg")))

(time
 (plot3d (contour-intervals3d f -5 5 -5 5 #:alphas '(1/4 3/4))
         #:out-file (dest "contour3d-test.pdf")))

(time
 (plot3d (contour-intervals3d f -5 5 -5 5 #:alphas '(1/4 3/4))
         #:out-file (dest "contour3d-test.ps")))

(time
 (plot3d (contour-intervals3d f -5 5 -5 5 #:alphas '(1/4 3/4))
         #:out-file (dest "contour3d-test.svg")))

(time
 (plot3d (contour-intervals3d f -5 5 -5 5 #:alphas '(1/4 3/4))
         #:out-file (dest "contour3d-test.png")))
