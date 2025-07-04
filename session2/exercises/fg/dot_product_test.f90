include "f_d.f90"
include "f_b.f90"

! Program for verifying the consistency of the forward mode and reverse mode derivatives of the
! function f.
program dot_product_test
  implicit none

  real, dimension(2) :: x   ! Primal input
  real, dimension(2) :: xd  ! Forward mode seed
  real, dimension(2) :: xb  ! Reverse mode derivative
  real :: y                 ! Primal output
  real :: yd                ! Forward mode derivative
  real :: yb                ! Reverse mode seed

  real :: result1                 ! LHS of dot product test
  real :: result2                 ! RHS of dot product test
  real, parameter :: atol = 1e-05 ! Absolute tolerance for the dot product test

  ! Set arbitrary primal input
  x(:) = [1.2, -2.3]

  ! Call forward mode with some arbitrary seeds
  xd(:) = [4.2, -0.7]
  call f_d(x, xd, y, yd)

  ! Choose a seed for reverse mode and evaluate the first result
  yb = 3.0
  result1 = yd * yb

  ! Call reverse mode and evaluate the second result
  xb(:) = [0.0, 0.0]
  call f_b(x, xb, y, yb)
  result2 = sum(xd * xb)

  ! Check the two results match within the prespecified tolerance
  if (abs(result1 - result2) < atol) then
    write(unit=6, fmt="('PASS')")
  else
    write(unit=6, fmt="('FAIL with atol=',e10.4)") atol
  end if

end program dot_product_test
