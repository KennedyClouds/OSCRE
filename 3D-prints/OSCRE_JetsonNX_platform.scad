//Computer mount for Nvidia Xaviar NX
wb=115/2.;
th=4; // thickness
camht=65;
rotate([0,-90,0]) //to minimize overhangs, speed print. comment out if editing
 difference() {
        union() {
            //base
            color("darkred") cube([110,115,th]); //length, width, height
            //sides
            color("green") translate([0,2,th]) cube([100,5,camht-th]); //l,w,h
            color("green") translate([0,108,th]) cube([100,5,camht-th]); //l,w,h 
            //top
           color("yellow") translate([0,2,camht]) cube([100,111,th*2+2]); //length, width, height
           color("yellow") translate([0,2,camht+2*th]) cube([12,111,th*4]); //length, width, height
            //Side Clips
            color("brown") translate([57,-1,camht+2]) cube([5,5,th*2]); //length, width, height
            color("brown") translate([57,111,camht+2]) cube([5,5,th*2]); //length, width, height
         
            }   

// These parts are subtrated from the above. 
        //Screw holes 
        color("darkgreen") translate([35,wb*2-3,-1]) cylinder(h=th+2,r = 2.2);
        color("darkgreen") translate([35,3,-1]) cylinder(h=th+2,r = 2.2);
        color("darkgreen") translate([35+70,wb*2-3,-1]) cylinder(h=th+2,r = 2.2);
        color("darkgreen") translate([35+70,3,-1]) cylinder(h=th+2,r = 2.2);
        //Makes gap towards back  
        color("darkgreen") translate([35,15,-1]) cube([80,85,th+2]);
        //Just removing material
        color("blue") rotate([90,0,0]) translate([100,camht/2+2,-115]) cylinder(h=115,r = (camht-4)/2.);    
        //Screw hole access 
         color("red") translate([31,wb*2-10,th]) cube([8,10,30]); //for screw access
        color("red") translate([31,0,th]) cube([8,10,30]); //for screw access 
        //Creates inset for Jetson 
        color("yellow") translate([th,1+th,camht+4]) cube([93,105,th+2]); //length, width, height
        color("yellow") translate([th,1+th,camht+7]) cube([10,105,6]);
        //Idention for cables
        color("blue") translate([97,15,camht+7]) cube([3,95,th*2]); //length, width, height  
        //Name and Contact Info
        color("pink")   translate([7,4,camht+16]) rotate ([90,0,90]) linear_extrude(height = 10)     text("OSCRE - aaron.kennedy@und.edu",size=5); 

 }