all: dot_product_test

FC	= gfortran

.PHONY: dot_product_test

dot_product_test:
	$(FC) dot_product_test.f90 -o dot_product_test

clean:
	rm -f *.csv *.dat *.mod *.msg *.o *.out *_b.f90 *_bv.f90 *_d.f90 *_dv.f90 *~
