//--------------------------------------------------------------------------
lens_type = "SY-135-F2.0"; // lens type options: "SY-135-F2.0", "SY-35-F1.2"
//--------------------------------------------------------------------------

echo("current lens type: ", lens_type);

$fn = 300; // global number of fragments, 300 for final export to STL
min_wt = 3.0; // minimum wall thickness for carrier elements
samyang_h1 = (lens_type == "SY-135-F2.0" ? 50.0 : 47.0); // Samyang lens dimensions
samyang_d1 = (lens_type == "SY-135-F2.0" ? 76.0 : 65.5); // rear ring diameter
samyang_h2 = (lens_type == "SY-135-F2.0" ? 60.0 : 27.0); //
samyang_d2 = (lens_type == "SY-135-F2.0" ? 70.5 : 59.0); // front ring diameter
samyang_d1_chamfer = (lens_type == "SY-135-F2.0" ? (2.0 + min_wt) : (1.0 + 0.3)); // has to be larger than the actually required chamfer
samyang_d2_chamfer = (lens_type == "SY-135-F2.0" ? 1.8 : (1.5 + 0.3));
stiff_dia = 6.0; // stiffener dimensions
stiff_base = 0.1;
 
tube_offset = 5; // offset of the tubering to the dovetail to provide some clearance to the gear wheel
tubering_t = min_wt + 0.5;
tubering_w1 = (lens_type == "SY-135-F2.0" ?  7.0 : 10.0); // width
tubering_w2 = (lens_type == "SY-135-F2.0" ? 13.0 : 10.0);
 
dovetail_wb = 40.0;
dovetail_wt = 40.0;
dovetail_wh = 5.2;
dovetail_l = (lens_type == "SY-135-F2.0" ? 59.0 : 46.5) + tubering_w1 + tubering_w2;
 
lock_upper_w = tubering_w2; // clip
lock_upper_l1 = (lens_type == "SY-135-F2.0" ? 15.0 : 12.0);
lock_upper_l2 = lock_upper_l1 + (samyang_d1 - samyang_d2) / 2;
lock_upper_h = min_wt;
 
lock_lower_w = lock_upper_w; // clip
lock_lower_l2 = lock_upper_l2;
lock_lower_l1 = lock_upper_l1;
 
link_w = tubering_w2; // flexible link
link_l1 = 10.0;
link_l2 = link_l1 + (samyang_d1 - samyang_d2) / 2;
link_h = 4.0;
link_hole_wall = min_wt;
link_hole = tubering_w2 - 2 * link_hole_wall;
link_bolt = link_hole - 1;
bolt_holder_t = min_wt;
clearance_mp = 0.5; // clearance for moving parts
clearance_lock = 3.0; // clearance for lock
 
screwnut_sw = 7.0; // M4 screw nut dimensions
screwnut_h = 3.2 + 0.3; // includes tolerance!
lock_lower_h = screwnut_h + 2 * min_wt;
screwnut_slot_l1 = lock_lower_l1 + 10.0;
screwnut_slot_l2 = lock_lower_l2 + 10.0;
lock_screw = 4.0; // M4 screw
screwnut_hole_lower = lock_screw + 1.0;
screwnut_hole_upper = lock_screw + 0.5;
mh_dia = 2.0; // maintenance hole

THREAD_M4 = 4.0;

// tripod mount:
tm_sw = 25.4 * 9/16; // width across flats
tm_snh = 8.5 + 0.3; // includes tolerance!
tm_hole_dia = 25.4 * 3/8 - 0.5;
tm_slot_length = dovetail_wb/2 + 0.1;
tm_adap_dia = 10.0 + 2 * 0.5; // adapter waist diameter + tolerance
tm_adap_height = 0.7 + 0.1; // adapter waist height + tolerance
tm_wt = 2.0 + tm_adap_height; // wall thickness for screw mount
tm_sl = tm_snh + tm_wt;

module samyang_lens()
{
	cylinder(d=samyang_d2,h=samyang_h2);
	translate([0,0,-samyang_h1]) cylinder(d=samyang_d1,h=samyang_h1);
}
 
module KnurledScrew_Nylon_M4(length)
{
	head_length = 8.1;
	head_dia = 10.5;
	translate([0,0,-length/2]) cylinder(d=THREAD_M4, h=length, center=true); // thread
	translate([0,0,head_length/2]) cylinder(d=head_dia, h=head_length, center=true); // head
}

