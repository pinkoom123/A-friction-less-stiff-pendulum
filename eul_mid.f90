module pendulum_module
  implicit none

  ! Function to calculate dx/dt (velocity) and dv/dt (acceleration)
  public :: fx, fv        ! public ensures that the entities declared can be used outside the module
  ! Subroutines for integration methods
  public :: euler, midpoint

contains

  ! Function to calculate dx/dt, so fx=v is dx/dt (velocity)
  real(8) function fx(t, x, v)
    implicit none
    real(8), intent(in) :: t, x, v
    fx = v               ! fx: The rate of change of the angle x, which is the velocity v.
  end function fx

  ! Function to calculate dv/dt, so fv is dv/dt (acceleration). Meaning second differential of x
  real(8) function fv(t, x, v)
    implicit none
    real(8), intent(in) :: t, x, v
    fv = -sin(x)         ! fv: The rate of change of the velocity v, which is −sin⁡(x).
  end function fv

  ! Euler method subroutine
  subroutine euler(t0, x0, v0, dt, N)
    implicit none
    real(8), intent(in) :: t0, x0, v0, dt
    integer, intent(in) :: N
    real(8) :: t, x, v
    integer :: i

    open(unit=10, file='euler.txt', status='new', action='write')

    t = t0 ! initial time
    x = x0 ! initial angle position
    v = v0 ! initial velocity

    do i = 0, N
      write(10, *) t, x, v
      x = x + dt * fx(t, x, v) ! the new position of the angle = current position plus(+) the rate of change of the position(velocity) multiplying the time step
      v = v + dt * fv(t, x, v)  ! the new velocity = current velocity plus(+) the rate of change of the velocity(acceleration) multiplying the time step
      t = t + dt                ! the new time = current time plus(+) the time step 
    end do

    close(10)
  end subroutine euler

  ! Midpoint method subroutine
  subroutine midpoint(t0, x0, v0, dt, N)
    implicit none
    real(8), intent(in) :: t0, x0, v0, dt
    integer, intent(in) :: N
    real(8) :: t, x, v, x_mid, v_mid
    integer :: i

    open(unit=20, file='midpoint.txt', status='new', action='write')

    t = t0 ! initial time
    x = x0 ! initial angle position
    v = v0 ! initial velocity

    do i = 0, N
      write(20, *) t, x, v
      x_mid = x + 0.5 * dt * fx(t, x, v) ! this gives half of the change in the position over a time step
      v_mid = v + 0.5 * dt * fv(t, x, v) ! the gives half of the change in velocity over a time step 
      
      x = x + dt * fx(t + 0.5 * dt, x_mid, v_mid) ! this computes the rate of change of x, at the midpoint of the current time step, multiplying by dt gives the change in x over a full time step dt.Adding this change to the current x updates x to its new value after advancing one full time step. 
      v = v + dt * fv(t + 0.5 * dt, x_mid, v_mid)  !this computes the rate of change of v, at the midpoint of the current time step, multiplying by dt gives the change in v over a full time step dt. Adding this change to the current v updates v to its new value after advancing one full time step.
      
      t = t + dt
    end do

    close(20)
  end subroutine midpoint

end module pendulum_module

