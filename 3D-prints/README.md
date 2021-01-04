## Documentation for 3D Printing OSCRE components

![banner](https://github.com/KennedyClouds/OSCRE/blob/main/images/3D_complete.png)

Within this directory you will find files that will allow you to print the lens and computer mounts. Files are provided in both [openSCAD](https://www.openscad.org/) format and as STL files. 


## Overview of parts

<img src="https://github.com/KennedyClouds/OSCRE/blob/main/images/3D_lens.png" width="300">

The lensholder is built upon the [Astroschelle](https://github.com/dakloifarwa/Astroschelle-SY135) lens mount for Samyang/Walimex/Rokinon 135mm lenses. The original SCAD file was modified to include a base. 
Included holes allow for adjustability when mounting to housing and other test platforms. The center position is used to mount it within the Dotworkz housing. 

<img src="https://github.com/KennedyClouds/OSCRE/blob/main/images/3D_computer.png" width="300">

The Xavier NX computer mount was built from scratch using my novice SCAD skills. The code isn't pretty, but it works.  Things to note:
* The SCAD file includes a rotation to the build to simplify (reduce overhangs) and shorten printing time.
* Notches on the side of the enclosure allow for the clip to be attached. This prevents the Xavier NX from exiting the platform on accident.
* You will note that tolerances for the unit could be made smaller. I left this in there to minimize issues with 3D printer calibrations. 
* Holes at the rear of the platform base allow for the mount to be screwed to pre-threaded holes in the Dotworkz housing.
* Holes at the midpoint allow for additional attachment to the metal base in the housing, but I haven't used these. 

<img src="https://github.com/KennedyClouds/OSCRE/blob/main/images/3D_clip.png" width="300">

The clip has tighter tolerances in the horizontal to firmly secure it to the platform. Ample vertical tolerance is included to allow it to be attached.

## Tips and Tricks for Printing
* All prints were tested on a budget Creality Ender3 printer in PLA. Except for wall thickness (2mm), default options are used within [Ultimaker Cura](https://ultimaker.com/software/ultimaker-cura) to create the GCODE files from the STLs. 
* If you are a novice to 3D-printing, I like to use wide (3") painters tape on the printer bed to aid adhesion and ease removal. 
* Be careful removing overhangs so parts aren't damaged. This is primarily a concern with the smaller clip. 

Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg
