$fn=50;

module file() {
    scale(1.01)
translate([0,-200, 0])
import(file = "cuts.svg");
}

module buildPyramidalExtrude(height,maxOffset,nSlices){
    heightIncrement = height/nSlices;
    offsetIncrement = maxOffset/nSlices;
    for(i=[1:nSlices])
        linear_extrude(height=i*heightIncrement)
         //    offset(r = cos( (nSlices - i ) / nSlices * 180 ) *  (i-1)*(offsetIncrement ))
            offset(r = (i-1)*(offsetIncrement))
                children();
}

module foobar(r) {
    difference() {
        offset(r = r) 
            children();
    //    offset(r=1)
        children();
    }
}

module cylinders() {
    translate([4, 2.5])
    cylinder(r=$r, h=$ch);

    translate([$w - 3.6, 2.5])
    cylinder(r=$r, h=$ch);

    translate([3, $h - 4])
    cylinder(r=$r, h=$ch);

    translate([$w - 3, $h - 3.5])
    cylinder(r=$r, h=$ch);
}

module plate() {
    $w = 26;
    $h = 35;
    $r = 1.5;
    $ch = 4;
    linear_extrude(height=1)
    square([$w, $h]);

    color("grey") cylinders();

    color("orange")
    linear_extrude(height=3)
        foobar(3)
        square([26, 35]);
}

mirror([1,0,0]) {
    translate([97,0.5,0])
    rotate(a=[0, 0, -30])
    translate([0, -12, 0])
    plate();


    color("cyan")
    linear_extrude(height=2)
    offset(3)
    file();
}; 