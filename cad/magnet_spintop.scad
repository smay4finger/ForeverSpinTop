use <spintop.scad>

spintop_height = 70;
spintop_diameter = 60;

magnet_diameter = 19;
magnet_height = 5;

module magnet() {
    union() {
        cylinder(d=magnet_diameter, h=magnet_height, center=true);
        
        helper_length = 2;
        helper_width = 5;
        translate([magnet_diameter/2, helper_width/2, 0]) rotate([90, 0, 0])
            linear_extrude(helper_width) 
                polygon([[0, magnet_height/2], [0, -magnet_height/2], [helper_length, 0]]);
        translate([magnet_diameter/2-helper_width, -helper_width/2, -magnet_height/2])
            cube([helper_width, helper_width, magnet_height]);
    }
}

module magnet_spintop() {
    difference() {
        spintop(d = spintop_diameter, h = spintop_height);
        translate([spintop_diameter/4, 0, 0]) rotate(180) magnet();
        translate([-spintop_diameter/4, 0, 0]) magnet();
    }
}    

mode = "section";

if(mode == "parts") {
    translate([spintop_diameter/2+2, 0, 0])
        intersection() { magnet_spintop(); cylinder(d=spintop_diameter, h=spintop_height*3/4); }
    translate([-spintop_diameter/2-2, 0, 0]) rotate([180, 0, 0])
        intersection() { 
            magnet_spintop(); 
            translate([0, 0, -spintop_height/4]) cylinder(d=spintop_diameter, h=spintop_height/4);
        }
}
else if(mode == "separated") {
    translate([0, 0, 10])
        intersection() { magnet_spintop(); cylinder(d=spintop_diameter, h=spintop_height*3/4); }
    translate([0, 0, -10])
        intersection() { 
            magnet_spintop(); 
            translate([0, 0, -spintop_height/4]) cylinder(d=spintop_diameter, h=spintop_height/4);
        }
}
else if(mode == "section") {
    difference() {
        magnet_spintop();
        translate([-spintop_diameter/2, 0, -spintop_height/4])
            cube([spintop_diameter, spintop_diameter/2, spintop_height]);
    }
}
else {
    magnet_spintop();
}