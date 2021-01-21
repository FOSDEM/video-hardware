# FOSDEM Video hardware

The FOSDEM video hardware project is about developing a 100% FOSS & open
hardware video streaming platform.

It is meant as a successor to the existing FOSDEM video boxes. These are
relatively bulky and expensive. We're aiming to build a cheap, compact and
lightweight device.

We hope to enable a shared platform with other conferences and projects.

## Status

We have confirmed the viability of the concept, and have produced a handful of
prototype boards. These boards enable us to work on the software stack first.
Once the software is in good shape, we will go back to the hardware drawing
board for the next version of the prototype. This next version will be built
using all the hardware components we are intending to use.

## Hardware
### Mainboard

We're evaluating the [Olimex A20-Olinuxino-Lime2](https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME2/)
as the main board. It's well supported by the mainline linux kernel, thanks to
the efforts of the [linux-sunxi](https://linux-sunxi.org) community.

### HDMI input

The A20 does not have HDMI input. We're looking into building a custom HDMI
input board based upon the
[ADV7611](https://www.analog.com/en/products/adv7611.html). We push the hdmi to
the A20 over csi.

## Software

We plan to take in 720p60 hdmi audio & video. That is the most widely supported
resolution/refresh rate combination. It also hits a sweet spot between video
quality and complexity.

The hdmi input gets three destinations:
 * to the projector (with minimal delay!)
 * to the h264 encoder
 * to the lcd for live playback

The video encoding should be possible using the embedded cedrus vpu. The aac
audio encoding will have to be cpu based.

### Code

The current code can be found in the repositories below:

 * https://github.com/libv/fosdem-video-juggler
 * https://github.com/libv/sun4i-demp
 * https://github.com/libv/sun4i-csi1
 * https://github.com/libv/cedarx_h264_encoder
 * https://github.com/libv/fosdem-video-u-boot
 * https://github.com/libv/fosdem-video-linux

## Thanks

We would like to thank the [videobrick](https://videobrick.wordpress.com/)
[project](https://github.com/videobrick) for their inspiration.

A large part of this project is funded through the
[NGI0 PET Fund](https://nlnet.nl/PET/), a fund established by
[NLnet](https://nlnet.nl/) with financial support from the European Commission's
[Next Generation Internet](https://ngi.eu/) programme, under the aegis of DG
Communications Networks, Content and Technology under grant agreement No 825310.
