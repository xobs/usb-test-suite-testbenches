# usb-test-suite-testbenches

This repository contains test and wrapper scripts for USB IP cores, implemented using [cocotb](https://github.com/cocotb/cocotb) and [cocotb_usb](https://github.com/antmicro/usb-test-suite-cocotb-usb).

## Setup

You should use the [parent repository](https://github.com/antmicro/usb-test-suite-build) and follow the steps there to ensure the correct folder structure is maintained. This will also take care of the dependencies.

### Dependencies

* [LiteX](https://github.com/enjoy-digital/litex)
* [iverilog](http://iverilog.icarus.com/)
* python3 and pip
* [cocotb](https://github.com/cocotb/cocotb)
* [cocotb_usb](https://github.com/antmicro/usb-test-suite-cocotb-usb) package

## Usage

Execution is controlled by Makefile. To execute tests with default values, use:

```
make sim
```

Test output is saved to a `results.xml` file. Signal states are stored in `dump.vcd`.

If you want to switch targets, make sure to run `make clean`.

Basic options that can be set:
* `TEST_SCRIPT` - name of script from the *tests* directory to be executed, without the `.py` extension. Default is `test-enum`.
* `TARGET` - IP core to be tested. Currently `valentyusb` (default), `usb1device` and `foboot` are supported.
* `TARGET_OPTIONS` - in case some are availablw in the wrapper script.

Other makefile targets:
* `decode` - export USB transactions to a `usb.pcap` file to be viewed i.e. in Wireshark. USB line states are saved to `usb.vcd`.

For example to run the Windows 10 enumeration test on Foboot core, use:

```
make TARGET=foboot TEST_SCRIPT=test-w10enum sim
```

## Additional setup

Signal traces are saved in the `.vcd` format. They can be viewed using [GTKWave](http://gtkwave.sourceforge.net/).

In order to decode USB signals, sigrok decodes are used. You can obtain `sigrok-cli` and `libsigrokdecode` from [its website](https://sigrok.org) or use a [conda package](https://anaconda.org/symbiflow/sigrok-cli). Note that packages provided by your repository manager may be out-of-date, which can lead to significantly longer decoding times.
