# TASK
Imagine you need to add 4 pairs of 32 bit numbers.

- Build a 32 bit adder using 4*8 bit adders (cascading). Estimate the total time required to add 4 pairs

- Build a 32 bit adder using 4*8 adders using pipelining so that each 8 bit adder can start working on a subset of different pairs


 This Exercise it to showcase the power of parallelism. By doing this I observed that it took 6 clock cycles for parallel adder and 8 clock cycles for serial adder.
<p align="center">
  <img src="https://github.com/pasiramavishan/myImages/blob/main/serial%20adder.jpeg" width="45%" />
  <img src="https://github.com/pasiramavishan/myImages/blob/main/parallel%20adder.png" width="45%" />
</p>
<p align="center">
  <figure>
    <img src="https://github.com/pasiramavishan/myImages/blob/main/serial%20adder.jpeg" width="45%" />
    <figcaption>Serial adder</figcaption>
  </figure>
  <figure>
    <img src="https://github.com/pasiramavishan/myImages/blob/main/parallel%20adder.png" width="65%" />
    <figcaption>Parallel Adder</figcaption>
  </figure>
</p>
