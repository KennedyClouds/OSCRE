## OSCRE Software

This section describes software to operate OSCRE and post-process data. 

## Jetson OS
A user account is required for the [Jetson Download Center](https://developer.nvidia.com/embedded/downloads). Follow instructions for creating a [Xavier NX card image](https://developer.nvidia.com/jetson-nx-developer-kit-sd-card-image). 

## FLIR (2nd gen)
Cameras uses the Spinnaker SDK. Image capture can be controlled via the Spinview graphical GUI or via C+/Python scripts (work in progress). For IOPs, reccomend Spinview as this allows you 
to see images in realtime to make sure settings are correct. 
Download and installation instructions are located [here](https://www.flir.com/products/spinnaker-sdk/). Configuration file coming soon. 

## JAI (1st gen)
An example xml file will be provided for the JAI GO-2400M camera used in the first gen OSCRE. The Pleora graphical GUI works fine and is easier to 
change settings than in Spinview. Documentation for the SDK is poor and in 2020, a license was needed for ARM Linux. As of 3/2021, it appears the eBUS SDK license is now provided for all OS. 

## Post-processing scripts
Coming soon. 

Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg
