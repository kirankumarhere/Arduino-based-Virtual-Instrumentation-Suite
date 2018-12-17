# Arduino-based-Virtual-Instrumentation-Suite

This processing code(ARVIS.pde) runs a GUI and asks the user to select the Arduino's digital and analog pins which will be used. Then it creates the arduino(.ino) file based on the inputs given by the user from GUI. These pins will be used for taking readings which is plotted in software-oscilloscope. The oscilloscope output can be viewed on GUI created by another processing code(oscilloscope.pde).

Note:
1) When oscilloscope.pde runs the arduino should be connected to a COM port.
2)ARVIS.pde and green.jpg should be kept in same processing sketch book folder for the program to run.
