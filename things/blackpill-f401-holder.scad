mcu_width=21.4;
mcu_depth=53.6;
tray_height=25;
pcb_height=1.6;
wall_thickness=2;
solder_cutout=4.3;
usb_conn_width=10;
usb_conn_height=4;
notch_offset=2.35;
notch_width=1.1;
notch_depth=0.95;
hold_tab_offset=5.05;
hold_tab_width=wall_thickness;
hold_tab_depth=wall_thickness;
union(){
difference(){
union(){
cube([mcu_width+wall_thickness,mcu_depth+2*wall_thickness,wall_thickness]);
cube([mcu_width+wall_thickness,wall_thickness,tray_height]);
translate([0,mcu_depth+wall_thickness,0])cube([mcu_width+wall_thickness,wall_thickness,tray_height]);
translate([-wall_thickness,0,0])cube([wall_thickness,mcu_depth+2*wall_thickness,tray_height]);
translate([mcu_width,0,0])cube([wall_thickness,mcu_depth+2*wall_thickness,tray_height]);
}
translate([0,wall_thickness,0])cube([solder_cutout,mcu_depth,wall_thickness]);
translate([mcu_width-solder_cutout,wall_thickness,0])cube([solder_cutout,mcu_depth,wall_thickness]);
translate([-wall_thickness,hold_tab_offset+hold_tab_depth,tray_height])rotate([-40,0,0])cube([mcu_width+2*wall_thickness,mcu_depth+2*wall_thickness-30,20]);
translate([-wall_thickness,hold_tab_offset+hold_tab_depth+cos(40)*(mcu_depth+2*wall_thickness-30),tray_height-sin(40)*(mcu_depth+2*wall_thickness-30)])cube([mcu_width+2*wall_thickness,mcu_depth+2*wall_thickness,20]);
translate([mcu_width/2-usb_conn_width/2,0,wall_thickness+pcb_height-0.2])cube([usb_conn_width,wall_thickness,usb_conn_height]);
translate([mcu_width/2,0,17])rotate([-90,0,0])cylinder(wall_thickness,d=12,$fn=100);
}
translate([mcu_width/2-12/2,0,17-6])cube([12,wall_thickness,0.5]);
translate([mcu_width/2-12/2,0,17+5.5])cube([12,wall_thickness,0.5]);
translate([-wall_thickness-notch_width,notch_offset,0])cube([notch_width,notch_depth,tray_height]);
translate([-wall_thickness-hold_tab_width,hold_tab_offset,0])cube([hold_tab_width,hold_tab_depth,tray_height]);
translate([wall_thickness+mcu_width,notch_offset,0])cube([notch_width,notch_depth,tray_height]);
translate([wall_thickness+mcu_width,hold_tab_offset,0])cube([hold_tab_width,hold_tab_depth,tray_height]);
}

