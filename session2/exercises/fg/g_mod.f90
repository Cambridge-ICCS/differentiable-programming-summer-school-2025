module g_mod
  implicit none

  private
  public :: g

  contains

    subroutine g(y, z)
      implicit none
      real, intent(in) :: y
      real, intent(out), dimension(2) :: z
      z = [sin(y), cos(y)]
    end subroutine g

end module g_mod
