//OSCRE Rokinon 85mm / FLIR camera bottom plate v1.0
//https://github.com/KennedyClouds/OSCRE
//1 October 2024 - Aaron Kennedy - aaron.kennedy@und.edu
//Includes functions from https://github.com/JohK/nutsnbolts 
include <cyl_head_bolt.scad>;

$fn = 200*1; //Ensures adequate facets for circular parts
 difference() {
        union() {
            //base
            color("green") cube([120,140,76/2.+5]); //length, width, height
            color("green") translate([37,110,76/2.+5])cube([46,5,5]); //length, width, height
            color("green") translate([37,130,76/2.+5])cube([46,5,5]); //length, width, height
            
            }
            //Cut outs for lens
            color("darkgreen") rotate([90,0,0]) translate([60,76/2.+5,-16]) cylinder(h=16,r = 76/2.);
            color("darkgreen") rotate([90,0,0]) translate([60,73/2.+6.5,-19]) cylinder(h=3,r = 73/2.);
            color("blue") translate([0,19,5]) cube([120,100-19,76/2.+5]); //length, width, height
            //Cut outs for lens mount
            color("blue") translate([0,0,0]) cube([15,19,35]); //length, width, height
            color("blue") translate([0,19,0]) cube([40,81,5]); //length, width, height
            color("blue") translate([105,0,0]) cube([15,19,35]); //length, width, height
            color("blue") translate([80,19,0]) cube([40,81,5]); //length, width, height
            
            
            //Additional cuts
            color("blue") translate([45.5,110,28]) cube([29,50,30]); //length, width, height
            color("red") rotate([90,0,0]) translate([60,76/2.+5,-110]) cylinder(h=10,r = 28/2.);
            color("blue") translate([0,100-19,5]) cube([40,60,76/2.]); //length, width, height           
            color("blue") translate([80,100-19,5]) cube([40,60,76/2.]); //length, width, height
       
            //Mounting holes
            color("darkgreen") translate([60,30,0]) cylinder(h=5,r = 3);
            color("darkgreen") translate([60,50,0]) cylinder(h=5,r = 3);
            color("darkgreen") translate([60,70,0]) cylinder(h=5,r = 3);
            color("darkgreen") translate([60,90,0]) cylinder(h=5,r = 3);
            translate([60,30,2]) rotate([180,0,0]) nutcatch_parallel("M5", clh=0.1);
            translate([60,50,2]) rotate([180,0,0]) nutcatch_parallel("M5", clh=0.1);
            translate([60,70,2]) rotate([180,0,0]) nutcatch_parallel("M5", clh=0.1);
            translate([60,90,2]) rotate([180,0,0]) nutcatch_parallel("M5", clh=0.1);
            
            color("blue") translate([111,105,0]) cube([6,30,5]); //length, width, height
            color("blue") translate([3,105,0]) cube([6,30,5]); //length, width, height
            //holes for lens mount
            color("darkgreen") translate([7,9,30]) cylinder(h=15,r = 3);
            color("darkgreen") translate([113,9,30]) cylinder(h=15,r = 3);
            translate([7,9,35]) rotate([180,0,0]) nutcatch_parallel("M5", clh=0.1);
            translate([113,9,35]) rotate([180,0,0]) nutcatch_parallel("M5", clh=0.1);
            
            
            color("pink") rotate([0,0,90]) translate([101,-95,2]) linear_extrude(height = 3)     text("OSCRE",size=8);
            color("pink") rotate([0,0,90]) translate([105,-105,2]) linear_extrude(height = 3)     text("85mm",size=8);  
 }
 