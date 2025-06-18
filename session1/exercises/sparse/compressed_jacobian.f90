include "central_diff_d.f90"

! Program for computing a tridiagonal Jacobian using compression
program compressed_jacobian
  implicit none

  integer, parameter :: n = 10
  real, parameter :: h = 1.0

  real, dimension(n) :: u, ud
  real, dimension(n) :: approx, approxd
  real, dimension(3,n) :: seeds
  real, dimension(n,n) :: jacobian
  integer :: i, j

  ! Create a file for writing out the compressed result
  open(unit=10, file="compressed_jacobian.dat")

  ! Specify some arbitrary input
  u(:) = 1.0

  ! Set up a concatenation of the seed vectors as a 2D array
  seeds(:,:) = 0.0
  do i = 1, 3
    seeds(i,i::3) = 1.0
  end do

  ! Loop over three offsets
  do i = 1, 3

    ! Extract the appropriate seed vector
    ud(:) = seeds(i,:)

    ! Propagate the seed vector through forward mode
    call central_diff_d(u, ud, approx, approxd, h, n)

    ! Write the output to file in compressed format
    write(unit=10, fmt=100) approxd

    ! Decompress rows and insert them into the Jacobian
    j = i
    jacobian(i::3,:) = 0.0
    do while (j <= n)
      if (j == 1) then
        jacobian(j,n) = approxd(n)
      else
        jacobian(j,j-1) = approxd(j-1)
      end if
      jacobian(j,j) = approxd(j)
      if (j == n) then
        jacobian(j,1) = approxd(1)
      else
        jacobian(j,j+1) = approxd(j+1)
      end if
      j = j + 3
    end do
  end do
  100 format(10(f4.1,","))
  close(unit=10)

  ! Write out the decompressed Jacobian to file
  open(unit=11, file="decompressed_jacobian.dat")
  do i = 1, n
    write(unit=11, fmt=100) jacobian(i,:)
  end do
  close(unit=11)

end program compressed_jacobian
