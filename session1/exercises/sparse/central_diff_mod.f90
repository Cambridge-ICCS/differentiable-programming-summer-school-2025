module central_diff_mod
  implicit none

  private
  public :: central_diff

contains

  ! Central difference approximation for the second derivative of a periodic 1D function
  subroutine central_diff(u, approx, h, n)
    implicit none

    integer, intent(in) :: n                   ! Number of grid points
    real, intent(in) :: h                      ! Uniform grid spacing
    real, dimension(n), intent(in) :: u        ! Input vector
    real, dimension(n), intent(out) :: approx  ! Central difference approximation
    integer :: i                               ! Dummy index for looping

    if (size(u, 1) /= n) then
      print *, "Invalid input array size"
      stop 1
    end if
    if (size(approx, 1) /= n) then
      print *, "Invalid output array size"
      stop 1
    end if

    do i = 1, n
      if (i == 1) then
        ! Periodic boundary on the left
        approx(i) = (u(n) - 2 * u(i) + u(i+1)) / h ** 2
      else if (i == n) then
        ! Periodic boundary on the right
        approx(i) = (u(i-1) - 2 * u(i) + u(1)) / h ** 2
      else
        ! Interior points
        approx(i) = (u(i-1) - 2 * u(i) + u(i+1)) / h ** 2
      end if
    end do

  end subroutine central_diff

end module central_diff_mod
