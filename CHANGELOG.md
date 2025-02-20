## 2025-02-20

- Forked from https://github.com/GunnarMonell/fbgrab
- Changed default install location to `/opt`
  - Fixed `Makefile` to work with `/opt` structure
- Updated documentation `README.md`, `CHANGELOG.md`, `INSTALL.md`
- Added install script `install.sh`
- Merged: [Ensure infile is null terminated #17](https://github.com/GunnarMonell/fbgrab/pull/17)

## March 25, 2021. Version 1.5

New in this release is the option to ignore the values in an by the driver incorrectly set alpha channel.

Thanks to @mrtims for providing the patch.

## October 30, 2020. Version 1.4

Stride support. i.e. support for automatic detection and grab from framebuffers where line length differs from resolution.

Thanks to Frank Bauernoeppel.

## April 20, 2020, Version 1.3.3

Fix pixel format report

When fbgrab tells about the framebuffer pixel format, blue and green
are accidentally swapped in 'length' and 'msb_right' columns. Let's
order everything as RGB.

Thanks to Timo Ketola.

## February 12, 2020

- Hosted on github

## June 16, 2015: Version 1.3

Long overdue fixes finally released:

- Added support when active framebuffer is not starting at offset 0
- Fixed broken re-ordering of colors, rgba to argb
- Fixed broken path for man page
- Thanks to Peter Meerwald, David Hill and Konstantinn Bonnet who provided patches

## September 30, 2013: Version 1.2

- Write png file directly to stdout
- Set png compression level with -z
- Several improvements of Makefile for package maintainers and cross compiliation.
- Thanks to Peter Meerwald and Bartlomiej Palmowski who provided good patches!

## May 2013: Version 1.1

- Better handling of framebuffers with non-standard ordering of the colors.
- Now handles framebuffer with larger line length than actually used.
- Now handles supports screenshots where picture is not at the top of the framebuffer, i.e. applications using hardware flips.
- Added -v to provide some verbosity on what fbgrab is doing.
- Now #includes zlib.h to adjust to changes in libpng.
