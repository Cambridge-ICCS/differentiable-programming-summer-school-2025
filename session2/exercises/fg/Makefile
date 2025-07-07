all: dot_product_test

FC	= gfortran

.PHONY: dot_product_test f_mod_b.mod f_mod_d.mod

f_mod_b.mod: f_mod_b.f90
	$(FC) -c f_mod_b.f90

f_mod_d.mod: f_mod_d.f90
	$(FC) -c f_mod_d.f90

dot_product_test: dot_product_test.f90 f_mod_b.mod f_mod_d.mod
	$(FC) dot_product_test.f90 -o dot_product_test f_mod_b.o f_mod_d.o

clean:
	rm -f *.csv *.dat *.mod *.msg *.o *.out *_b.f90 *_bv.f90 *_d.f90 *_dv.f90 *~
	rm -f dot_product_test
