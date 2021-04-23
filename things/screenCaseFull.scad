x = 28;
y = 38;
z = 6;
cutout_offset_top=10;
cutout_offset_bot=25;
wall_thickness=2;
topOffset = 0;
notch_y=22.4;
notch_length=19;
notch_width=1.1;
notch_height=1.9;
union(){
difference(){
union(){
difference(){
mirror([0,0,1])linear_extrude(height=40)difference(){
projection()rotate([130,0,0])union(){
rotate([90,0,90])rotate_extrude(angle=90,convexity=10,$fn=10)square([z,x],false);
translate([0,-y,0])rotate([90,0,180])rotate_extrude(angle=90,convexity=10,$fn=30)square([z,y],false);
rotate([0,0,90])rotate_extrude(angle=90,convexity=10)projection()rotate_extrude(angle=90,convexity=10,$fn=30)square([z,x],false);
translate([x,0,0])mirror([1,0,0])union(){
translate([0,-y,0])rotate([90,0,180])rotate_extrude(angle=90,convexity=10,$fn=30)square([z,y],false);
rotate([0,0,90])rotate_extrude(angle=90,convexity=10,$fn=30)projection()rotate_extrude(angle=90,convexity=10,$fn=30)square([z,x],false);
}
translate([x,0,0])mirror([1,0,0])rotate([0,0,90])rotate_extrude(angle=90,convexity=10,$fn=30)projection()rotate_extrude(angle=90,convexity=10,$fn=30)square([z,x],false);
translate([0,-y,0])mirror([0,1,0]){
translate([x,0,0])mirror([1,0,0])rotate([0,90,90])rotate_extrude(angle=180,convexity=10,$fn=30)projection()rotate_extrude(angle=90,convexity=10,$fn=30)square([z,x],false);
rotate([0,90,90])rotate_extrude(angle=180,convexity=10,$fn=30)projection()rotate_extrude(angle=90,convexity=10,$fn=30)square([z,x],false);
rotate([90,90,90])rotate_extrude(angle=180,convexity=10,$fn=30)square([z,x],false);
}
translate([0,0,z])rotate([-180,0,0])screenCase();
}
translate([-z+wall_thickness,-10,0])square([x+2*z-2*wall_thickness,38]);
}
translate([-10,0,0])rotate([130,0,0])mirror([0,1,0])cube([50,60,50]);
translate([-10,-10,-10])cube([50,10,10]);
translate([-10,22,-39.1097])cube([50,10,10]);
}
rotate([130,0,0])union(){
rotate([90,40,90])rotate_extrude(angle=130,convexity=10,$fn=30)square([z,x],false);
translate([0,-y,0])rotate([90,0,180])rotate_extrude(angle=90,convexity=10,$fn=30)square([z,y],false);
rotate([0,40,90])rotate_extrude(angle=180,convexity=10,$fn=30)projection()rotate_extrude(angle=90,convexity=10,$fn=30)square([z,x],false);
translate([x,0,0])mirror([1,0,0])union(){
translate([0,-y,0])rotate([90,0,180])rotate_extrude(angle=90,convexity=10,$fn=30)square([z,y],false);
}
translate([x,0,0])mirror([1,0,0])rotate([0,40,90])rotate_extrude(angle=180,convexity=10,$fn=30)projection()rotate_extrude(angle=90,convexity=10,$fn=30)square([z,x],false);
translate([0,-y,0])mirror([0,1,0]){
translate([x,0,0])mirror([1,0,0])rotate([0,90,90])rotate_extrude(angle=180,convexity=10,$fn=30)projection()rotate_extrude(angle=90,convexity=10,$fn=30)square([z,x],false);
rotate([0,90,90])rotate_extrude(angle=180,convexity=10,$fn=30)projection()rotate_extrude(angle=90,convexity=10,$fn=30)square([z,x],false);
rotate([90,90,90])rotate_extrude(angle=180,convexity=10,$fn=30)square([z,x],false);
}
translate([0,0,z])rotate([-180,0,0])screenCase();
}
difference(){
mirror([0,1,0])rotate([90,0,0])linear_extrude(height=29.1097)projection(){
translate([x,0,0])mirror([1,0,0])rotate([0,90,90])rotate_extrude(angle=180,convexity=10,$fn=30)projection()rotate_extrude(angle=90,convexity=10,$fn=30)square([z,x],false);
rotate([0,90,90])rotate_extrude(angle=180,convexity=10,$fn=30)projection()rotate_extrude(angle=90,convexity=10,$fn=30)square([z,x],false);
rotate([90,90,90])rotate_extrude(angle=180,convexity=10,$fn=30)square([z,x],false);
}
translate([0,0,-wall_thickness])cube([x,y,z]);
}
}
mirror([0,0,1])translate([-10,25,-10])cube([x+30,y,29.1097-cutout_offset_top+10]);
}
translate([-z-notch_height,notch_y,-notch_length])cube([notch_height,notch_width,notch_length]);
translate([z+x,notch_y,-notch_length])cube([notch_height,notch_width,notch_length]);
}
// uncomment below to see screen model in position
// translate([(x - screenX)/2, (y - screenY)/2 + topOffset, 2])
//   screen();

