subroutine g(z, v)
  implicit none
  real, intent(in)  :: z
  real, intent(out), dimension(2) :: v
  v = [sin(z), cos(z)]
end subroutine g