module dovetail()
{
	wb = dovetail_wb;
	wt = dovetail_wt;
	wh = dovetail_wh;
	length = dovetail_l;
	Rchamfer = 20.0;
	difference()
		{
		union()
			{
      
                difference()
					{
			union(center = true)
				{
					translate([0,0,-wh])
					rotate([90,0,0])
					linear_extrude(height = length, center=true)
					polygon(points = [[-wb*1.43, 0], [+wb*1.43, 0], [+wt*1.43, wh], [-wt*1.43, wh]], center = true);
				}
			union ()
				{
					translate([54,20,-wh-tube_offset+(tm_sl-0.1)/2]) cylinder(d=4, h=tm_sl+0.1, center=true);
                    translate([-54,20,-wh-tube_offset+(tm_sl-0.1)/2]) cylinder(d=4, h=tm_sl+0.1, center=true);  
                    translate([54,10,-wh-tube_offset+(tm_sl-0.1)/2]) cylinder(d=4, h=tm_sl+0.1, center=true);
                    translate([-54,10,-wh-tube_offset+(tm_sl-0.1)/2]) cylinder(d=4, h=tm_sl+0.1, center=true);  
                    translate([54,-10,-wh-tube_offset+(tm_sl-0.1)/2]) cylinder(d=4, h=tm_sl+0.1, center=true);
                    translate([-54,-10,-wh-tube_offset+(tm_sl-0.1)/2]) cylinder(d=4, h=tm_sl+0.1, center=true);
                    translate([54,-20,-wh-tube_offset+(tm_sl-0.1)/2]) cylinder(d=4, h=tm_sl+0.1, center=true);
                    translate([-54,-20,-wh-tube_offset+(tm_sl-0.1)/2]) cylinder(d=4, h=tm_sl+0.1, center=true);   
                    translate([54,0,-wh-tube_offset+(tm_sl-0.1)/2]) cylinder(d=4, h=tm_sl+0.1, center=true);
                    translate([-54,0,-wh-tube_offset+(tm_sl-0.1)/2]) cylinder(d=4, h=tm_sl+0.1, center=true);
                  
                    // tripod hole
//					translate([0,0,-wh-tube_offset+tm_snh/2+tm_wt]) cylinder(d=(tm_sw*2)/sqrt(3), h=tm_snh, center=true, $fn=6); // screw nut
//					translate([tm_slot_length/2,0,-wh-tube_offset+tm_snh/2+tm_wt]) cube([tm_slot_length,tm_sw,tm_snh], center=true); // slot for nut
//					translate([0,0,-wh-tube_offset+(tm_adap_height-0.1)/2]) cylinder(d=tm_adap_dia, h=tm_adap_height+0.1, center=true); // adapter headroom
//					translate([-tm_slot_length/2,0,-wh-tube_offset+tm_snh/2+tm_wt]) rotate([0,90,0]) cylinder(d=2.0, h=tm_slot_length, center=true); // eject hole
				}
			
		}
	if (samyang_d1>=samyang_d2)
		{
			echo("d1>=d2");
			translate([0,-(length-tubering_w1)/2,-wh+tube_offset])
			difference() // first distance holder
				{
					union()
						{
							R1 = (samyang_d1 + 2 * tubering_t) / 2;
							R3 = R1 + Rchamfer;
							x2 = R3 * cos(asin((dovetail_wt / 2 + Rchamfer) / R3));
							x3 = (samyang_d1 + 2 * tubering_t + tube_offset) / 2 - x2;
							x4 = R1 * cos(asin((dovetail_wt / 2 + Rchamfer) / R3));
							x5 = x2 - x4;
							translate([0,0,samyang_d1/4]) cube([wt,tubering_w1,tube_offset+samyang_d1/2], center=true);
							difference() // chamfer
								{
									translate([0,0,x5/2+x3])
									cube([wt+2*Rchamfer,tubering_w1,x5], center=true);
									union()
										{
											translate([(wt+2*Rchamfer)/2,0,x3])
											rotate([90,0,0])
											cylinder(d=2*Rchamfer,h=tubering_w1+0.1, center=true);
											translate([-(wt+2*Rchamfer)/2,0,x3])
											rotate([90,0,0])
											cylinder(d=2*Rchamfer,h=tubering_w1+0.1, center=true);
										}
								}
						}
					translate([0,0,(samyang_d1+2*tubering_t+tube_offset)/2]) rotate([90,0,0]) cylinder(d=samyang_d1+2*tubering_t-0.1, h=tubering_w1+1, center=true);
				}
				
			translate([0,(length-tubering_w2)/2,-wh+tube_offset+(samyang_d1-samyang_d2)/4])
			difference() // second distance holder
				{
					union()
						{
							R2 = (samyang_d2 + 2 * tubering_t) / 2;
							R3 = R2 + Rchamfer;
							x2 = R3 * cos(asin((dovetail_wt / 2 + Rchamfer) / R3));
							x3 = (samyang_d2 + 2 * tubering_t + tube_offset) / 2 - x2 + (samyang_d1 - samyang_d2) / 4;
							x4 = R2 * cos(asin((dovetail_wt / 2 + Rchamfer) / R3));
							x5 = x2 - x4;
							translate([0,0,samyang_d2/4]) cube([wt,tubering_w2,tube_offset+(samyang_d1-samyang_d2)/2+samyang_d2/2], center=true);
							difference() // chamfer
									{
										translate([0,0,x5/2+x3])
										cube([wt+2*Rchamfer,tubering_w2,x5], center=true);
										union()
											{
												translate([(wt+2*Rchamfer)/2,0,x3])
												rotate([90,0,0])
												cylinder(d=2*Rchamfer,h=tubering_w2+0.1, center=true);
												translate([-(wt+2*Rchamfer)/2,0,x3])
												rotate([90,0,0])
												cylinder(d=2*Rchamfer,h=tubering_w2+0.1, center=true);
											}
									}
						}
					translate([0,0,(samyang_d2+(samyang_d1-samyang_d2)/2+2*tubering_t+tube_offset)/2]) rotate([90,0,0]) cylinder(d=samyang_d2+2*tubering_t-0.1, h=tubering_w2+1, center=true);
				}
		}
	else
		{
			echo("d1<d2");
			translate([0,-(length-tubering_w1)/2,-wh+tube_offset+(samyang_d2-samyang_d1)/4])
			difference() // first distance holder
				{
					translate([0,0,samyang_d1/4]) cube([wt,tubering_w1,tube_offset+(samyang_d2-samyang_d1)/2+samyang_d1/2], center=true);
					translate([0,0,(samyang_d1+(samyang_d2-samyang_d1)/2+2*tubering_t+tube_offset)/2]) rotate([90,0,0]) cylinder(d=samyang_d1+2*tubering_t, h=tubering_w1+1, center=true);
				}
			translate([0,(length-tubering_w2)/2,-wh+tube_offset])
			difference() // second distance holder
				{
					translate([0,0,samyang_d2/4]) cube([wt,tubering_w2,tube_offset+samyang_d2/2], center=true);
					translate([0,0,(samyang_d2+2*tubering_t+tube_offset)/2]) rotate([90,0,0]) cylinder(d=samyang_d2+2*tubering_t, h=tubering_w2+1, center=true);
				}
		}
}
	translate([-2,-length/2,-15.5]) rotate([90,0,0]) scale([0.3,0.3,0.025]) surface(file="dakloifarwa.logo.mono.small.png",center=true, invert=true); // logo
	translate([0,+length/2,-12.5]) rotate([270,180,0]) scale([0.2,0.2,0.025]) surface(file="oshwa.certification.de000004.png",center=true, invert=true); // OSHWA cert. mark
	}
}
 
