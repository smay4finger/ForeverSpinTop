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

/*
 * this renders a spintop with diameter d (default 100mm) and height h (default 100mm).
 * The diameter of the spintop is only roughly 100mm, as you can see in the imported
 * DXF. If you want to split the spintop in half, do it at 1/4 of it's height. 
 */

module spintop(d = 100, h = 100) {
    scale([d/100, d/100, h/100]) 
        rotate_extrude($fn=50) import("spintop.dxf", layer="0");
}

spintop();
