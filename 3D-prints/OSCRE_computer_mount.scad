//OSCRE Seeed A206 Jetson board mount
//https://github.com/KennedyClouds/OSCRE
//1 October 2024 - Aaron Kennedy - aaron.kennedy@und.edu
wb=119/2.;
th=3; // thickness
$fn = 200*1;
 difference() {
        union() {
            //base
            color("green") cube([80,119,th]); //length, width, height
            
            //clip connects
            color("green") translate([24,3,0]) cube([6,6,th+17]); //length, width, height
            color("green") translate([24,111,0]) cube([6,6,th+17]); //length, width, height
            
            //mounting posts
            color("green") translate([10+5,13.25,0]) cylinder(h=th+5,r = 3);
            color("green") translate([10+5+58,13.25+92.5,0]) cylinder(h=th+5,r = 3);
            color("green") translate([10+5+58,13.25,0]) cylinder(h=th+5,r = 3);
            color("green") translate([10+5,13.25+92.5,0]) cylinder(h=th+5,r = 3);   
            
            //clip
            color("green") translate([100,0,0]) cube([14,116,th]); //length, width, height
            color("green") translate([100,0,0]) cube([14,3,th+10]); //length, width, height
            color("green") translate([100,113,0]) cube([14,3,th+10]); //length, width, height
            }   

        //Cut-outs 
        //Threaded hole for bottom pieces  
        color("pink") translate([10,wb*2-5.5,-1]) cylinder(h=th+2,r = 2.5);   
        color("pink") translate([10,5.5,-1]) cylinder(h=th+2,r = 2.5);
        color("pink") translate([10+5,13.25,3]) cylinder(h=th+5,r = 1);
        color("pink") translate([10+5+58,13.25+92.5,3]) cylinder(h=th+5,r = 1);
        color("pink") translate([10+5+58,13.25,3]) cylinder(h=th+5,r = 1);
        color("pink") translate([10+5,13.25+92.5,3]) cylinder(h=th+5,r = 1);
            
        //clip connectors    
        color("white") translate([24,2,th]) cube([6,3,13]); //length, width, height
        color("white") translate([24,114,th]) cube([6,3,13]); //length, width, height
     
        //clip    
        color("white") translate([104,0,th]) cube([6,3,5]); //length, width, height
        color("white") translate([104,113,th]) cube([6,3,5]); //length, width, height    
            
 }