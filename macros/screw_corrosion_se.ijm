// Read load-cell tomograms  and save vol-cut sequences
print( "");
print( "PROCESSING SCREW COROSSION" );
run("Close All");

path = "/asap3/petra3/gpfs/p05/2016/commissioning/c20160913_000_synload/processed/mg10gd_38_1w/reco/";
outpath = "/asap3/petra3/gpfs/common/p05/jm/pictures/screw_corrosion/";

// abs
filename = path + "float_rawBin1_recoBin2/reco_000111.tif";
print( filename );
open( filename );

makeRectangle(331, 374, 716, 688);
run("Crop");

resetMinAndMax();
run("Enhance Contrast", "saturated=0.35");
run("8-bit");

saveAs("Tiff", outpath + "screw_corrosion_reco");
saveAs("PNG", outpath + "screw_corrosion_reco");


// seg
filename = path + "uint8_rawBin1_recoBin2_segmented/reco_000111.tif";
print( filename );
open( filename );

makeRectangle(331, 374, 716, 688);
run("Crop");

setMinAndMax(0, 2);

saveAs("Tiff", outpath + "screw_corrosion_reco_seg");
saveAs("PNG", outpath + "screw_corrosion_reco_seg");


// END
print( "FINISHED" );
