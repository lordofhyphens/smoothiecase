use <MCAD/nuts_and_bolts.scad>
use <fan_holder_v2.scad>
module fan_cutout() {
  difference() {
  translate([2,2,0])cube([37,37,4]);
  fan_mount(size=40);
  }
  
}
// 0,0 corner is top-down view, opposite usb

// Smoothieboard's own basic dimensions
smoothie_bwidth = 105.20;
smoothie_blength = 130;
cutout_height=13;
hole_r = 3.2/2;

hole_1_x=2.4+hole_r; // compensation because cylinders measure from center
hole_1_y=-2.0+hole_r;

hole_2_x=95+hole_r;
hole_2_y=4.2+hole_r;

hole_3_x=1.9+hole_r;
hole_3_y=hole_1_y+hole_r+hole_r+95.8;

hole_4_x=99.9+hole_r;
hole_4_y=97.4+hole_r;

module mounting_hole() {
  rotate([0,90,0])cylinder(r=2,h=10);
  translate([0,0,24])rotate([0,90,0])cylinder(r=2,h=10);
}

translate([300,300,0])rotate([0,180,0])
{
  translate([0,0,52]) cube([smoothie_bwidth+6, smoothie_blength+6, 3]);
  translate([3,3,50]) difference () {
    cube([smoothie_bwidth, smoothie_blength, 2]);
    translate([1.5,1.5,0])
    cube([smoothie_bwidth-3, smoothie_blength-3, 2]);
  }
}
difference() {
  union() {
  translate([0,0,0]) cube([smoothie_bwidth+6, smoothie_blength+6, 55]);
  }
  translate([3,3,4]) cube([smoothie_bwidth, smoothie_blength, 55]);
  translate([4,4,10])linear_extrude(height=cutout_height)projection()import("Smoothieboard_X5.moved.stl");
  translate([4,3,10]) linear_extrude(height=cutout_height)projection()difference() {
    translate([0,-2,0])import("Smoothieboard_X5.moved.stl");
    translate([0,-2,0]){
      cube([75,20,300]);
      translate([0,20,0])cube([200,400,300]);
      translate([90,0,0]) cube([75,20,300]);
    }
  }
  translate([35,3,5])rotate([90,0,0])fan_cutout();
  translate([3,50,5])rotate([0,-90,0])fan_cutout();
  translate([-2,40,20]) mounting_hole();
  translate([-2,110,20]) mounting_hole();
  translate([20,-2,20]) rotate([0,0,90])mounting_hole();
  translate([100,-2,20]) rotate([0,0,90])mounting_hole();

}
translate([4,7,4])smoothieholes();
*translate([4,3,10])import("Smoothieboard_X5.moved.stl");

module smoothieholes()

{

  translate([hole_1_x,hole_1_y,0]) 
    difference() {
      cylinder(r1=hole_r*2,r2=1.3*hole_r,h=5);
      cylinder(r=hole_r,h=5);
    }
  translate([hole_2_x,hole_2_y,0]) 
    difference() {
      cylinder(r1=hole_r*2,r2=hole_r,h=5);
      cylinder(r=hole_r,h=5);
    }
  translate([hole_3_x,hole_3_y,0]) 
    difference() {
      cylinder(r1=hole_r*2,r2=hole_r,h=5);
      cylinder(r=hole_r,h=5);
    }
  translate([hole_4_x,hole_4_y,0]) 
    difference() {
      cylinder(r1=hole_r*2,r2=hole_r,h=5);
      cylinder(r=hole_r,h=5);
    }
}
