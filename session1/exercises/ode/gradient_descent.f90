include "theta.f90"
include "theta_d.f90"
include "cost_function_d.f90"

! Program for optimising the theta parameter for a theta timestepping method for solving the ODE
!
!   du/dt = u, u(0)=1
!
! using gradient descent.
program gradient_descent
  implicit none

  integer, parameter :: maxiter = 1000
  real, parameter :: gtol = 1e-05
  real, parameter :: dtol = 1.1
  integer :: i

  real :: theta, thetad
  real :: u, ud
  real :: J, Jd
  real :: J1
  real :: Jd_
  real :: p
  real :: alpha = 0.1

  ! Create a CSV file for output
  open(unit=11, file="optimisation_progress.csv")
  write(unit=11, fmt="('it,theta,J')")

  ! Start from forward Euler
  theta = 0.0

  ! Specify unit seed for the control
  thetad = 1.0

  J = 999

  do i = 1, maxiter
    write(unit=11, fmt=200) i, theta, J
    ! Run the forward model and tangent linear model
    call theta_method_d(theta, thetad, u, ud, "optimised.csv")
    call cost_function_d(u, ud, J, Jd)

    ! Convergence and divergence checks
    if (i == 1) then
      J1 = J
    else if (abs(Jd / Jd_) < gtol) then
      print *, "Detected gradient convergence"
      exit
    else if (abs(J / J1) > dtol) then
      print *, "Detected cost function divergence"
      error stop 1
    end if
    Jd_ = Jd

    ! Take a step in the descent direction
    p = -Jd
    theta = theta + alpha * p
  end do
  200 format(i3,",",f6.4,","e10.4)

  ! Remember to close the CSV file
  close(unit=11)
end program gradient_descent
