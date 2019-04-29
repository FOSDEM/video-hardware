The FOSDEM video hardware project is about (checking the viability of) developing a 100% FOSS & open hardware video streaming platform. Some of the inspiration came from the videobrick [0][1] project.

## Hardware
### Mainboard
We're evaluating the [Olimex A20-Olinuxino-Lime2](https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME2/) as the main board.

### HDMI input
The A20 does not have HDMI input. We're looking into building a custom HDMI input board based upon the [ADV7611](https://www.analog.com/en/products/adv7611.html).

## Software
We plan to take in 720p60 hdmi audio & video via csi. 720p60, because that is the most widely supported resolution/refresh rate combination, and perfectly enough for streaming a conference. The Allwinner "csi" is not proper camera serial interface implementation,so that needs some testing.

The hdmi input gets three destinations:
 * to the projector (with minimal delay!)
 * to the h264 encoder
 * to the lcd for live playback 
 
The video encoding should be possible using the embedded cedrus vpu. The aac audio encoding will have to be cpu based.
    

[0] https://videobrick.wordpress.com/

[1] https://github.com/videobrick
