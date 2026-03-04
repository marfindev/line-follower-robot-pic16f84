# Line Follower Robot Based on PIC16F84 Microcontroller


<img width="732" height="538" alt="gambar" src="https://github.com/user-attachments/assets/483122f5-58ff-4c58-ab9a-9803608ebdcd" />

*Figure: The complete assembled Line Follower Robot [2].*


## Project Description
This project is the result of my Final Project for the Electrical Engineering Study Program at Universitas Pamulang in 2010 [7]. It demonstrates the design and construction of an autonomous Line Follower Robot driven by servo motors and controlled by a **PIC16F84** microcontroller [9].

## Hardware Components
This project is built using the following core components:
1. **Microcontroller:** PIC16F84 acts as the main control processing system, mounted on a DT-PROTO 18 Pin PIC minimum system [8, 10].
2. **Sensor:** 1 Fotek MR-30XP Photo Sensor (reflective type) to detect the guiding line [8, 11].
3. **Actuators:** 2 Parallax Continuous Servo Motors as the main drive due to their strong torque and stable rotation [12, 13].
4. **Interface:** Sharp PC817 Optocoupler, functioning as the interface bridge between the photo sensor and the microcontroller [8, 14].

## System Architecture

<img width="409" height="306" alt="gambar" src="https://github.com/user-attachments/assets/dc80eb5f-5357-45f8-9771-2def9c34bd30" />

*Figure: Hardware Block Diagram [3].*

<img width="708" height="500" alt="gambar" src="https://github.com/user-attachments/assets/16e95a1b-d89d-4b68-97cc-e3cf0b96726b" />

*Figure: Electronic Circuit Schematic designed in Proteus [1].*


## Logic & Working Principle
The robot is programmed to precisely follow a black line on a white surface using a single sensor configuration [15, 16]:
* **Turn Left (Sensor detects white):** If the sensor detects a white background, the infrared light is reflected, turning on the LED inside the optocoupler and making the transistor turn ON [3, 17]. This gives a *low* logic (approx. 0.12 VDC) to the microcontroller's RA0 input pin [17, 18]. As a result, the robot turns left by keeping Servo 2 active and not activating Servo 1 [19, 20].
* **Move Forward (Sensor detects black line):** If the sensor detects a black background, the optocoupler LED turns OFF, and the transistor is cut off [18, 21]. This gives a *high* logic (5.0 VDC) to the RA0 input pin [21]. As a result, the robot moves straight forward by activating both servo motors simultaneously [19, 20].

<img width="409" height="804" alt="gambar" src="https://github.com/user-attachments/assets/c77ceb9c-0579-4c8d-98ff-985c9d9c6856" />

*Figure: Main Program Flowchart [4].*


## Software & Programming
* **Programming Language:** Assembly Language [22].
* **Compiler:** MPASM is used to compile the source code (.asm) into a Hex file (.hex) ready for execution [23, 24].
* **PWM Generation:** PICDEL software is used to precisely calculate and generate delay cycles (1.5ms and 18ms) to control the continuous servo motors via Pulse Width Modulation (PWM) [25, 26].
* **Program Downloader:** IC-Prog software connected via DT-HiQ PIC ICSP Programmer [6, 27].

## License
[MIT License](LICENSE)
