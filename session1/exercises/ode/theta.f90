subroutine theta_method(u, u_, dt, theta)
  ! Single iteration of a theta method for solving the ODE du/dt = u
  implicit none
  real, intent(out) :: u    ! solution at current timestep
  real, intent(in) :: u_    ! solution at previous timestep
  real, intent(in) :: dt    ! Timestep length
  real, intent(in) :: theta ! Theta parameter

  u = u_ * (1 + dt * (1 - theta)) / (1 - dt * theta)
end subroutine theta_method
