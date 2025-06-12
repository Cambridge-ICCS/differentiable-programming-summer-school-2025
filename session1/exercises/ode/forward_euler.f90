include "theta.f90"

program forward_euler
  implicit none

  real, parameter :: theta = 0.0
  real :: u

  call theta_method(theta, u, "forward.csv")
end program forward_euler
