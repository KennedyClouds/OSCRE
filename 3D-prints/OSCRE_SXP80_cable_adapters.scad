//OSCRE SVL SXP80 cable adapters v1.0
//https://github.com/KennedyClouds/OSCRE
//1 October 2024 - Aaron Kennedy - aaron.kennedy@und.edu
$fn = 200*1;

 difference() {
        union() {
            //base
            color("green") translate([0,0,0]) cylinder(h=3,r = 20/2.);
            color("green") translate([0,24,0]) cylinder(h=2,r = 20/2.);    
            }   
            color("green") translate([0,0,0])  cylinder(h=3,r = 15.5/2);
            color("green") translate([0,24,0]) cylinder(h=2,r = 12/2.); 
    
 }