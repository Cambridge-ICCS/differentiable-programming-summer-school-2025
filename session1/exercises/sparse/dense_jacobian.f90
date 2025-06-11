include "central_diff_d.f90"

! Program for computing the Jacobian
program dense_jacobian
  implicit none

  integer, parameter :: n = 10
  real, parameter :: h = 1.0

  real, dimension(n) :: u, ud
  real, dimension(n) :: f, fd
  integer :: i

  ! Create a file for writing out the result
  open(unit=10, file="dense_jacobian.dat")

  ! Specify some arbitrary input
  u(:) = 1.0

  ! Set the seed vector to zero initially
  ud(:) = 0.0

  ! Loop over each canonical seed vector and apply the JVP
  do i = 1, n
    ud(i) = 1.0
    call central_diff_d(u, ud, f, fd, h, n)
    ud(i) = 0.0
    write(unit=10, fmt=100) fd
  end do
  100 format(10(f4.1,","))

  ! Don't forget to close the output file
  close(unit=10)

end program dense_jacobian
