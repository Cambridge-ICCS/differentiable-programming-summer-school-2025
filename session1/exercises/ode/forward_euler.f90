include "theta.f90"

subroutine initial_condition(u0)
  implicit none
  real, intent(out) :: u0
  u0 = 1
end subroutine initial_condition

program forward_euler
  implicit none

  real, parameter :: dt = 0.1
  real, parameter :: end_time = 1.0
  real, parameter :: theta = 0.0
  real :: t
  real :: u, u_

  ! Create a CSV file for output
  open(unit=10, file="forward.csv")
  write(unit=10, fmt="('t,u')")

  ! Initialisation
  t = 0.0
  call initial_condition(u_)
  write(unit=10, fmt=100) t, u_
  100 format(f4.2,',',f4.2)

  ! Timestepping loop
  do while (t < end_time - 1e-05)
    call theta_method(u, u_, dt, theta)
    u_ = u
    t = t + dt
    write(unit=10, fmt=100) t, u
  end do

  close(unit=10)
end program forward_euler
