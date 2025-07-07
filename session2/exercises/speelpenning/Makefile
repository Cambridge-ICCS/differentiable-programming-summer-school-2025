all: view_hessian

FC	= gfortran

.PHONY: diffsizes_hessian.mod speelpenning_dv_dv.mod view_hessian

diffsizes_hessian.mod: diffsizes_hessian.f90
	$(FC) -c diffsizes_hessian.f90

speelpenning_dv_dv.mod: speelpenning_dv_dv.f90 diffsizes.mod
	$(FC) -c speelpenning_dv_dv.f90

view_hessian: speelpenning_dv_dv.mod view_hessian.f90
	$(FC) diffsizes_hessian.f90 speelpenning_dv_dv.f90 view_hessian.f90 -o view_hessian

clean:
	rm -f *.csv *.dat *.mod *.msg *.o *.out *_b.f90 *_bv.f90 *_d.f90 *_dv.f90 *~
	rm -f view_hessian
