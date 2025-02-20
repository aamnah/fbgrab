## Pre-requisites

You need these installed on your system:

- **libpng** : http://www.libpng.org/pub/png/libpng.html
- **libz** : https://zlib.net/

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

## Troubleshooting

If you don't realize how to install splint, remove that row from the Makefile.
