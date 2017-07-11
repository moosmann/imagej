// impant animation
print( "");
print( "PROCESSING LARVA IN WOOD" );
run("Close All");

outpath = "/asap3/petra3/gpfs/p05/2017/data/11003950/processed/syn13_55L_Mg10Gd_12w_load/animation/gifs/";

// BONE
name = "bone";
path = "/asap3/petra3/gpfs/p05/2017/data/11003950/processed/syn13_55L_Mg10Gd_12w_load/animation/"+name+"/"
filename = path + "volren_rot_"+name+".0000.tif";
run("Image Sequence...", "open=" + filename + " file=tif sort use");
run("Scale...", "x=0.5 y=0.5 z=1.0 interpolation=Bilinear average process create");
run("8-bit Color", "number=256");
//saveAs("Gif", outpath + name );
saveAs("Gif", outpath + name + "_binned" );

// CORROSION
name = "corrosion_layer";
path = "/asap3/petra3/gpfs/p05/2017/data/11003950/processed/syn13_55L_Mg10Gd_12w_load/animation/"+name+"/";
filename = path + "volren_rot_"+name+".0000.tif";
run("Image Sequence...", "open=" + filename + " file=tif sort use");
makeRectangle(326, 178, 628, 716);
run("Crop");
run("Scale...", "x=0.5 y=0.5 z=1.0 interpolation=Bilinear average process create");
run("8-bit Color", "number=256");
//saveAs("Gif", outpath + name );
saveAs("Gif", outpath + name + "_binned" );

// SCREW CORE
name = "screw_core";
path = "/asap3/petra3/gpfs/p05/2017/data/11003950/processed/syn13_55L_Mg10Gd_12w_load/animation/"+name+"/";
filename = path + "volren_rot_"+name+".0000.tif";
run("Image Sequence...", "open=" + filename + " file=tif sort use");
makeRectangle(326, 178, 628, 716);
run("Crop");
run("Scale...", "x=0.5 y=0.5 z=1.0 interpolation=Bilinear average process create");
run("8-bit Color", "number=256");
//saveAs("Gif", outpath + name );
saveAs("Gif", outpath + name + "_binned" );

// END
print( "FINISHED" );