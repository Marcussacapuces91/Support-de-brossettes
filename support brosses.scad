diam_brossette = 15;
diam_penta = 75;

module pentagone(d, z=0) {
    translate([0,0,z]) cylinder(h=50, d=d, $fn=5);
};

module croix() {
    cube([1,5,22], center=true);
    cube([5,1,22], center=true);
};    

difference() {
    union() {
// Cube central
        pentagone(diam_penta, 0);
// Tubes externes
        for (a=[0:72:72*4]) rotate([0,0,a]) translate([40,0,5]) cylinder(h=25, d=diam_brossette+3);
    }
// Évidement central
    pentagone(diam_penta-3.7, 1.5);
// Évidement tubes
    for (a=[0:72:72*4]) rotate([0,0,a]) translate([40,0,-0.5]) cylinder(h=51, d=diam_brossette);
// Croix centrale
    croix();
}

// Arrondi verticaux
difference() {
    intersection() {
        pentagone(diam_penta, 0);
        for (a=[0:72:72*4]) rotate([0,0,a]) translate([40,0,0]) cylinder(h=50, d=diam_brossette+3);
    }
    for (a=[0:72:72*4]) rotate([0,0,a]) translate([40,0,-0.5]) cylinder(h=51, d=diam_brossette);
}

difference() {
    union() {
// Pieds
        translate([0,0,5]) difference() {
            sphere(d=20);
            croix();
        }
        for (a=[0:72:72*4]) rotate([0,0,a]) translate([40,0,5]) difference() {
            sphere(d=20);
            croix();
        }
    };
    pentagone(75, 0);
    for (a=[0:72:72*4]) rotate([0,0,a]) translate([40,0,0]) cylinder(h=50, d=diam_brossette);
};


// Rondelles
*difference() {
    for (a=[0:72:72*4]) rotate([0,0,a]) difference() {
        translate([40,0,10+0]) cylinder(h=15, d=diam_brossette+5);
        translate([40,0,10-0.5]) cylinder(h=16, d=diam_brossette+3.5);
    };
    pentagone(75.5);
};
    
