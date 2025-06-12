! Apply the initial condition for the ODE du/dt = u
subroutine initial_condition(u0)
  implicit none
  real, intent(out) :: u0
  u0 = 1
end subroutine initial_condition

! Single iteration of a theta method for solving the ODE du/dt = u
subroutine theta_step(u, u_, dt, theta)
  implicit none
  real, intent(out) :: u    ! solution at current timestep
  real, intent(in) :: u_    ! solution at previous timestep
  real, intent(in) :: dt    ! Timestep length
  real, intent(in) :: theta ! Theta parameter

  u = u_ * (1 + dt * (1 - theta)) / (1 - dt * theta)
end subroutine theta_step

! Solve the ODE du/dt = u using a theta timestepping method, writing the solution trajectory to file
subroutine theta_method(theta, u, filename)
  implicit none

  real, intent(in) :: theta
  real, intent(out) :: u
  character(len=*), intent(in) :: filename
  real, parameter :: dt = 0.1
  real, parameter :: end_time = 1.0
  real :: t
  real :: u_

  ! Create a CSV file for output
  open(unit=10, file=filename)
  write(unit=10, fmt="('t,u')")

  ! Initialisation
  t = 0.0
  call initial_condition(u_)
  write(unit=10, fmt=100) t, u_
  100 format(f4.2,',',f4.2)

  ! Timestepping loop
  do while (t < end_time - 1e-05)
    call theta_step(u, u_, dt, theta)
    u_ = u
    t = t + dt
    write(unit=10, fmt=100) t, u
  end do

  ! Remember to close the CSV file
  close(unit=10)
end subroutine theta_method
