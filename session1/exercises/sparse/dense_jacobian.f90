include "central_diff_d.f90"

! Naive program for computing a tridiagonal Jacobian
program dense_jacobian
  implicit none

  integer, parameter :: n = 10
  real, parameter :: h = 1.0

  real, dimension(n) :: u, ud
  real, dimension(n) :: approx, approxd
  real, dimension(n, n) :: seeds
  integer :: i

  ! Create a file for writing out the result
  open(unit=10, file="dense_jacobian.dat")

  ! Specify some arbitrary input
  u(:) = 1.0

  ! Set up a concatenation of the seed vectors as a 2D array
  seeds(:,:) = 0.0
  do i = 1, n
    seeds(i,i) = 1.0
  end do

  ! Loop over each canonical seed vector and apply the JVP
  do i = 1, n

    ! Extract the appropriate seed vector
    ud(:) = seeds(i,:)

    ! Propagate the seed vector through forward mode
    call central_diff_d(u, ud, approx, approxd, h, n)

    ! Write the output to file
    write(unit=10, fmt=100) approxd
  end do
  100 format(10(f4.1,","))

  ! Don't forget to close the output file
  close(unit=10)

end program dense_jacobian