module lower_tubering_1() // lower tr
{
	chmf_offs_r = 0.8; // TODO: dynamic calculation
	chmf_offs_l = (lens_type == "SY-135-F2.0" ? 1.8 : 2.1);
	chmf_rad_l = 5.0;
	chmf_rad_r = chmf_rad_l;
 
	d1=samyang_d1;
	difference()
		{
			union()
				{
					difference()
						{
							difference()
								{
									cylinder(d=d1+2*tubering_t,h=tubering_w1, center=true);
									cylinder(d=d1,h=tubering_w1+0.1, center=true);
								}
							translate([samyang_d1/2,0,0]) cube([samyang_d1,samyang_d1+2*tubering_t+0.1,tubering_w1+0.1], center=true);
						}
					translate([-lock_lower_h/2,d1/2+lock_lower_l1/2,0])
					union() // lower lock extrusion (screw nut holder)
						{
							cube([lock_lower_h,lock_lower_l1,lock_lower_w], center=true);
							translate([0,lock_lower_l1/2,0]) rotate([0,90,0]) cylinder(d=lock_lower_w,h=lock_lower_h, center=true);
						}
					translate([0,-(d1/2+link_l1/2),0])
					rotate([0,90,0])
					difference() // fixed link
						{
							union()
								{
									translate([0,0,-link_w/4]) cube([link_h,link_l1,link_w/2], center=true);
									translate([0,-link_l1/2,0]) rotate([0,90,0]) cylinder(d=link_w,h=link_h, center=true);
								}
							translate([0,-link_l1/2,0]) rotate([0,90,0]) cylinder(d=link_hole,h=link_h+0.1, center=true);
						}
					translate([-link_w/2-chmf_rad_l/2,-(d1/2+chmf_rad_l/2+chmf_offs_l),0])
					rotate([180,0,0])
					difference() // chamfer left
						{
							cube([chmf_rad_l,chmf_rad_l,link_h], center=true);
							translate([-chmf_rad_l/2,chmf_rad_l/2+0,0])  cylinder(d=(2 * chmf_rad_l), h=link_h+0.1, center=true);
						}
					translate([-(lock_lower_h+chmf_rad_r/2),+(d1/2+chmf_rad_r/2+chmf_offs_r),0])
					rotate([180,0,0])
					difference() // chamfer right
						{
							cube([chmf_rad_r,chmf_rad_r,tubering_w1], center=true);
							translate([-chmf_rad_r/2,-chmf_rad_r/2+0,0])  cylinder(d=(2 * chmf_rad_r), h=tubering_w1+0.1, center=true);
						}
				}
			translate([-lock_lower_h/2,d1/2+lock_lower_l1,0])
			rotate([90,0,90])
			cylinder(d=(screwnut_sw*2)/sqrt(3), h=screwnut_h, center=true, $fn=6); // screw nut
			translate([-lock_lower_h/2,d1/2+lock_lower_l1-screwnut_slot_l1/2,0])
			cube([screwnut_h,screwnut_slot_l1,screwnut_sw], center=true); // slot
			translate([-lock_lower_h/2,d1/2+lock_lower_l1,0])
			rotate([90,0,90])
			cylinder(d=screwnut_hole_lower, h=lock_lower_h + 0.1, center=true); // screw hole
			translate([-lock_lower_h/2,d1/2+lock_lower_l1+lock_lower_w/2,0])
			rotate([90,0,0])
			cylinder(d=mh_dia,h=lock_lower_w, center=true); // maintenance hole
		}
}
 
