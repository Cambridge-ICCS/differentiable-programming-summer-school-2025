all: forward_euler backward_euler gradient_descent

FC = gfortran

.PHONY: all forward_euler backward_euler gradient_descent clean

# Module dependencies
theta_method_mod.mod: theta_method_mod.f90
	$(FC) -c theta_method_mod.f90

theta_method_mod_d.mod: theta_method_mod_d.f90
	$(FC) -c theta_method_mod_d.f90

cost_mod.mod: cost_mod.f90
	$(FC) -c cost_mod.f90

cost_mod_d.mod: cost_mod_d.f90
	$(FC) -c cost_mod_d.f90

# Executables with their dependencies
forward_euler: forward_euler.f90 theta_method_mod.mod
	$(FC) forward_euler.f90 theta_method_mod.o -o forward_euler

backward_euler: backward_euler.f90 theta_method_mod.mod
	$(FC) backward_euler.f90 theta_method_mod.o -o backward_euler

gradient_descent: gradient_descent.f90 theta_method_mod.mod \
	theta_method_mod_d.mod cost_mod.mod cost_mod_d.mod
	$(FC) gradient_descent.f90 theta_method_mod.o theta_method_mod_d.o \
		cost_mod.o cost_mod_d.o -o gradient_descent

clean:
	rm -f *.csv *.dat *.mod *.msg *.o *.out *_b.f90 *_bv.f90 *_d.f90 *_dv.f90 *~
	rm -f forward_euler backward_euler gradient_descent
