all: dense_jacobian compressed_jacobian

FC = gfortran

.PHONY: all dense_jacobian compressed_jacobian clean

# Module dependencies
diffsizes_dense.mod: diffsizes_dense.f90
	$(FC) -c diffsizes_dense.f90

diffsizes_compressed.mod: diffsizes_compressed.f90
	$(FC) -c diffsizes_compressed.f90

central_difference_diffv.mod: central_diff_dv.f90 diffsizes_dense.mod
	$(FC) -c central_diff_dv.f90

# Dense jacobian executable
dense_jacobian: dense_jacobian.f90 diffsizes_dense.mod central_difference_diffv.mod
	$(FC) diffsizes_dense.f90 central_diff_dv.f90 dense_jacobian.f90 -o dense_jacobian

# Compressed jacobian executable  
compressed_jacobian: compressed_jacobian.f90 diffsizes_compressed.mod central_difference_diffv.mod
	$(FC) diffsizes_compressed.f90 central_diff_dv.f90 compressed_jacobian.f90 -o compressed_jacobian

clean:
	rm -f *.csv *.dat *.mod *.msg *.o *.out *~
	rm -f central_diff_dv.f90 central_diff_b.f90 central_diff_bv.f90
	rm -f dense_jacobian compressed_jacobian