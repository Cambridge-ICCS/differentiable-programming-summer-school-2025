include "theta.f90"

! Program for running the forward Euler method to solve the ODE initial value problem
!   du/dt = u, u(0) = 1
program forward_euler
  implicit none

  real, parameter :: theta = 0.0                       ! Forward Euler corresponds to theta = 0.0
  real :: u                                            ! Solution variable
  character(len=100), parameter :: filename = "forward.csv" ! Filename to save results to

  call theta_method(theta, u, filename)
end program forward_euler
