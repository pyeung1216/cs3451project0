# cs3451project0
Computer Graphics Project 0

https://files.t-square.gatech.edu/access/content/attachment/gtc-0bb4-a1ee-5d18-a027-8c20b42c1703/Assignments/6f69189a-11ef-4b8f-99ff-108b7e7474a5/cs3451_warmup_assignment.pdf

Warm-Up Project: Linear Fractals

CS 3451, Spring 2014

The purpose of this project is to calibrate yourself with regard to the difficulty of the programming
assignments of this course. In addition, it will familiarize you with the Processing programming
environment, which we will use for our later projects. This project is due this Thursday (Jan 9) at 10am.
Each hour after this point will cause your grade on the project to drop by 5%, and we will not accept the
project after 3pm that day.

Project Description

You will create an interactive program that will display a linear fractal. Your program will use the position
of the mouse to set the value of a complex number of the form v = (a + bi). Your program will then draw a
large collection of points (or small circles) that are positioned at the locations given by sums of powers of
this value v. In particular, you will calculate truncated sums of an infinite series of powers of v:
0
0 ± v0
0 ± v0 ± v1
0 ± v0 ± v1 ± v2
0 ± v0 ± v1 ± v2 ± v3
The first term of this series represents the position (0,0), which should appear as a point in the center of the
screen. The next term of the series is 0 ± v0, which is the same as the two positions (1,0) and (-1,0). The
next term gives four possible values, and you should draw a separate point for each of these values. The
next term gives eight points, then 16, 32, 64, and so on. Your program should calculate at least the first 10
terms of this series, and plot points for each of these, which corresponds to drawing at least 1023 points.
Calculate powers of v using the standard rules for multiplying complex numbers.

For example v2 = (a + bi) (a + bi) = (a2 – b2) + 2abi, where i = sqrt(-1).

Additional Requirements

To add more variety to the images that you draw, add some kind of color variation to your points (small
circles). You may choose colors based on the positions of the points, based on the truncation depth for the
point, based on whether you are on a positive or negative branch of the series, or anything other scheme of
your own choosing.
The region of the complex plane that you display should encompass at least values in the range of -3 to 3
for both the real and imaginary axes.
You should be continuously reading the mouse location and drawing a new figure based on the mouse
position. Using the mouse location in the window, your program should set the real and complex
components of v. Both components of v should be allowed to be either positive or negative. The easiest
way to achieve this is for the center of the screen to be considered the position (0,0) for purposes of setting
v. The x-coordinate of the mouse should control the real portion of v, and the y-coordinate should set the 
imaginary component. Your program should allow the mouse to give real and complex value of v to be at
least in the range of -2 to 2.