module screenCase() {
  difference() {
    cube([x, y, z]);
    translate([1, 1, -0.1]) {
      cube([x-2, y-2, z+1]);
    }
  }
  windowPanel(x, y, 1.5, topOffset);
  side = 5;
  screwBase(0, 0, side);
  screwBase(x - side, 0, side);
  screwBase(0, y - side, side);
  screwBase(x - side, y - side, side);
}

module screwBase(x, y, side) {
  translate([x, y, 0]) {
    difference() {
      cube([side, side, z]);
      translate([side/2, side/2, 1])
        cylinder(d=2.5, h = 10, $fn=20);
    }
    
  }
  
}

// Oled screen panel

// Screen dimensions (may vary a little)
screenX = 24.8;
screenY = 26.8;

// Dimensions between holes axis
xInterHole = 20.3;
yInterHole = 22.8;

// Dimensions of the window in the panel
xWindow = 24.8;
yWindow = 16.5;
yWindowoffset = 0;

// Some offset
xHoleCenter = 0.1;
yHoleCenter = 0;

//windowPanel(45, 45, 2, 6);

module windowPanel(x, y, z, yOffset) {
  xPanel = x;
  yPanel = y;
  zPanel = z;
  
  difference() {
    oledPanel(xPanel, yPanel, zPanel, yOffset);
    translate([(xPanel - xWindow)/2, (yPanel - yWindow)/2 + yWindowoffset + yOffset, -zPanel/2]) {
      // opening
      cube([xWindow, yWindow, 2 * zPanel]);  
    }
  }
}


module oledPanel(xPanel, yPanel, zPanel, yOffset) {   
  xMargin = xPanel - xInterHole;
  yMargin = yPanel - yInterHole;
  difference() {
    union() {
      cube([xPanel, yPanel, zPanel]);  
      pillar(xHoleCenter, yHoleCenter + yOffset, xMargin, yMargin, zPanel);
      pillar(xHoleCenter + xInterHole, yHoleCenter + yOffset, xMargin, yMargin, zPanel);
      pillar(xHoleCenter, yHoleCenter + yInterHole + yOffset, xMargin, yMargin, zPanel);
      pillar(xHoleCenter + xInterHole, yHoleCenter + yInterHole + yOffset, xMargin, yMargin, zPanel);
    }
    // cut the base of pillars
    translate([(xMargin - yInterHole)/2,  yMargin/2+1 + yOffset, zPanel]) {
      cube([xInterHole *2, yInterHole - 2, 3]);
    }
  }
}

// To fix the Oled
module pillar(x, y, xMargin, yMargin, zPanel) {
  echo (x, y, xMargin, yMargin, zPanel);
  translate([x + xMargin/2, y + yMargin/2, zPanel]) {
    cylinder(d=2.5, h=5, $fn=50);
    cylinder(d=4, h=1.5, $fn=50);
  }
    
}

// Screen model to make simulations
module screen() {
  screenY2 = 19;
  z1 = 1.2;
  z2 = 1.5;
  sBottomOffset = 3.7;

  xMargin = screenX - xInterHole;
  yMargin = screenY - yInterHole;
  
  translate([0, sBottomOffset, 0]) {
    cube([screenX, screenY2, z2]);
  }
  translate([0, 0, z2]) {
    difference() {
      cube([screenX, screenY, z1]);
      hole(xHoleCenter, yHoleCenter, xMargin, yMargin, z1);
      hole(xHoleCenter + xInterHole, yHoleCenter, xMargin, yMargin, z1);
      hole(xHoleCenter, yHoleCenter + yInterHole, xMargin, yMargin, z1);
      hole(xHoleCenter + xInterHole, yHoleCenter + yInterHole, xMargin, yMargin, z1);
      // pin placeholders
      translate([(screenX - 11)/2, screenY-3, z1 - 0.1]) {
        cube([11, 2.6, 1]);
      }
    }
  }
}

module hole(x, y, xMargin, yMargin, z) {
  translate([x + xMargin/2, y + yMargin/2, -0.1]) {
    cylinder(d=1.9, h = z+0.2, $fn=20);
  }
  
}
