
// function thing() =

//   difference() {
//     scale([1.1, 1.1,1.1])
//       import(file = "cuts.svg", center= true);
//       import(file = "cuts.svg", center= true);
//   };
$fn=50;

module buildPyramidalExtrude(height,maxOffset,nSlices){
    heightIncrement = height/nSlices;
    offsetIncrement = maxOffset/(nSlices + 5);
    for(i=[1:nSlices])
        linear_extrude(height=i*heightIncrement)
              offset(r = cos( (nSlices - i ) / nSlices * 180 ) *  (i-1)*(offsetIncrement ))
            //   offset(r = (i-1)*(offsetIncrement))
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

linear_extrude(height=1)
import(file = "cuts.svg", center= true);

translate([0,0,2])
color("blue")
buildPyramidalExtrude(2, -2, 15)
foobar(3) import(file = "cuts.svg", center= true);

color("red")
linear_extrude(height=2)
foobar(3) import(file = "cuts.svg", center= true);


color("red")
translate([200, 0, 0])
square(50, center=true);

color("blue")
translate([300, 0, 0])
offset(r=10)
square(50, center=true);
