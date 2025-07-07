! Program for computing and printing the Hessian of the 'speelpenning' test function using two
! applications of forward mode AD
program view_hessian
  use speelpenning_mod_dv_dv, only: speelpenning_dv_dv
  use diffsizes, only: nd => nbdirsmax   ! Number of seed vectors for the first forward propagation
  use diffsizes, only: nd0 => nbdirsmax0 ! Number of seed vectors for the second forward propagation

  implicit none

  integer, parameter :: n = nd    ! Input vector size
  real, dimension(n) :: x         ! Primal input vector
  real, dimension(nd, n) :: xd    ! Seed matrix for first forward propagation
  real, dimension(nd0, n) :: xdd  ! Seed matrix for second forward propagation
  real :: f                       ! Primal output, product of all entries
  real, dimension(nd) :: fd       ! Gradient of the speelpenning function
  real, dimension(nd0, nd) :: fdd ! Hessian of the speelpenning function
  integer :: i                    ! Dummy loop index

  if ((nd /= n) .or. (nd0 /= n)) then
    print *, "Error: input vector size must match number of seed vectors."
    stop 1
  end if

  ! Arbitrary input
  x(:) = [(real(i), i = 1, n)]

  ! Use identity seed matrices
  xd(:,:) = 0.0
  do i = 1, n
    xd(i,i) = 1.0
  end do
  xdd(:,:) = xd

  ! Propagate the seed matrices through the two applications of forward mode
  call speelpenning_dv_dv(x, xdd, xd, f, fd, fdd, n, nd, nd0)

  ! Print the Hessian matrix to the terminal
  do i = 1, nd0
    write(unit=6, fmt=100) fdd(i,:)
  end do
  100 format(f6.1,6(1x,f6.1))

end program view_hessian
