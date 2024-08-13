import numpy as np
import matplotlib.pyplot as plt

# Function to read the data from a file
def read_data(filename):
    data = np.loadtxt(filename)
    t = data[:, 0]
    x = data[:, 1]
    v = data[:, 2]
    return t, x, v
# the data contains three elements time(t) , angle(x) and velocity(v)

# Read the data from the files
t_euler, x_euler, v_euler = read_data('euler.txt') # read the data of time, angle and velocity from the euler.txt file
t_midpoint, x_midpoint, v_midpoint = read_data('midpoint.txt') # read the data of time, angle and velocity from the euler.txt file


# Plot the angle (x) vs time (t)
plt.figure()
plt.plot(t_euler, x_euler, label='Euler Method')
plt.plot(t_midpoint, x_midpoint, label='Midpoint Method')
plt.xlabel('Time (t)')
plt.ylabel('Angle (x)')
plt.title('Angle vs Time')
plt.legend()
plt.grid(True)
plt.savefig('Angle_vs_time.png') # this saves the plot  as png
plt.show()



# Plot the velocity (v) vs time (t)
plt.figure()
plt.plot(t_euler, v_euler, label='Euler Method')
plt.plot(t_midpoint, v_midpoint, label='Midpoint Method')
plt.xlabel('Time (t)')
plt.ylabel('Velocity (v)')
plt.title('Velocity vs Time')
plt.legend()
plt.grid(True)
plt.savefig('velocity_vs_time.png') # this saves the plot as png
plt.show()

