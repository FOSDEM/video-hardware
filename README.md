# FOSDEM Video hardware

The FOSDEM video hardware project is about (checking the viability of) developing a 100% FOSS & open hardware video streaming platform.

It is meant as a successor to the existing FOSDEM video boxes. These are relatively bulky and expensive. We're aiming to build a cheap, compact and lightweight device. That's how we hope to enable sharing of hardware, experience and development with other conferences and projects.

We would like to thank the [videobrick](https://videobrick.wordpress.com/) [project](https://github.com/videobrick) for their inspiration. 

## Hardware
### Mainboard
We're evaluating the [Olimex A20-Olinuxino-Lime2](https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME2/) as the main board. It's well supported by the mainline linux kernel, thanks to the efforts of the [linux-sunxi](https://linux-sunxi.org) community.

### HDMI input
The A20 does not have HDMI input. We're looking into building a custom HDMI input board based upon the [ADV7611](https://www.analog.com/en/products/adv7611.html). We push the hdmi to the A20 over csi.

## Software
We plan to take in 720p60 hdmi audio & video. That is the most widely supported resolution/refresh rate combination. It also hits a sweet spot between video quality and complexity.

The hdmi input gets three destinations:
 * to the projector (with minimal delay!)
 * to the h264 encoder
 * to the lcd for live playback 
 
The video encoding should be possible using the embedded cedrus vpu. The aac audio encoding will have to be cpu based.
