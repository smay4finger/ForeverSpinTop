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