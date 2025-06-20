! Apply the initial condition for the ODE initial value problem
!   du/dt = u, u(0) = 1
subroutine initial_condition(u0)
  implicit none
  real, intent(out) :: u0   ! Initial condition value
  u0 = 1.0
end subroutine initial_condition

! Single iteration of a theta method for solving the ODE initial value problem
!   du/dt = u, u(0) = 1
subroutine theta_step(u, u_, dt, theta)
  implicit none
  real, intent(out) :: u    ! Solution at current timestep
  real, intent(in) :: u_    ! Solution at previous timestep
  real, intent(in) :: dt    ! Timestep length
  real, intent(in) :: theta ! Theta parameter

  u = u_ * (1 + dt * (1 - theta)) / (1 - dt * theta)
end subroutine theta_step

! Solve the ODE initial value problem
!   du/dt = u, u(0) = 1
! using a theta timestepping method, writing the solution trajectory to file
subroutine theta_method(theta, u, filename)
  implicit none

  real, intent(in) :: theta                ! Theta parameter
  real, intent(out) :: u                   ! Solution at the final time
  character(len=*), intent(in) :: filename ! Output filename
  real, parameter :: dt = 0.1              ! Timestep length
  real, parameter :: end_time = 1.0        ! End time of the simulation
  real :: t                                ! Dummy variable for time
  real :: u_                               ! Lagged solution variable (previous timestep)

  ! Initialisation
  t = 0.0
  call initial_condition(u_)

  ! Create a CSV file and write out the header and initial condition
  open(unit=10, file=filename)
  write(unit=10, fmt="('t,u')")
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
