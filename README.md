# Number Theory: Addition

By Joshua Richmond and Dylan Duljkovic

## Lab Summary

In this lab, we learned about onehot and binary state machines and implemented them in Verilog. State
machines are circuits that output a value based on its stored "state". A state machine can transition
into a different state based on its inputs and its current stored state. Onehot state machines use a
D-flip-flop to store a single bit that represents each state. So, if a onehot state machine had 5 states,
then it would contain 5 D-flip-flops. A binary state machine, however, stores the current state as a
single binary number, and therefore uses less D-flip-flops at the cost of more complex logic.

## Lab Questions

### Compare and contrast One Hot and Binary encodings

I explained this in the lab summary, but in short, a binary state machine stores its state as a single
binary number, while a onehot state machine stores each state as its own D-flip-flop. Onehot state
machines typically have simpler and faster logic, while binary state machines typically have more
complex and slower logic.

### Which method did your team find easier, and why?

Onehot was far easier than binary due to the very simple logic. We had to set up 3 K-maps for the binary
state machine (one for each bit in the stored state value), but for the onehot state machine the logic was
simple enough that we didn't even need a K-map.

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.

For smaller state machines, binary is likely better due to the decreased number of D-flip-flops. At that
small of a scale, I'm sure the speed difference between onehot and binary is negligible, so the number
of bits is prioritized. However, for larger state machines, speed is prioritized, therefore onehot is
likely better.