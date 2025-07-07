all: forward_euler backward_euler gradient_descent

FC = gfortran
TAPENADE = tapenade

.PHONY: all forward_euler backward_euler gradient_descent differentiation clean

# Differentiation steps using Tapenade
differentiation: theta_methods_d.f90 cost_d.f90

theta_methods_d.f90: theta_methods.f90
	$(TAPENADE) theta_methods.f90

cost_d.f90: cost.f90
	$(TAPENADE) cost.f90

# Module dependencies
theta_methods.mod: theta_methods.f90
	$(FC) -c theta_methods.f90

theta_methods_d.mod: theta_methods_d.f90
	$(FC) -c theta_methods_d.f90

cost.mod: cost.f90
	$(FC) -c cost.f90

cost_d.mod: cost_d.f90
	$(FC) -c cost_d.f90

# Executables with their dependencies
forward_euler: forward_euler.f90 theta_methods.mod
	$(FC) forward_euler.f90 theta_methods.o -o forward_euler

backward_euler: backward_euler.f90 theta_methods.mod
	$(FC) backward_euler.f90 theta_methods.o -o backward_euler

gradient_descent: gradient_descent.f90 theta_methods.mod theta_methods_d.mod cost.mod cost_d.mod
	$(FC) gradient_descent.f90 theta_methods.o theta_methods_d.o cost.o cost_d.o -o gradient_descent

clean:
	rm -f *.csv *.dat *.mod *.msg *.o *.out *_b.f90 *_bv.f90 *_d.f90 *_dv.f90 *~
	rm -f forward_euler backward_euler gradient_descent