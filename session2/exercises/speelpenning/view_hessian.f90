module diffsizes
  implicit none
  integer, parameter :: nbdirsmax = 7
  integer, parameter :: nbdirsmax0 = 7
end module diffsizes

include "speelpenning_dv_dv.f90"

program view_hessian
  use diffsizes, only: n => nbdirsmax
  implicit none
  real, dimension(n) :: x
  real, dimension(n, n) :: xd0
  real, dimension(n, n) :: xd
  real :: f
  real, dimension(n) :: fd0
  real, dimension(n) :: fd
  real, dimension(n, n) :: fdd
  integer :: i

  ! Arbitrary input
  x(:) = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]

  ! Use identity seed matrices
  xd0(:,:) = 0.0
  xd(:,:) = 0.0
  do i = 1, n
    xd0(i,i) = 1.0
    xd(i,i) = 1.0
  end do

  call speelpenning_dv_dv(x, xd0, xd, f, fd, fdd, n, n, n)

  do i = 1, n
    write(unit=6, fmt=100) fdd(i,:)
  end do
  100 format(f6.1,6(1x,f6.1))
end program view_hessian
