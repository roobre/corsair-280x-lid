$fn = 64;

// Lid size
lidH = 141;
lidW = 353;

// Distance from the edges of the holes to the edges of the lid
holeDH = 10;
holeDW = 14.8;

// Diameter of mounting holes
holeDiameter = 9.85;

// Stencil parameters (hand-tuned)
stencilSpacing = 31;
stencilScale = 2.3;

difference() {
    lid();
    holes();
    stencil();
}

module lid(radius=3) {
    minkowski() {
        square([lidW-radius*2, lidH-radius*2], center=true);
        circle(r=radius);
    }
}

module holes() {
    for (i = [-1, 1]) {
        for (j = [-1, 1]) {
            translate([i * (lidW / 2 - holeDiameter / 2 - holeDW), j * (lidH / 2 - holeDiameter / 2 - holeDH)]) circle(d=holeDiameter);
        }
    }
}

module stencil() {
    scale(stencilScale) {
        translate([-stencilSpacing, 0]) mirror([1, 0]) import("res/Teostra.svg", center=true);
        translate([stencilSpacing, 0])  import("res/Lunastra.svg", center=true);
    }
}
