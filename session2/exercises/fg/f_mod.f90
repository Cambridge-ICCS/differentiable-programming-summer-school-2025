module f_mod
  implicit none

  contains

    subroutine f(x, y)
      implicit none
      real, dimension(2), intent(in)  :: x
      real, intent(out) :: y
      y = x(1) * x(2)
    end subroutine f

end module f_mod
