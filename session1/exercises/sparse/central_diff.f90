! Central difference approximation for the second derivative of a periodic 1D function
subroutine central_diff(u, f, h, n)
  implicit none

  integer, intent(in) :: n
  real, intent(in), dimension(n) :: u
  real, intent(out), dimension(n) :: f
  real, intent(in) :: h

  integer :: i

  if (size(u, 1) /= n) then
    print *, "Invalid input array size"
    stop 1
  end if
  if (size(f, 1) /= n) then
    print *, "Invalid output array size"
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
