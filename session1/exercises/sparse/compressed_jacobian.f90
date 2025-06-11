include "central_diff_d.f90"

! Program for computing a tridiagonal Jacobian using compression
program compressed_jacobian
  implicit none

  integer, parameter :: n = 10
  real, parameter :: h = 1.0

  real, dimension(n) :: u, ud
  real, dimension(n) :: f, fd
  real, dimension(n,n) :: jacobian
  integer :: i, j

  ! Specify some arbitrary input
  u(:) = 1.0

  ! Set the seed vector to zero initially
  ud(:) = 0.0

  ! Loop over three offsets
  do i = 1, 3

    ! Apply the JVP to seed vectors based on the offsets
    ud(i::3) = 1.0
    call central_diff_d(u, ud, f, fd, h, n)
    ud(i::3) = 0.0

    ! Decompress rows and insert them into the Jacobian
    j = i
    jacobian(i::3,:) = 0.0
    do while (j <= n)
      if (j == 1) then
        jacobian(j,n) = fd(n)
      else
        jacobian(j,j-1) = fd(j-1)
      end if
      jacobian(j,j) = fd(j)
      if (j == n) then
        jacobian(j,1) = fd(1)
      else
        jacobian(j,j+1) = fd(j+1)
      end if
      j = j + 3
    end do
  end do

  ! Write out the result
  open(unit=10, file="compressed_jacobian.dat")
  do i = 1, n
    write(unit=10, fmt=100) jacobian(i,:)
  end do
  100 format(10(f4.1,","))
  close(unit=10)

end program compressed_jacobian
