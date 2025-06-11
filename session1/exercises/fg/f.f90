subroutine f(x, y, z)
  implicit none
  real, intent(in)  :: x, y
  real, intent(out) :: z
  z = x * y
end subroutine f
