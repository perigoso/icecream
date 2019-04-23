# icecream

A small open source driver program for the CP2130 to program ice40 fpga's.
This utility uses my <a href="https://github.com/gimbas/cp2130">cp2130 driver</a>.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Compile Prerequisites

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

```
Usage: icecream-c] <input file>
       icecream -r|-R<bytes> <output file>
       icecream -S <input file>
       icecream -t

General options:
  -d <device string>    use the specified USB device [default: i:0x0403:0x6010]
                          i:<vendor>:<product>         (e.g. i:0x0403:0x6010)
  -o <offset in bytes>  start address for read/write [default: 0]
                          (append 'k' to the argument for size in kilobytes
                          or 'M' for size in megabytes)
  -s                    slow SPI (375kHz instead of 12MHz)
  -v                    verbose output

Mode of operation:
  [default]             write file contents to flash, then verify
  -r                    read first 256 kB from flash and write to file
  -R <size in bytes>    read the specified number of bytes from flash
                          (append 'k' to the argument for size in kilobytes
                          or 'M' for size in megabytes)
  -c                    do not write flash, only verify (`check')
  -S                    perform SRAM programming
  -t                    just read the flash ID sequence

Erase mode (only meaningful in default mode):
  [default]             erase aligned chunks of 64kB in write mode
                          This means that some data after the written data (or
                          even before when -o is used) may be erased as well.
  -b                    bulk erase entire flash before writing
  -e <size in bytes>    erase flash as if we were writing that number of bytes
  -n                    do not erase flash before writing
  -p                    disable write protection before erasing or writing
                          This can be useful if flash memory appears to be
                          bricked and won't respond to erasing or programming.

Miscellaneous options:
      --help            display this help and exit
  --                    treat all remaining arguments as filenames

Exit status:
  0 on success,
  1 if a non-hardware error occurred (e.g., failure to read from or write to a file, 
    or invoked with invalid options),
  2 if communication with the hardware failed (e.g., cannot find the USB device),
  3 if verification of the data failed.
```

## Authors

* **Rafael Silva** - [gimbas](https://github.com/crying-face-emoji)

See also the list of [contributors](https://github.com/gimbas/icestorm/graphs/contributors) who participated in this project.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* <a href="http://www.clifford.at/icestorm/">Project icestorm</a> - *IceProg - original programming utility*
