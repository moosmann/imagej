// Read load-cell tomograms  and save vol-cut sequences
run("Close All");
print( "")
print( "Processing load cell sequence" )

prefix = "/asap3/petra3/gpfs/p05/2017/data/11003950/processed/syn13_55L_Mg10Gd_12w_load_"

// z ROI
z0 = 140;
z1 = 600;
z = 301;

// Loop over tomos
for (nn=0; nn<4;) {
	// data set name
	path = prefix + IJ.pad(nn,2) + "/reco/float_binned/";
	print( " Read data set no " + nn + " : " + path );
	path = path + "reco_000001.tif";
		
	// load
	run("Image Sequence...", "open=" + path + " number=" + z1 + " starting=" + z0 + " sort");
	nn = nn + 2;
	
	// contrast
	setSlice( z );
	resetMinAndMax();
	run("Enhance Contrast", "saturated=0.35");

	// 
	run("8-bit");
}

// concatenate: 4D stack
run("Concatenate...", "all_open title=load_sequ open");

// 4D stack dimensions
getDimensions(width, height, channelCount, sliceCount, frameCount);
print( " width : " + width );
print( " height : " + height);
print( " channels : " + channelCount );
print( " slices : " + sliceCount );
print( " frames : " + frameCount);

// END
print( "FINISHED" )
