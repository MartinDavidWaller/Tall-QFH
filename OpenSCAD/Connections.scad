tubeQuality = 150;

centralPipeInnerDiameter = 28 + 0.0;
supportPipeDiameter = 8 + 0.5;

supportPipeHolderDiameter = 14;

selfTapperDiameter = 3;

module outerBody()
{
    union()
    {
               cylinder(r=(5), h=20, $fn = tubeQuality); 
        

        
    intersection()
    {
                // Central cylinder
    
        cylinder(r=(centralPipeInnerDiameter) / 2, h=20, $fn = tubeQuality); 
                // Four holes around the side
        
        for(i = [0 : 3])
            rotate([0,90,i * 90])
                translate([-10,0,0])
                    cylinder(r=supportPipeHolderDiameter / 2, h=45, $fn=tubeQuality);
    }
}
}

module main()
{
    difference()
    {
        outerBody();
        

        
        // Four holes around the side
        
        for(i = [0 : 3])
            rotate([0,90,i * 90])
                translate([-10,0,5])
                    cylinder(r=supportPipeDiameter / 2, h=14, $fn=tubeQuality);
       

        
      
        
                for(i = [0 : 3])
                rotate([0,00,i * 90])
            translate([-10,0,0])
                cylinder(r=selfTapperDiameter / 2, h=20, $fn=tubeQuality);
                
                for(i = [0 : 3])
                rotate([0,00,i * 90 + 45])
            translate([-10,0,0])
                cylinder(r=3, h=20, $fn=tubeQuality);
         
                         
           
            translate([0,0,-1])
                cylinder(r=1.5, h=25, $fn=tubeQuality);       
    }   
}

main();

 