module upper_tubering_1() // upper tr
{
	chmf_offs_r = (lens_type == "SY-135-F2.0" ? 8.1 : 2.6); // TODO: dynamic calculation
	chmf_offs_l = 1.9;
	chmf_rad_l = 5.0;
	
	d1=samyang_d1;
	difference() // clearance for lock
		{
			difference() // clearance for part-in-part
				{
					union()
						{
							difference() // ring
								{
									difference()
										{
											cylinder(d=d1+2*tubering_t,h=tubering_w1, center=true);
											cylinder(d=d1,h=tubering_w1+0.1, center=true);
										}
									translate([samyang_d1/2,0,0]) cube([samyang_d1,samyang_d1+2*tubering_t+0.1,tubering_w1+0.1], center=true);
								}
							union()
								{
									difference()
										{
											union() // bolt holder
												{
													translate([0,d1/2+link_l1,0]) cylinder(d=link_w,h=link_h+2*bolt_holder_t, center=true);
													difference() // chamfer
														{
															translate([-(link_w)/2,d1/2+link_l1/2,0]) cube([(link_w),link_l1,link_h+2*bolt_holder_t],  center=true);
															translate([-(link_w)/2+(-2*link_w/2)+chmf_offs_r/2,d1/2+link_l1+(0),0]) cylinder(d=2*link_w-chmf_offs_r,h=link_h+2*bolt_holder_t+0.1,  center=true);
														}
												}
											translate([0,d1/2+link_l1,0]) cube([3*link_w+0.1,link_w+0.1,link_h+2*clearance_mp], center=true);
										}
									translate([0,d1/2+link_l1,0]) cylinder(d=link_bolt,h=link_h+2*clearance_mp, center=true); // link bolt
								}
						}
					translate([-(clearance_mp-0.1)/2,d1/2+(link_l1-link_w/2)/2-3/2,0]) cube([clearance_mp+0.1,link_l1-link_w/2+3.1,link_h+2*bolt_holder_t+3.1], center=true);
				}
			translate([-(clearance_lock-0.1)/2,-(d1/2+tubering_t-3/2),0]) cube([clearance_lock+0.1,tubering_t+3.1,lock_upper_w+0.1], center=true);
		}
	translate([-lock_upper_h/2-clearance_lock,-(d1/2+lock_upper_l1/2),0])
	rotate([180,0,0])
	difference()
		{
			union() // upper lock extrusion (screw entry)
				{
					cube([lock_upper_h,lock_upper_l1,lock_upper_w], center=true);
					translate([0,lock_upper_l1/2,0]) rotate([0,90,0]) cylinder(d=lock_upper_w,h=lock_upper_h, center=true);
					translate([-(1/2+lock_upper_h/2),lock_upper_l1/2,0]) rotate([0,90,0]) cylinder(d=7, h=1, center = true);
				}
			translate([-1/2,lock_upper_l1/2,0]) rotate([0,90,0]) cylinder(d=screwnut_hole_upper, h=lock_upper_h+1+0.1, center=true);
		}
	translate([-lock_upper_h-chmf_rad_l/2-clearance_lock,-(d1/2+chmf_rad_l/2+chmf_offs_l),0])
	rotate([180,0,0])
	difference() // chamfer
		{
			cube([chmf_rad_l,chmf_rad_l,tubering_w1], center=true);
			translate([-chmf_rad_l/2,chmf_rad_l/2+0,0])  cylinder(d=(2 * chmf_rad_l), h=tubering_w1+0.1, center=true);
		}
}
 
