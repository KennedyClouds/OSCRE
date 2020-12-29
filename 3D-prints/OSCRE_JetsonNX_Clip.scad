//Computer clip for Nvidia Xaviar NX
th=4; //thickness
 difference() {
        union() {
        color("yellow") cube([5,111,th-1]); //length, width, height
        color("brown") translate([-5,-3,0]) cube([15,3,25]); //length, width, height
        color("brown") translate([-5,111,0]) cube([15,3,25]); //length, width, height
        }
       
       //make holes for clips 
        color("blue") translate([0,-4,12]) cube([5.2,5,th*2.4]); //length, width, height
        color("blue") translate([0,110,12]) cube([5.2,5,th*2.4]); //length, width, height
    }