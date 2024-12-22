#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <stdint.h> // For uint8_t and uint32_t
#include <errno.h>  // For errno
#include <time.h>   // For nanosleep
#include <sys/select.h> // For fd_set, select, and struct timeval
#include <string.h>

int main() {
    int fd;
    struct termios options;
    char text[256];
    int len; // Typically, `read` returns an integer

    // Open the serial port
    fd = open("/dev/serial0", O_RDWR | O_NDELAY | O_NOCTTY);
    if (fd < 0) {
        perror("Error opening serial port");
        return -1;
    }

    // Configure the serial port
    options.c_cflag = B9600 | CS8 | CLOCAL | CREAD;
    options.c_iflag = IGNPAR;
    options.c_oflag = 0;
    options.c_lflag = 0;
    tcflush(fd, TCIFLUSH);
    tcsetattr(fd, TCSANOW, &options);

    // Variables to store user inputs
    uint32_t hex_value1, hex_value2;

    // Take input for the first 32-bit hexadecimal value
    printf("Enter the first 32-bit hexadecimal value (e.g., 1234ABCD): ");
    scanf("%x", &hex_value1);

    // Take input for the second 32-bit hexadecimal value
    printf("Enter the second 32-bit hexadecimal value (e.g., 89ABCDEF): ");
    scanf("%x", &hex_value2);

    // Split the first 32-bit value into 8-bit chunks
    uint8_t bytes1[4];
    bytes1[0] = (hex_value1 >> 24) & 0xFF; // Most significant byte
    bytes1[1] = (hex_value1 >> 16) & 0xFF;
    bytes1[2] = (hex_value1 >> 8) & 0xFF;
    bytes1[3] = hex_value1 & 0xFF;         // Least significant byte

    // Split the second 32-bit value into 8-bit chunks
    uint8_t bytes2[4];
    bytes2[0] = (hex_value2 >> 24) & 0xFF; // Most significant byte
    bytes2[1] = (hex_value2 >> 16) & 0xFF;
    bytes2[2] = (hex_value2 >> 8) & 0xFF;
    bytes2[3] = hex_value2 & 0xFF;         // Least significant byte

    // Send the first 32-bit value over UART
    int len1 = write(fd, bytes1, 4); // Send all 4 bytes of the first value
    if (len1 < 0) {
        perror("Error writing first value to serial port");
    } else {
        printf("Sent 1st 32-bit hex value: 0x%08X\n", hex_value1);
    }

    // Send the second 32-bit value over UART
    int len2 = write(fd, bytes2, 4); // Send all 4 bytes of the second value
    if (len2 < 0) {
        perror("Error writing second value to serial port");
    } else {
        printf("Sent 2nd 32-bit hex value: 0x%08X\n", hex_value2);
    }

    // Notify user and wait for input
    printf("You have 5 seconds to send me some input data...\n");
    sleep(5);

    // Read from the UART
    memset(text, 0, sizeof(text)); // Clear the buffer
    len = read(fd, text, sizeof(text) - 1);
    if (len < 0) {
        perror("Error reading from UART");
    } else if (len == 0) {
        printf("No data received.\n");
    } else {
        printf("Received %d bytes\n", len);
        printf("Received string: %s\n", text);
    }

    /*
     *
    // Wait for data to be available
    uint8_t rx_buffer[4]; // Buffer to hold received bytes
    ssize_t rx_len;

    printf("Waiting to receive a 32-bit value...\n");

    while (1) {
        fd_set read_fds;
        struct timeval timeout;

        FD_ZERO(&read_fds);
        FD_SET(fd, &read_fds);

        // Set timeout to 1 second
        timeout.tv_sec = 1;
        timeout.tv_usec = 0;

        int retval = select(fd + 1, &read_fds, NULL, NULL, &timeout);

        if (retval == -1) {
            perror("Error during select()");
            break;
        } else if (retval > 0) {
            // Data is available to read
            rx_len = read(fd, rx_buffer, 4);
            if (rx_len < 0) {
                perror("Error reading from serial port");
            } else if (rx_len == 4) {
                // Reassemble the received bytes into a 32-bit value
                uint32_t received_value = (rx_buffer[0] << 24) |
                                          (rx_buffer[1] << 16) |
                                          (rx_buffer[2] << 8) |
                                          rx_buffer[3];
                printf("Received 32-bit hex value: 0x%08X\n", received_value);
                break; // Exit loop after successful read
            } else {
                printf("Incomplete data received. Waiting...\n");
            }
        } else {
            printf("No data available yet. Retrying...\n");
        }
    } */

    close(fd);
    return 0;
}