module lower_tubering_2() // lower tr
{
	chmf_offs_r = 0.5; // TODO: dynamic calculation
	chmf_offs_l = (lens_type == "SY-135-F2.0" ? 1.7 : 2.0);
	chmf_rad_l = 5.0;
	chmf_rad_r = chmf_rad_l;
 
	d2=samyang_d2;
	difference()
		{
			union()
				{
					difference()
						{
							difference()
								{
									cylinder(d=d2+2*tubering_t,h=tubering_w2, center=true);
									cylinder(d=d2,h=tubering_w2+0.1, center=true);
								}
							translate([samyang_d2/2,0,0]) cube([samyang_d2,samyang_d2+2*tubering_t+0.1,tubering_w2+0.1], center=true);
						}
					translate([-lock_lower_h/2,d2/2+lock_lower_l2/2,0])
					union() // lock extrusion
						{
							cube([lock_lower_h,lock_lower_l2,lock_lower_w], center=true);
							translate([0,lock_lower_l2/2,0]) rotate([0,90,0]) cylinder(d=lock_lower_w,h=lock_lower_h, center=true);
						}
					translate([0,-(d2/2+link_l2/2),0])
					rotate([0,90,0])
					difference() // fixed link
						{
							union()
								{
									translate([0,0,-link_w/4]) cube([link_h,link_l2,link_w/2], center=true);
									translate([0,-link_l2/2,0]) rotate([0,90,0]) cylinder(d=link_w,h=link_h, center=true);
								}
							translate([0,-link_l2/2,0]) rotate([0,90,0]) cylinder(d=link_hole,h=link_h+0.1, center=true);
						}
					translate([-link_w/2-chmf_rad_l/2,-(d2/2+chmf_rad_l/2+chmf_offs_l),0])
					rotate([180,0,0])
					difference() // chamfer left
						{
							cube([chmf_rad_l,chmf_rad_l,link_h], center=true);
							translate([-chmf_rad_l/2,chmf_rad_l/2+0,0])  cylinder(d=(2 * chmf_rad_l), h=link_h+0.1, center=true);
						}
					translate([-(lock_lower_h+chmf_rad_r/2),+(d2/2+chmf_rad_r/2+chmf_offs_r),0])
					rotate([180,0,0])
					difference() // chamfer right
						{
							cube([chmf_rad_r,chmf_rad_r,tubering_w2], center=true);
							translate([-chmf_rad_r/2,-chmf_rad_r/2+0,0])  cylinder(d=(2 * chmf_rad_r), h=tubering_w2+0.1, center=true);
						}
				}
			translate([-lock_lower_h/2,d2/2+lock_lower_l2,0])
			rotate([90,0,90])
			cylinder(d=(screwnut_sw*2)/sqrt(3), h=screwnut_h, center=true, $fn=6); // screw nut
			translate([-lock_lower_h/2,d2/2+lock_lower_l2-screwnut_slot_l2/2,0])
			cube([screwnut_h,screwnut_slot_l2,screwnut_sw], center=true); // slot
			translate([-lock_lower_h/2,d2/2+lock_lower_l2,0])
			rotate([90,0,90])
			cylinder(d=screwnut_hole_lower, h=lock_lower_h + 0.1, center=true); // screw hole
			translate([-lock_lower_h/2,d2/2+lock_lower_l2+lock_lower_w/2,0])
			rotate([90,0,0])
			cylinder(d=mh_dia,h=lock_lower_w, center=true); // maintenance hole
		}
}
 
