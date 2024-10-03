//OSCRE FLIR camera clip v1.0
//1 October 2024 - Aaron Kennedy - aaron.kennedy@und.edu
include <cyl_head_bolt.scad>;
$fn = 200 *1; //Ensure 
 difference() {
        union() {
            //base
            color("green") cube([45.6,31,22]); //length, width, height           
            }
            color("pink") translate([0,2.8,7])cube([45.6,5.5,10.5]); //length, width, height
            color("pink") translate([0,22.3,7])cube([45.6,5.5,10.5]); //length, width, height
            color("white") translate([2.5,0,2])cube([40.6,31,20]); //length, width, height
             
 }
 