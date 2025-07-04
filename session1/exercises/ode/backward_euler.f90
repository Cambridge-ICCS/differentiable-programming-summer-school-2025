include "theta.f90"

! Program for running the backward Euler method to solve the ODE initial value problem
!   du/dt = u, u(0) = 1
program backward_euler
  implicit none

  real, parameter :: theta = 1.0                        ! Backward Euler corresponds to theta = 1.0
  real :: u                                             ! Solution variable
  char(len=100), parameter :: filename = "backward.csv" ! Filename to save results to

  call theta_method(theta, u, filename)
end program backward_euler
