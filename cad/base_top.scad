base_diameter = 120;

difference() {
    union() {
        translate([0, 0, 0]) cylinder(d = base_diameter, h = 20, $fa = 1.5);
        translate([0, 0, -3]) cylinder(d = base_diameter-10, h = 3, $fa = 1.5);
    }
    
    d = 1000;
    translate([0, 0, d/2]) sphere(d = d, $fa=1.5);
}
