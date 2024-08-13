# A-friction-less-stiff-pendulum
This is a Fortran program that solves an equation of motion for the angle x of a friction-less (stiff) pendulum d^2/dt^2 = - sin(x) using the Euler and the midpoint method.You are to create separate functions fx (t,x,v) and fv(t,x,v) and also create separate subroutines euler (to, x0, vo, dt, N) and midpoint (to, x0, vo,
dt, N).
Create a subroutines  shoul createcreate a file (euler.txt and midpoint.txt) with the result of the computations in three columns: t, x(t), v(t).
• Compute with the Euler method the dynamics for a small initial angle euler (t0=0, x0=0.1, v0=0.0, dt=0.1, N=300) and plot the result. Why is the result clearly
unphysical?
• Use the midpoint method to compute and plot the dynamics for a large initial angle
midpoint (t0=0, x0=3.0, v0=0.0, dt=0.1, N=300).
