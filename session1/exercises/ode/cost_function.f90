! Cost function evaluating the l2 error at the end time against the analytical solution u(t)=exp(t)
subroutine cost_function(u, J)
  implicit none
  real, intent(in) :: u           ! Numerical solution at the end time
  real, intent(out) :: J          ! Cost function value
  real, parameter :: e = exp(1.0) ! The exponential constant, e=2.71828...

  J = (u - e) ** 2
end subroutine cost_function
