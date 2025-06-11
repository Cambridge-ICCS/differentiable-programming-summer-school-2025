! Cost function evaluating the l2 error at the end time against the analytical solution u(t)=exp(t)
subroutine cost_function(u, J)
  implicit none
  real, intent(in) :: u
  real, intent(out) :: J
  real, parameter :: e = exp(1.0)

  J = (u - e) ** 2
end subroutine cost_function
