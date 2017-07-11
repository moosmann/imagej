// ehh
print( "");
print( "PROCESSING LARVA IN WOOD" );
run("Close All");

outpath = "/home/moosmanj/Pictures/larva_in_wood/";

function liw( path, type ) {
	print( "Modality : " + type )
	print( "Input path" );
	print( path );
	filename  = path +  "reco_000370.tif";
	open( filename );
	
	
	
	// Crop
	makeRectangle(150, 177, 2048, 1848);
	run("Crop");
	
	// Scale
	run("Scale...", "x=0.5 y=0.5 width=1023 height=924 interpolation=None average create");
	
	// Contrast, 8bit
	resetMinAndMax();
	run("Enhance Contrast", "saturated=0.35");
	run("8-bit");
	
	// Save
	name = "larva_in_wood_" + type;
	filename = outpath + name;
	print( "Save as png: " );
	print( filename );
	saveAs("PNG", filename );
	

}

// absorption
path = "/asap3/petra3/gpfs/p05/2017/data/11002839/processed/ehh_2017_019_f/reco/float_rawBin2_recoBin2/";
liw( path, "abs" );

// phase
path = "/asap3/petra3/gpfs/p05/2017/data/11002839/processed/ehh_2017_019_f/reco_phase/tie_regPar2p50/float_binned/";
liw( path, "phase" );

// END
print( "FINISHED" );
