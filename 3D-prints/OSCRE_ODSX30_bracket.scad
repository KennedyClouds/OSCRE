//Computer mount for Nvidia Xaviar NX
wb=115/2.;
th=5; // thickness
//rotate([0,-90,0]) //to minimize overhangs, speed print. comment out if editing
 difference() {
        union() {
            //base
            color("darkred") cube([150,115,th]); //length, width, height
            color("green") translate([75,wb/2,0]) cube([20,60,65]); //length, width, height
            //sides

            }   

// These parts are subtrated from the above. 
        //Screw holes
            rotate([90,0,90])
            {
            color("darkblue") translate([115/2,35,75]) cylinder(h=20,r = 15) ;  
                }
        //Threaded hole    
        color("darkgreen") translate([10,wb*2-3,-1]) cylinder(h=th+2,r = 2.2);
        color("darkgreen") translate([10,3,-1]) cylinder(h=th+2,r = 2.2);
        color("darkgreen") translate([137,wb*2-3,-1]) cylinder(h=th+2,r = 2.2);
        color("darkgreen") translate([137,3,-1]) cylinder(h=th+2,r = 2.2);
       

 }