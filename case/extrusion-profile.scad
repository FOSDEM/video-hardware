radius = 3;
width = 140;
height = 140;
thickness = 2;

screw = 2;

rail = 2;

rails_vertical = (height-(thickness-radius)*2)/10-1;
rails_horizontal = (width-(thickness-radius)*2)/10-1;

$fn = 100; 

module corner(radius=radius, thickness=thickness) {
	difference() {
		union() {
			circle(radius);
			translate([0, -radius]) square(radius);
			translate([-radius, 0]) square(radius);
		}

		circle(d=screw);

		rotate([0, 0, -45]) translate([0, radius]) square([screw*0.4, radius*2], center = true);
	}
}

module screwhole(radius=radius) {
	translate([screw/2,0]) difference() {
		circle(radius);
		circle(d=screw);
		translate([-(radius*2) - screw/2, -radius]) square(radius*2);
		translate([-radius, 0]) square([radius*2, screw*0.5], center = true);
	}
}

module edges() {
	// bottom
	translate([-width/2+radius*2, height/2-thickness])
		square([width-(radius*4), thickness]);

	//top
	translate([-width/2+radius*2, -height/2])
		square([width-(radius*4), thickness]);

	// left
	translate([-width/2, -height/2+radius*2])
		square([thickness, height-(radius*4)]);

	// right
	translate([width/2-thickness, -height/2+radius*2])
		square([thickness, height-(radius*4)]);

	// bottom left
	translate([-width/2+radius, height/2-radius]) rotate([0,0,270]) corner();

	// bottom right
	translate([width/2-radius, height/2-radius]) rotate([0,0,180]) corner();

	// top right
	translate([width/2-radius, -height/2+radius]) rotate([0,0,90]) corner();

	// top left
	translate([-width/2+radius, -height/2+radius]) rotate([0,0,0]) corner();
}

module rail() {
	translate([-thickness/2, -(thickness*2+rail)/2]) {
		square([thickness+1, thickness]);
		translate([0, rail+2, 0]) square([thickness+1, thickness]);
	}
}

edges();

for (i=[1:rails_vertical]) {
	// left
	translate([-(width/2)+(thickness/2)+rail-1, -(height/2)+(10*i), 0]) rail();
	// right
	translate([(width/2)-(thickness/2)-rail, -(height/2)+(10*i), 0]) rail();
}

for (i=[1:rails_horizontal]) {
	// bottom
	rotate([0,0,90]) translate([(height/2)-(thickness/2)-rail, (width/2)-(10*i), 0]) rail();

	// top
	rotate([0,0,90]) translate([-(height/2)+(thickness/2)+rail-1, (width/2)-(10*i), 0]) rail();
}

%color("red", 0.25) square([width, height], center=true);