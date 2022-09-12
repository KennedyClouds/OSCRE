//Rokinon 85mm adapter ring

od= 70;   //Diameter of rear AS135mount
id = 64; //Inner Diameter of 85mm adapter
ilen = 11;  //Thickness of AS135mount
olen = 15;  //Total width
$fn = 300; //match fragments in Astroschelle 135 mount (improves smoothness). 
difference(){
//outer cylinder
difference() {

            color("darkred") cylinder(h=olen,r = (od+5)/2.);
            
            union() {
                color("darkgreen")  cylinder(h=olen,r = id/2.);
                color("yellow")  translate([0,0,0])cube([1.5,od+6,olen]);  //remove material for clamping
            }
        }   
//inner cylinder
difference() {

            color("blue") translate([0,0,2]) cylinder(h=ilen,r = (od+5)/2.);  
            color("blue") translate([0,0,2]) cylinder(h=ilen,r = od/2.);
            }
    
} //outer difference 