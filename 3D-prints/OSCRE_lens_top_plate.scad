//OSCRE Rokinon 85mm lens top plate v1.0
//https://github.com/KennedyClouds/OSCRE
//1 October 2024 - Aaron Kennedy - aaron.kennedy@und.edu
include <cyl_head_bolt.scad>;
$fn = 200*1;
rotate([90,0,0])
 difference() {
        union() {
            //base
            color("green") translate([0,-19,35]) cube([120,19,6]); //length, width, height
            color("green") rotate([90,0,0]) translate([60,80/2.+2,0]) cylinder(h=19,r = 80/2.);
            
            }
            
            color("pink") rotate([90,0,0]) translate([60,80/2+2,0]) cylinder(h=16,r = 76/2.);
            color("pink") rotate([90,0,0]) translate([60,80/2+2,16]) cylinder(h=3,r = 73/2.);
            color("pink") translate([0,19,5]) cube([120,100-19,76/2.+5]); //length, width, height
           
            //Mounting holes
            color("white") translate([7,-10,30]) cylinder(h=15,r = 3);
            color("white") translate([113,-10,30]) cylinder(h=15,r = 3);
            color("white") translate([0,-19,80/2.-2]) cube([120,19,50]); //length, width, height
 }
 