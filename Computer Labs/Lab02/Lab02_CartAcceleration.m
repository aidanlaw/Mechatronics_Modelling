%Matlab tutorial for Mechatronics Modelling Project 2015
%note that ";" tells matlab to execute the line but not output the result
%if "1+2;" is entered, the result is calculated but not printed

%Given values
max_power       = 100e3;
slope_degrees   = 10;
cart_kmh        = [1:1:7];  %runs the velocity values in increments of 1 up to and including 7
cart_mass       = 20e3;
pulley_diam     = 0.4;

%Initial Calculations
radius          = pulley_diam / 2;
cart_ms         = cart_kmh / 3.6;
angular_vel     = cart_ms / radius;
slope_radians   = slope_degrees * pi / 180;
max_torque      = max_power ./ angular_vel; % "./" is needed to divide a scalar by a vector similar to doing dot product
rope_tension    = max_torque / radius;
gravity         = 9.81;
gravity_load    = gravity * cart_mass * sin(slope_radians);
cart_accel      = (rope_tension - gravity_load) / cart_mass

%plotting a graph
plot(cart_kmh, cart_accel); %plots the resultant data with (kmh,acc) = (x,y)
grid on
title 'Acceleration vs Velocity'
xlabel 'Velocity (km/h)'
ylabel ' Acceleration (m/s^2)'