module upper_tubering_2() // upper tr
{
	chmf_offs_r = (lens_type == "SY-135-F2.0" ? 0.4 : -10.5); // TODO: dynamic calculation
	chmf_offs_l = 1.9;
	chmf_rad_l = 5.0;
	
	d2=samyang_d2;
	difference()
		{
			union()
				{
					difference() // clearance for lock
						{
							difference() // clearance for part-in-part
								{
									union()
										{
											difference() // ring
												{
													difference()
														{
															cylinder(d=d2+2*tubering_t,h=tubering_w2, center=true);
															cylinder(d=d2,h=tubering_w2+0.1, center=true);
														}
													translate([samyang_d2/2,0,0]) cube([samyang_d2,samyang_d2+2*tubering_t+0.1,tubering_w2+0.1], center=true);
												}
									union()
												{
													difference()
														{
															union() // bolt holder
																{
																	translate([0,d2/2+link_l2,0]) cylinder(d=link_w,h=link_h+2*bolt_holder_t, center=true);
																	difference() // chamfer
																		{
																			translate([-(link_w)/2,d2/2+link_l2/2,0]) cube([(link_w),link_l2,link_h+2*bolt_holder_t],  center=true);
																			translate([-(link_w)/2+(-2*link_w/2)+chmf_offs_r/2,d2/2+link_l2+(0),0]) cylinder(d=2*link_w-chmf_offs_r,h=link_h+2*bolt_holder_t+0.1,  center=true);
																		}
																}
															translate([0,d2/2+link_l2,0]) cube([3*link_w+0.1,link_w+0.1,link_h+2*clearance_mp], center=true);
														}
													translate([0,d2/2+link_l2,0]) cylinder(d=link_bolt,h=link_h+2*clearance_mp, center=true); // link bolt
												}
										}
									translate([-(clearance_mp-0.1)/2,d2/2+(link_l2-link_w/2)/2-3/2,0]) cube([clearance_mp+0.1,link_l2-link_w/2+3.1,link_h+2*bolt_holder_t+3.1], center=true);
								}
							translate([-(clearance_lock-0.1)/2,-(d2/2+tubering_t-3/2),0]) cube([clearance_lock+0.1,tubering_t+3.1,lock_upper_w+0.1], center=true);
						}
					translate([-lock_upper_h/2-clearance_lock,-(d2/2+lock_upper_l2/2),0])
					rotate([180,0,0])
					difference()
						{
							union() // upper lock extrusion (screw entry)
								{
									cube([lock_upper_h,lock_upper_l2,lock_upper_w], center=true);
									translate([0,lock_upper_l2/2,0]) rotate([0,90,0]) cylinder(d=lock_upper_w,h=lock_upper_h, center=true);
									translate([-(1/2+lock_upper_h/2),lock_upper_l2/2,0]) rotate([0,90,0]) cylinder(d=7, h=1, center = true);
								}
							translate([-1/2,lock_upper_l2/2,0]) rotate([0,90,0]) cylinder(d=screwnut_hole_upper, h=lock_upper_h+1+0.1, center=true);
						}
					translate([-lock_upper_h-chmf_rad_l/2-clearance_lock,-(d2/2+chmf_rad_l/2+chmf_offs_l),0])
					rotate([180,0,0])
					difference() // chamfer
						{
							cube([chmf_rad_l,chmf_rad_l,lock_upper_w], center=true);
							translate([-chmf_rad_l/2,chmf_rad_l/2+0,0])  cylinder(d=(2 * chmf_rad_l), h=lock_upper_w+0.1, center=true);
						}
				}
			union() // angle marks
				{
					for (i = [-3:+3])
						{
							rotate([0,0,i*22.5]) translate([-(samyang_d2/2 + tubering_t/2),0,tubering_w2/2]) rotate([0,90,0]) cylinder(d=1.0, h=tubering_t+0.1, center=true);
						}
					for (i = [-3:+3])
						{
							rotate([0,0,i*22.5]) translate([-(samyang_d2/2 + tubering_t/2),0,-tubering_w2/2]) rotate([0,90,0]) cylinder(d=1.0, h=tubering_t+0.1, center=true);
						}
					for (i = [-3:+3])
						{
							rotate([0,0,i*22.5]) translate([-(samyang_d2/2 + tubering_t),0,0]) rotate([0,0,0]) cylinder(d=1.0, h=tubering_w2+0.1, center=true);
						}
				}
		}
}
 
