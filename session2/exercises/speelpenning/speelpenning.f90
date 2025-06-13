subroutine speelpenning(x, f, n)
  implicit none
  integer, intent(in) :: n
  real, dimension(n), intent(in) :: x
  real, intent(out) :: f
  integer :: i
  f = 1.0
  do i = 1, n
    f = f * x(i)
  end do
end subroutine speelpenning
