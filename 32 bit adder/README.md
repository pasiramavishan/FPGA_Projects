# TASK
Imagine you need to add 4 pairs of 32 bit numbers.

- Build a 32 bit adder using 4*8 bit adders (cascading). Estimate the total time required to add 4 pairs

- Build a 32 bit adder using 4*8 adders using pipelining so that each 8 bit adder can start working on a subset of different pairs


 This Exercise it to showcase the power of parallelism. By doing this I observed that it took 6 clock cycles for parallel adder and 8 clock cycles for serial adder.

<p align="center">
  <table>
    <tr>
      <td>
        <img src="https://github.com/pasiramavishan/myImages/blob/main/serial%20adder.jpeg" width="300px" />
        <br>
        <center>Serial adder</center>
      </td>
      <td>
        <img src="https://github.com/pasiramavishan/myImages/blob/main/serial%20adder%20diagram.jpeg.png" width="300px" />
        <br>
        <center>Two Clock cycles for one addition</center>
      </td>
    </tr>
  </table>
</p>

<p align="center">
  <table>
    <tr>
      <td>
        <img src="https://github.com/pasiramavishan/myImages/blob/main/parallel%20adder.png" width="300px" />
        <br>
        <center>Serial adder</center>
      </td>
      <td>
        <img src="https://github.com/pasiramavishan/myImages/blob/main/prallel%20adder.png" width="300px" />
        <br>
        <center>Two Clock cycles for one addition</center>
      </td>
    </tr>
  </table>
</p>

