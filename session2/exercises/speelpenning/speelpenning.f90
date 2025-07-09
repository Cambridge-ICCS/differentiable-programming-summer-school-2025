module speelpenning_mod
  implicit none

  contains

    ! Classic 'speelpenning' test function, which computes the product of all entries of a vector
    subroutine speelpenning(x, f, n)
      implicit none

      integer, intent(in) :: n            ! Size of the input vector
      real, dimension(n), intent(in) :: x ! Input vector
      real, intent(out) :: f              ! Output value, product of all entries
      integer :: i                        ! Dummy loop index

      f = 1.0
      do i = 1, n
        f = f * x(i)
      end do
    end subroutine speelpenning

end module speelpenning_mod
