include "theta.f90"

program backward_euler
  implicit none

  real :: u
  real, parameter :: theta = 1.0

  call theta_method(theta, u, "backward.csv")
end program backward_euler
