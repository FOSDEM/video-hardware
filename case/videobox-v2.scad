module side(w=140, h=140) {
    cube([h,w,2]);
}

module case() {
    color("red", 0.25) union() {
        side(); // bottom
        translate([0,0,138]) { side(); } //top

        translate([2,0,2]) { rotate(-90, [0,140,0]) { side(h=136); } }
        translate([140,0,2]) { rotate(-90, [0,140,0]) { side(h=136); } }
    }
}

module lcd(){
    color("blue")
        cube([76.9, 63.9, 3.26]); //non-touch

}

module limeshield() {
    module connector_hdmi() {
        color("green") cube([15,10,5]);
    }

    module connector_mini_usb() {
        color("green") cube([9,7,4]);
    }

    module connector_usb() {
        color("green") cube([20,15,7]);
    }

    module sdcard() {
        color("green") cube([15,14,2]);
    }

    module header() {
        color("black") cube([2,25,5]);
    }

    cube([60,84,2]);
    translate([25,0,2]) connector_hdmi();
    translate([48,0,2]) connector_mini_usb();
    translate([43,0,-2]) sdcard();

    translate([1,33,2]) header();
    translate([7,25,2]) header();
    translate([48,25,2]) header();
    translate([55,33,2]) header();

    translate([0,0,8]) {
        cube([60,70,2]);
        translate([35,0,2]) connector_usb();
        translate([2,0,2]) connector_hdmi();
    }
}

module audio() {
    module xlr() {
        color("pink") {
            diameter = 23.8;
            depth = 25.4;
            support = 20;
            offset = 2;

            translate([(support/2)+((diameter-support)/2),depth/2,(diameter/2)+offset]) rotate([90,0,0])
                cylinder(h=depth, r=diameter/2, center=true);
            translate([((diameter-support)/2),0,0]) cube([support,depth,support]);
        }
    }
    
    cube([100,80,2]);
    translate([2,0,2]) xlr();
    translate([30,0,2]) xlr();
    translate([72,0,2]) xlr();
}

module switch() {
    module port() {
        color("orange") cube([16,21,13]);
    }
    
    cube([100,60,2]);

    translate([0,0,2]) port();
    translate([18,0,2]) port();
    translate([36,0,2]) port();
    translate([54,0,2]) port();

    translate([3,39,2]) port();
}

module power() {
    module led() {
        color("green") translate([2,2,2]) rotate([90,0,0]) cylinder(h=4, r=2, center=true);
    }

    module powerbutton() {
        color("green") translate([10,5,10]) rotate([90,0,0]) cylinder(h=6, r=8, center=true);
    }

    module dcin() {
        color("black") cube([7,13,10]);
    }

    cube([100,60,2]);

    translate([15,0,2]) led();
    translate([20,0,2]) led();
    translate([25,0,2]) led();

    translate([50,0,2]) dcin();

    translate([70,0,2]) powerbutton();
}

translate([38,0,10]) limeshield();

translate([18,0,40]) audio();

translate([18,0,75]) switch();

translate([18,0,110]) power();

translate([76.9+29.55, 138, 63.9-27]) rotate([270,180,0]) lcd();

case();