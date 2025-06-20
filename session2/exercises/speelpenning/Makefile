all: view_hessian

FC	= gfortran

.PHONY: view_hessian

view_hessian:
	$(FC) view_hessian.f90 -o view_hessian

clean:
	rm -f *.csv *.dat *.mod *.msg *.o *.out *_b.f90 *_bv.f90 *_d.f90 *_dv.f90 *~
	rm -f tmp.f90
