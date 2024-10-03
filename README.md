## Documentation for the Open Snowflake Camera for Research and Education (OSCRE)

![banner](https://github.com/KennedyClouds/OSCRE/blob/main/images/OSCRE_banner.png)

Welcome to OSCRE! This platform is motivated by the need for open, affordable, and upgradeable/adaptable instrumentation to provide microphysical observations for science and educational goals. As the name implies, OSCRE was originally developed to image falling and blowing snow. Components of the system include:
* Machine vision camera + lens
* LED strobe light
* Computer
* Off-the-shelf housings mounted to a DIY wood structure
* 3D-printed parts
* Connecting cables

Within this repository, you will find all of the information needed to purchase parts and build OSCRE.  Example code to obtain images from the camera are also provided. Contributors are welcomed across all fronts ranging from hardware to software. 

## Overview of Components and Specifications

Parts, prices, and links to purchase are provided here: [Google Sheet](https://docs.google.com/spreadsheets/d/e/2PACX-1vRMlBapCWkLHQBSs0PFnScLlecqJcO5ei3qQ1w7xbT3gDOsDzhMCTewoKGWSilK1sk8NCsqLQS7hyFb/pubhtml) As of 3 October 2024, this is out of date and will be updated soon. 

## Camera and Lens

### *Camera*

<img src="https://github.com/KennedyClouds/OSCRE/blob/main/images/blackflys.png" width="300">

OSCRE uses a **singular** machine vision camera to obtain images of hydrometeors. These types of cameras are lightweight and rugged, making them ideal for industrial applications such as barcode scanning. A variety of manufacturers exist (Basler, FLIR, JAI, Ximea, etc.) and many of them have models that use identical image sensors from manufacturers such as Sony.

In selecting an appropriate camera/sensor, the following considerations were made:

- Affordability (<$1000 USD)
- Imaging performance (CMOS, monochrome, global shutter, noise performance)
- Minimum exposure time <= 10us (can minimize issues with lighting)
- Adequate General Purpose Input/Output (GPIO) control (this provides the signal to the LED light)
- Software compatibility with ARM architecture (Nvidia GPU computers)
- Adequate frame rate (30+fps)
- Connectivity (USB3)

A quick perusal of any of the manufacturers will yield a mind boggling number of choices. The original testbed used a JAI GO-2400M-USB 2.3MP camera, and this is a perfectly acceptable camera for obtaining images. The downside of this camera is a software SDK free for Windows, but requires an expensive (~$500) computer specific license for other architecture. Supposedly this is changing in 2021, but documentation for the 3rd party SDK is also limited.  

Instead, development shifted to FLIR for the model documented herein. The [FLIR Spinnaker SDK](https://www.flir.com/products/spinnaker-sdk/) is available for all platforms which means you could use any computer you already own to drive the system assuming the hardware is adequate. Based on the criteria above, the Blackfly S line was selected. Balancing the requirements, the  [BFS-U3-32S5M-C](https://www.flir.com/products/blackfly-s-usb3/?model=BFS-U3-32S4M-C)  offered the best bang for the buck.  For ~$800, the camera uses the Sony IMX252 monochrome sensor to acquire 3.2MP images at rates up to 118fps. The smaller 1/1.8" sensor is advantageous because it offers a longer focal length for a given resolution, increasing the depth of field compared to larger sensors. 

### *Lens*

<img src="https://github.com/KennedyClouds/OSCRE/blob/main/images/Rokinon_lens.png" width="300">

OSCRE uses a [Rokinon 85mm f1.4 lens](https://www.bhphotovideo.com/c/product/769424-REG/) with manual aperture and focus controls. This is a larger lens designed for traditional Single-Lens Reflex (SLR) cameras. Compared to many (most) machine vision camera lenses, the larger size allows the camera system to only utilize the very center of the optics yielding virtually distortion free images. In other words, a hydrometeor imaged anywhere within the frame will be identical in size. Further, there are no concerns with optical quality (resolution) if the camera is upgraded to a higher resolution sensor in the future. The Rokinon lens is available in a variety of camera mounts but parts are designed for Nikon (F) mount version. Note that the lens requires an [adapter](https://www.amazon.com/Fotodiox-Adapter-Compatible-F-mount-C-mount/dp/B00T0QVLL2/) from the parent mount to the C-mount thread the machine vision camera provides.  

<img src="https://github.com/KennedyClouds/OSCRE/blob/main/images/lens_adapter.png" width="200">

## Computer

OSCRE is driven by NVIDIA GPU computers. Currently, the system is designed upon the reComputers offered by [Seeed Studio](https://www.seeedstudio.com/). Parts based off the dimensions of their A206 carrier board. For a budget friendly build, the [Jetson Nano]([https://www.seeedstudio.com/](https://www.seeedstudio.com/reComputer-J1020-v2-w-o-power-adapter-p-5608.html) can be had for ~$300. If you would like faster processing, the [Orin Nano](https://www.seeedstudio.com/reComputer-J3010-w-o-power-adapter-p-5631.html) is a better option for ~$500. Note that 3rd party power adapters are recommended for wiring purposes. For either of these options, the computer is removed from the Seeed housing and directly mounted to the 3D printed bracket. A m.2 SSD hard drive can be added prior to mounting. A 1TB SSD should be sufficient for most applications. 

## Housings and Structure

OSCRE uses dotworkz S-Type Ring of Fire or Heater Blower Camera Enclosures (ST-RF-MVP or ST-HB-MVP-SS). These housings are waterproof and quite robust... thus far, they have survived winters in North Dakota and Colorado with no weatherproofing issues. The Ring of Fire series is suggested for coldest installs (< -10C). 

## Instructions to build OSCRE
See: [Instructions readme](https://github.com/KennedyClouds/OSCRE/blob/main/Instructions/README.md)

## 3D-printed parts
See: [3D Printing readme](https://github.com/KennedyClouds/OSCRE/blob/main/3D-prints/README.md)

## Connecting cables
See: [Cables readme](https://github.com/KennedyClouds/OSCRE/blob/main/Cables/README.md)

## Software and installation

Coming Soon! Contact me if assistance is needed prior to getting this section online. 

Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg
