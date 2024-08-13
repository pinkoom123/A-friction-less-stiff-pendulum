program pendulum_main

  use pendulum_module  ! The main program uses the module and calls in the euler and midpoint methods
  implicit none

  call euler(0.0_8, 0.1_8, 0.0_8, 0.1_8, 300) ! this calls in the euler method
  call midpoint(0.0_8, 3.0_8, 0.0_8, 0.1_8, 300) ! this calls in the midpoint method

end program pendulum_main


