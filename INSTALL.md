# Installation

## To build you need:

- zlib
- libpng

To run you have to enable the framebuffer in the linux kernel (if not already enabled). If you don't know how to do it, read the framebuffer howto.

## Script Install

You can either install it manually using `make` and [installation instructions](./INSTALL.md) or use the following command (`wget` or `curl`) to use the provided `install.sh` script

```bash
curl -fsSL https://raw.githubusercontent.com/aamnah/fbgrab/refs/heads/main/install.sh | sudo sh

# -f fail silently on HTTP errors
# -s Silent mode, hide progress bar
# -S Show errors is -s is used
# -L Follow redirects
```

```bash
wget -qO- https://raw.githubusercontent.com/aamnah/fbgrab/refs/heads/main/install.sh | sudo sh

# -q Quite mode (no output)
# -O- Output to stdout instead of a file
```

## Manual install

You need these installed on your system as FBGrab depends on them:

- **libpng** : http://www.libpng.org/pub/png/libpng.html
- **zlib** : https://zlib.net/

```bash
# Ubuntu
sudo apt install libpng-dev zlib1g-dev
```

Plus you need tools that let you compile C code.

```bash
# Ubuntu
sudo apt install build-essential
```

If you're curious, `build-essential` includes these packages:

- `gcc` for compiling programs written in C language,
- `g++` for compiling programs written in C++,
- `make` for reading `Makefile` and instructions for compilation,
- `libc6-dev` for reading library and header files to include, and
- `dpkg-dev` for unzipping, compiling the program for Debian-based systems

## Building and Installing

Inside the directory (where the `Makefile` is), run the following to build the source:

```bash
make
```

and to install the source:

```bash
make install
```

If you want to install to a different directory, use prefix flag like this:

```bash
make prefix=/opt install
```

The default install location is `/usr/local`

## Troubleshooting

If you don't realize how to install splint, remove that row from the Makefile.
