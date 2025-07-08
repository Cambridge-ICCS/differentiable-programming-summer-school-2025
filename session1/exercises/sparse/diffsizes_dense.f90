! Module containing the nbdirsmax variable required by central_diff_dv
module diffsizes
  implicit none

  private
  public :: nbdirsmax

  integer, parameter :: nbdirsmax = 10000
end module diffsizes
