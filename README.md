# icecream

A small open source driver program for the CP2130 to program ice40 fpga's.
This utility uses my <a href="https://github.com/gimbas/cp2130">cp2130 driver</a>.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- You will need root access to a Linux machine.
- You will need to install libusb
```
sudo apt-get install libudev-dev libusb-1.0-0-dev
```

### Compiling

A step by step series of examples that tell you how to get a development environment running

- Clone this repository to your working directory

```
sudo git clone https://github.com/gimbas/icecream
```

- Go to the source directory

```
cd icecream/
```

- Compile

```
make
```

See the [Makefile](Makefile) for more information on compile flags etc.

## Running

- You may need to add the provided udev rules to the /etc/udev/rules.d directory.

```
sudo cp icecream.rules /etc/udev/rules.d
```
- Depending on your user permissions, you might need to run the compilled binary with root access (sudo)

## Authors

* **Rafael Silva** - [gimbas](https://github.com/crying-face-emoji)

See also the list of [contributors](https://github.com/gimbas/icestorm/graphs/contributors) who participated in this project.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* <a href="http://www.clifford.at/icestorm/">Project icestorm</a> - *IceProg - original programming utility*
