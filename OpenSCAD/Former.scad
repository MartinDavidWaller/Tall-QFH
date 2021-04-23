tubeQuality = 150;

centralPipeOuterDiameter = 36 + 0.0;
supportPipeDiameter = 12 + 0.5;

supportPipeHolderDiameter = 20;

selfTapperDiameter = 3;

module outerBody()
{
    union()
    {               
        // Central cylinder
    
        cylinder(r=(centralPipeOuterDiameter + 10) / 2, h=20, $fn = tubeQuality); 
        
        // Four holes around the side
        
        for(i = [0 : 3])
            rotate([0,90,i * 90])
                translate([-10,0,0])
                    cylinder(r=supportPipeHolderDiameter / 2, h=45, $fn=tubeQuality);
        
        // Four wire supports around the side
        
        //for(i = [0 : 3])
            //rotate([0,90,i * 90])
                //translate([-30,0,0])
                    //cylinder(r=5, h=35, $fn=tubeQuality);        
    }
}

module main()
{
    difference()
    {
        outerBody();
        
        // Central hole down the centre
        
        translate([0,0,-1])
            cylinder(r=centralPipeOuterDiameter / 2, h=37, $fn=tubeQuality);
        
        // Four holes around the side
        
        for(i = [0 : 3])
            rotate([0,90,i * 90])
                translate([-10,0,20])
                    cylinder(r=supportPipeDiameter / 2, h=46, $fn=tubeQuality);
       
        // Four wire holes around the side
        
        //for(i = [0 : 3])
            //rotate([0,90,i * 90])
                //translate([-31,0,0])
                    //cylinder(r=1.5, h=46, $fn=tubeQuality);
        
        // One self tapping hole for the main pipe
        
        rotate([0,90,45])
            translate([-10,0,0])
                cylinder(r=selfTapperDiameter / 2, h=45, $fn=tubeQuality);
        
        // Four self tapping holes
        
       // for(i = [0 : 3])
          //rotate([90,0,i * 90])
                //translate([32,15,-20])
                    //cylinder(r=selfTapperDiameter / 2, h=45, $fn=tubeQuality);
        
        // Finger marks at top
        
        for(i = [0 : 10: 350])
            if ((i != 80) && (i != 90) && (i != 100) &&
                (i != 170) && (i != 180) && (i != 190) &&
                (i != 260) && (i != 270) && (i != 280) &&
                (i != 350) && (i != 0) && (i != 10))
            rotate([0,0,i])
                translate([0,23,18])
                    cylinder(r=1, h=10, $fn=tubeQuality);
    }   
}

main();

 
//lockingScrew();






