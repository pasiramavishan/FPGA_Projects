#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>

// Function to print binary format of a 32-bit value
void print_binary(unsigned int n) {
    for (int i = 31; i >= 0; i--) {
        printf("%d", (n >> i) & 1);
        if (i % 4 == 0 && i != 0) {
            printf(" "); // Add space every 4 bits for readability
        }
    }
    printf("\n");
}

int main() {
    int fd;                     // File descriptor for the UART
    struct termios options;     // UART configuration structure
    char text[256];             // Buffer to store received data
    int len;                    // Length of received data
    unsigned int received_value = 0;

    // Open the UART device
    fd = open("/dev/serial0", O_RDWR | O_NOCTTY | O_NDELAY);
    if (fd == -1) {
        perror("Unable to open /dev/serial0");
        return 1;
    }
    printf("UART opened successfully.\n");

    // Configure the UART
    tcgetattr(fd, &options);           // Get current settings
    cfsetispeed(&options, B9600);      // Set input baud rate
    cfsetospeed(&options, B9600);      // Set output baud rate
    options.c_cflag = CS8 | CLOCAL | CREAD; // 8 data bits, local connection, enable receiver
    options.c_iflag = IGNPAR;          // Ignore framing and parity errors
    options.c_oflag = 0;               // No output processing
    options.c_lflag = 0;               // No local processing
    tcflush(fd, TCIFLUSH);             // Flush the input buffer
    tcsetattr(fd, TCSANOW, &options);  // Apply the settings

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

        // Assuming 4 bytes are received for a 32-bit number
        if (len >= 4) {
            received_value = (text[0] & 0xFF) | 
                             ((text[1] & 0xFF) << 8) | 
                             ((text[2] & 0xFF) << 16) | 
                             ((text[3] & 0xFF) << 24);
            printf("Received 32-bit value (Decimal): %u\n", received_value);
            printf("Received 32-bit value (Hexadecimal): 0x%08X\n", received_value);
            printf("Received 32-bit value (Binary): ");
            print_binary(received_value);
        } else {
            printf("Insufficient data received for a 32-bit number.\n");
        }
    }

    // Close the UART
    close(fd);
    return 0;
}

