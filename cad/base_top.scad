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

difference() {
    union() {
        translate([0, 0, 0]) cylinder(d = base_diameter, h = 20, $fa = 1.5);
        translate([0, 0, -3]) cylinder(d = base_diameter-10, h = 3, $fa = 1.5);
    }
    
    d = 1000;
    translate([0, 0, d/2]) sphere(d = d, $fa=1.5);
}
