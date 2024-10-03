//OSCRE SVL SXP80 Bracket
//https://github.com/KennedyClouds/OSCRE
//1 October 2024 - Aaron Kennedy - aaron.kennedy@und.edu
//Note: spacers are optional depending on light wiring and tolerances of the enclosure
wb=119/2.;
th=3; // thickness
$fn = 100*1;
 difference() {
        union() {
            //base
            color("green") translate([-45,0,0]) cube([45,119,th]); //length, width, height
            color("green") cube([150,119,th]); //length, width, height
            color("green") translate([-45,wb-(5.4/2),0]) cube([125,5.4,5+th]); //length, width, height
            color("green") translate([-45,wb-(9/2),th+2.5]) cube([125,9,2]);

            color("darkred") translate([155,0,0])cube([10,119,35-12]); //length, width, height //optional bracket
            color("darkred") translate([170,0,0])cube([10,119,30-12]); //length, width, height //optional bracket
            }   

// These parts are subtracted from the above. 

        color("pink") translate([80,15,0])cube([70,85,th]); //length, width, height         
        color("pink") translate([10,wb*2-5.5,-1]) cylinder(h=th+2,r = 2.5);   
        color("pink") translate([10,5.5,-1]) cylinder(h=th+2,r = 2.5);
        color("pink") translate([137,wb*2-5.5,-1]) cylinder(h=th+2,r = 2.5);
        color("pink") translate([137,5.5,-1]) cylinder(h=th+2,r = 2.5);
        color("white")   translate([20,5,2]) linear_extrude(height = 5)     text("OSCRE - SVL SXP80",size=7);
       
        //optional brackets
        color("pink") translate([170,15,10])cube([10,85,35-12]); //length, width, height        
        color("pink") translate([155,15,10])cube([10,85,35-12]); //length, width, height       
        color("pink") translate([160,wb*2-5.5,-1]) cylinder(h=40,r = 2.5);        
        color("pink") translate([175,wb*2-5.5,-1]) cylinder(h=40,r = 2.5);
        color("pink") translate([160,5.5,-1]) cylinder(h=40,r = 2.5);        
        color("pink") translate([175,5.5,-1]) cylinder(h=40,r = 2.5);  
 }