module base()
{
	translate([0,0,-(dovetail_l-tubering_w1)/2]) lower_tubering_1();
	translate([0,0,+(dovetail_l-tubering_w2)/2]) lower_tubering_2();
	if (samyang_d1 >= samyang_d2)
		{
			translate([-(samyang_d1+2*tubering_t)/2,0,0]) rotate([90,0,90]) dovetail();
		}
	else
		{
			translate([-(samyang_d2+2*tubering_t)/2,0,0]) rotate([90,0,90]) dovetail();
			//error = NOT_DEFINED;
		}
}
 
module stiffeners()
{
					hull() // stiffener
						{
							translate([0,0,-(dovetail_l)/2+stiff_base/2+tubering_w1/2+(link_h+2*bolt_holder_t)/2]) rotate([0,0,180]) translate([0,samyang_d1/2+link_l1,0]) cylinder(d=stiff_dia,h=stiff_base, center=true);
							translate([0,0,-(-(dovetail_l)/2+stiff_base/2+tubering_w2/2+(link_h+2*bolt_holder_t)/2)]) rotate([0,0,180]) translate([0,samyang_d2/2+link_l2,0]) cylinder(d=stiff_dia,h=stiff_base, center=true);
						}
					
					hull() // stiffener
						{
							translate([(clearance_lock)+lock_upper_h/2,samyang_d1/2-stiff_dia/2+lock_upper_l1,-(dovetail_l)/2+tubering_w1/2+stiff_base/2+lock_upper_w/2])
							cube([lock_upper_h,stiff_dia,stiff_base], center=true);
							
							translate([(clearance_lock)+lock_upper_h/2,samyang_d2/2-stiff_dia/2+lock_upper_l2,-(-(dovetail_l)/2+tubering_w2/2+stiff_base/2+lock_upper_w/2)])
							cube([lock_upper_h,stiff_dia,stiff_base], center=true);							
						}
}
 
module astroschelle()
{
	tlrnc = (lens_type == "SY-135-F2.0" ? samyang_d1_chamfer : 0.1);
	difference()
		{
			union()
				{
					base();
					color("darkgreen")  translate([0,0,-(dovetail_l-tubering_w1)/2]) rotate([0,0,180]) upper_tubering_1();
					color("darkblue") translate([0,0,+(dovetail_l-tubering_w2)/2]) rotate([0,0,180]) upper_tubering_2();
					stiffeners();
				}
			translate([0,0,-(dovetail_l)/2])
			translate([0,0,(samyang_d1+2*samyang_d1_chamfer)/2/2-tlrnc])
			cylinder(d1=samyang_d1+2*samyang_d1_chamfer, d2=0, h=(samyang_d1+2*samyang_d1_chamfer)/2, center=true);
		
			translate([0,0,dovetail_l/2-tubering_w2])
			translate([0,0,(samyang_d2+2*samyang_d2_chamfer)/2/2-0.1])
			cylinder(d1=samyang_d2+2*samyang_d2_chamfer, d2=0, h=(samyang_d2+2*samyang_d2_chamfer)/2, center=true);
		}
}
 
difference()
{
	union()
		{
			*translate([0,0,10]) color("grey") samyang_lens();
			*translate([7,53,0]) rotate([90,0,90]) KnurledScrew_Nylon_M4(20);
			astroschelle();
		}
	*translate([-100,0,0]) cube([100,100,100]);
	*translate([-100,-50,0]) cube([100,100,100]);
}
