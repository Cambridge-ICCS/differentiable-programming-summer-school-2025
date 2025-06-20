all: forward_euler backward_euler gradient_descent

FC	= gfortran

.PHONY: forward_euler backward_euler gradient_descent

forward_euler:
	$(FC) forward_euler.f90 -o forward_euler

backward_euler:
	$(FC) backward_euler.f90 -o backward_euler

gradient_descent:
	$(FC) gradient_descent.f90 -o gradient_descent

clean:
	rm -f *.csv *.dat *.mod *.msg *.o *.out *_b.f90 *_bv.f90 *_d.f90 *_dv.f90 *~
	rm -f forward_euler backward_euler gradient_descent
