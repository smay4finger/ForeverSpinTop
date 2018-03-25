/*
    ForeverSpinTop - a spin top that rotates forever
    Copyright (C) 2018  Stefan May

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

base_diameter = 120;
base_height = 26;

module bnc_hole() {
    rotate([0, 90, 0]) difference() {
        cylinder(d = 9.6, h = 10, $fs = 1);
        translate([4.2, -10/2, 0]) cube([1, 10, 10]);
    }
}

module connectors() {
    difference() {
        translate([0, -50/2, 0]) cube([3, 50, 20]);
        translate([-1, -15, 10]) bnc_hole();
        translate([-1, 0, 10]) bnc_hole();
        translate([-1, 15, 10]) rotate([0, 90, 0]) cylinder(d=12, h=10);
    }
}

union() {
    difference() {
        cylinder(d = base_diameter, h = base_height, $fa = 1.5);
        translate([0, 0, 1]) cylinder(d = base_diameter - 20, h = base_height-2.99, $fa = 1.5);
        translate([0, 0, base_height - 3]) cylinder(d = base_diameter - 10, h = 3.1, $fa = 1.5);
        translate([0, -25, 3]) cube([100, 50, 19]);
        
        // ISP stecker 10-polig
        isp_width = 20.7;
        isp_height = 9;
        rotate(45) union() {
            offset = base_height/2-isp_height/2;
            translate([base_diameter/2-10, -isp_width/2, offset]) cube([20, isp_width, isp_height]);
            translate([base_diameter/2-20, -(isp_width-4)/2, offset]) cube([11, isp_width-4, isp_height]);
        }
    }
    
    translate([51.5, 0, 2]) connectors();
    
    // Befestigung Hall-Sensor
    translate([-15, 0, 0]) cylinder(d = 10, h=base_height-3-1.6);
    translate([-15, 0, 1]) cylinder(d1 = 12, d2 = 10, h = 2);

    // Befestigung Elektromagnet 1
    translate([0, -15, 0]) cylinder(d = 10, h=base_height-3-9);
    translate([0, -15, base_height-3-9]) cylinder(d = 5.5, h=9);
    translate([0, -15, 1]) cylinder(d1 = 12, d2 = 10, h = 2);
    
    // Befestigung Elektromagnet 2
    translate([0, 15, 0]) cylinder(d = 10, h=base_height-3-9);
    translate([0, 15, base_height-3-9]) cylinder(d = 5.5, h=9);
    translate([0, 15, 1]) cylinder(d1 = 12, d2 = 10, h = 2);
    
    // Befestigung Elektromagnet 3
    translate([15, 0, 0]) cylinder(d = 10, h=base_height-3-9);
    translate([15, 0, base_height-3-9]) cylinder(d = 5.5, h=9);
    translate([15, 0, 1]) cylinder(d1 = 12, d2 = 10, h = 2);
}
