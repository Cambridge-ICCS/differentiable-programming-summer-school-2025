! Central difference approximation for the second derivative of a periodic 1D function
subroutine central_diff(u, h, f)
  implicit none

  real, intent(in), dimension(:) :: u
  real, intent(in) :: h
  real, intent(out), dimension(:) :: f

  integer :: i
  integer :: n

  n = size(u, 1)
  if (size(f, 1) /= n) then
    print *, "Mismatching sizes for input and output arrays"
    stop 1
  end if

  do i = 1, n
    if (i == 1) then
      f(i) = (u(n) - 2 * u(i) + u(i+1)) / h ** 2
    else if (i == n) then
      f(i) = (u(i-1) - 2 * u(i) + u(1)) / h ** 2
    else
      f(i) = (u(i-1) - 2 * u(i) + u(i+1)) / h ** 2
    end if
  end do
end subroutine central_diff
