all: clean dense compressed

FC	= gfortran

dense:
	$(FC) dense_jacobian.f90 -o dense_jacobian

compressed:
	$(FC) compressed_jacobian.f90 -o compressed_jacobian

clean:
	rm -f *.csv *.dat *.mod *.msg *.o *_b.f90 *_bv.f90 *_d.f90 *_dv.f90 *~
	rm -f dense_jacobian compressed_jacobian
