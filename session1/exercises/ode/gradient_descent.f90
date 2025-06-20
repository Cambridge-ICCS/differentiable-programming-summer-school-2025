include "theta.f90"
include "theta_d.f90"
include "cost_function_d.f90"

! Program for optimising the theta parameter for a theta timestepping method for solving the ODE
!   du/dt = u, u(0)=1
! using gradient descent.
program gradient_descent
  implicit none

  ! Parameters configuring the optimisation method
  integer, parameter :: maxiter = 1000 ! Maximum number of iterations
  real, parameter :: gtol = 1e-05      ! Gradient convergence tolerance
  real, parameter :: dtol = 1.1        ! Cost function divergence tolerance
  real :: alpha = 0.1                  ! Step length

  real :: theta  ! Theta parameter to be optimised
  real :: thetad ! Derivative of theta
  real :: u      ! Forward model state variable
  real :: ud     ! Tangent linear model state variable
  real :: J      ! Cost function value
  real :: Jd     ! Gradient of the cost function
  real :: J_init ! Initial cost function value
  real :: Jd_    ! Gradient at the previous iteration
  real :: p      ! Descent direction
  integer :: i   ! Dummy loop index

  ! Create a CSV file for output
  open(unit=11, file="optimisation_progress.csv")
  write(unit=11, fmt="('it,theta,J')")

  ! Start from forward Euler
  theta = 0.0

  ! Specify unit seed for the control
  thetad = 1.0

  do i = 1, maxiter
    ! Write the current iteration, theta, and cost function value to the CSV file
    write(unit=11, fmt=200) i, theta, J

    ! Run the forward model and tangent linear model
    call theta_method_d(theta, thetad, u, ud, "optimised.csv")
    call cost_function_d(u, ud, J, Jd)

    ! Convergence and divergence checks
    if (i == 1) then
      J_init = J
    else if (abs(Jd / Jd_) < gtol) then
      write(unit=6, fmt="('Converged in ',i0,' iterations due to gradient convergence')") i
      exit
    else if (abs(J / J_init) > dtol) then
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
