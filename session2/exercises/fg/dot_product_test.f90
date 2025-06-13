include "f_d.f90"
include "f_b.f90"

! Program for verifying the consistency of the forward mode and reverse mode derivatives of the
! function f.
program dot_product_test
  implicit none

  real :: x, xd, xb
  real :: y, yd, yb
  real :: z, zd, zb

  real :: result1, result2
  real, parameter :: atol = 1e-05

  ! Set arbitrary primal input
  x = 1.2
  y = -2.3

  ! Call forward mode with some arbitrary seeds
  xd = 4.2
  yd = -0.7
  call f_d(x, xd, y, yd, z, zd)

  ! Choose a seed for reverse mode and evaluate the first result
  zb = 3.0
  result1 = zd * zb

  ! Call reverse mode and evaluate the second result
  xb = 0.0
  yb = 0.0
  call f_b(x, xb, y, yb, z, zb)
  result2 = xd * xb + yd * yb

  ! Check the two results match within the prespecified tolerance
  if (abs(result1 - result2) < atol) then
    write(unit=6, fmt="('PASS')")
  else
    write(unit=6, fmt="('FAIL with atol=',e10.4)") atol
  end if

end program dot_product_test
