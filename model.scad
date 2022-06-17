
// function thing() =

//   difference() {
//     scale([1.1, 1.1,1.1])
//       import(file = "cuts.svg", center= true);
//       import(file = "cuts.svg", center= true);
//   };
$fn=50;

module buildPyramidalExtrude(height,maxOffset,nSlices){
    heightIncrement = height/nSlices;
    offsetIncrement = maxOffset/(nSlices-1);
    for(i=[1:nSlices])
        linear_extrude(height=i*heightIncrement)
              offset(r = maxOffset-(i-1)*offsetIncrement)
                children();
}

module foobar(r) {
    difference() {
        offset(r = r) {
            children();
        }
        children();
    }
}

import(file = "cuts.svg", center= true);

translate([0,0,3])
color("blue")
buildPyramidalExtrude(1, 2.5, 10)
foobar(1) import(file = "cuts.svg", center= true);

translate([0,0,2])
color("red")
linear_extrude(height=1)
foobar(1) import(file = "cuts.svg", center= true);


color("red")
translate([200, 0, 0])
square(50, center=true);

color("blue")
translate([300, 0, 0])
offset(r=10)
square(50, center=true);