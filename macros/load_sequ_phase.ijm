// Read load-cell tomograms  and save vol-cut sequences
print( "");
print( "PROCESSING LOAD SEQUENCE" );
run("Close All");

//
prefix = "/asap3/petra3/gpfs/p05/2017/data/11003950/processed/syn13_55L_Mg10Gd_12w_load_";
outpath = "/asap3/petra3/gpfs/p05/2017/data/11003950/processed/syn13_55L_Mg10Gd_12w_load/phase/";
// z ROI
z = 301;

// Loop over tomos
indexArray = newArray( 0,2,4,6,8,10,12,14,16,18);//,22,24);
for (nn=0; nn<indexArray.length; nn++) {
	// data set name
	num = indexArray[nn];
	path = prefix + IJ.pad(num,2) + "/reco_phase/tie_regPar2p50/float_rawBin1_recoBin2/";
	print( " Read data set no. " + num + " : " + path );
	path = path + "reco_000001.tif";
		
	// load
	//run("Image Sequence...", "open=" + path + " number=" + z1 + " starting=" + z0 + " sort");
	run("Image Sequence...", "open=" + path + " sort");
	
	// contrast & 8bit conversion
	setSlice( z );
	resetMinAndMax();
	run("Enhance Contrast", "saturated=0.35");
	run("8-bit");
}

// concatenate: 4D stack
print( "Concatenate" );
run("Concatenate...", "all_open title=load_sequ open");

// 4D stack dimensions
getDimensions(width, height, channelCount, sliceCount, frameCount);
print( " width : " + width );
print( " height : " + height);
print( " channels : " + channelCount );
print( " slices : " + sliceCount );
print( " frames : " + frameCount);

// vertical slicing x 4D
print( "Reslice: x" );
selectWindow("load_sequ");
run("Reslice [/]...", "output=1.000 start=Top flip avoid");
name = "load_sequ_x";
rename( name );
filename = outpath + name + "_4D.tif";
print( "Save 4D tif stack:" );
print( filename );
run("Save", "save=" + filename);
rename( name );

// save vertical slicing x
print( "Save: " + name );
selectWindow( name );
z = 751;
setSlice ( z );
makeRectangle(58, 0, 1432, 600);
run("Duplicate...", "duplicate slices=" + z );
print( " Save tif stack" );
run("Save", "save=" + outpath + name +".tif");
print( " Save gif stack" );
saveAs("Gif", outpath + name );
print( " Save avi" );
run("AVI... ", "compression=PNG frame=7 save=" + outpath + name +".avi");
print( " Save last image" );
run("Slice Keeper", "first=" + frameCount + " last=" + frameCount +" increment=1");
saveAs("PNG", outpath + name + "_last.png");

// vertical slicing y 4D
print( "Reslice: y" );
selectWindow("load_sequ");
run("Reslice [/]...", "output=1.000 start=Left flip avoid");
name = "load_sequ_y";
rename( name );
filename = outpath + name + "_4D.tif";
print( "Save 4D tif stack:" );
print( filename );
run("Save", "save=" + filename);
rename( name );

// save vertical sequence y
print( "Save: " + name );
selectWindow( name );
z = 940;
setSlice ( z );
makeRectangle(245, 0, 1228, 592);
run("Duplicate...", "duplicate slices=" + z );
print( " Save tif stack" );
run("Save", "save=" + outpath + name +".tif");
print( " Save gif stack" );
saveAs("Gif", outpath + name );
print( " Save avi" );
run("AVI... ", "compression=PNG frame=7 save=" + outpath + name +".avi");
print( " Save last image" );
run("Slice Keeper", "first=" + frameCount + " last=" + frameCount +" increment=1");
saveAs("PNG", outpath + name + "_last.png");


// END
print( "FINISHED" );

/*

// concatenate: 4D stack
print( "Concatenate" );
run("Concatenate...", "all_open title=load_sequ open");

// 4D stack dimensions
getDimensions(width, height, channelCount, sliceCount, frameCount);
print( " width : " + width );
print( " height : " + height);
print( " channels : " + channelCount );
print( " slices : " + sliceCount );
print( " frames : " + frameCount);

// vertical slicing x 4D
print( "Reslice: x" );
selectWindow("load_sequ");
run("Reslice [/]...", "output=1.000 start=Top flip avoid");
name = "load_sequ_phase_x";
rename( name );
run("Save", "save=" + outpath + name + ".tif");

// save vertical slicing x
print( "Save: " + name );
selectWindow( name );
z = 751;
setSlice ( z );
makeRectangle(58, 0, 1432, 600);
run("Duplicate...", "duplicate slices=" + z );
run("Save", "save=" + outpath + name +".tif");
saveAs("Gif", outpath + name );
run("AVI... ", "compression=PNG frame=7 save=" + outpath + name +".avi");

// vertical slicing y 4D
print( "Reslice: y" );
selectWindow("load_sequ");
run("Reslice [/]...", "output=1.000 start=Left flip avoid");
name = "load_sequ_phase_y";
rename( name );
filename = outpath + name + "_4D.tif";
print( "Save 4D tif stack:" );
print( filename );
run("Save", "save=" + filename);
rename( name );

// save vertical sequence y
print( "Save: " + name );
selectWindow( name );
z = 940;
setSlice ( z );
makeRectangle(245, 0, 1228, 592);
run("Duplicate...", "duplicate slices=" + z );
print( " Save tif stack" );
run("Save", "save=" + outpath + name +".tif");
print( " Save gif stack" );
saveAs("Gif", outpath + name );
print( " Save avi" );
run("AVI... ", "compression=PNG frame=7 save=" + outpath + name +".avi");
print( " Save last image" );
run("Slice Keeper", "first=" + frameCount + " last=" + frameCount +" increment=1");
saveAs("PNG", outpath + name + "_last.png");

// END
print( "FINISHED" );
*/