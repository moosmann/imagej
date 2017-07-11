// Load sequence figure for SPIE Proceedings
print( "");
print( "SPIE LOAD SEQUENCE" );
run("Close All");

outpath = "/asap3/petra3/gpfs/p05/2017/data/11003950/processed/syn13_55L_Mg10Gd_12w_load/spie/";

// open 4D tiff sequence
path="/asap3/petra3/gpfs/p05/2017/data/11003950/processed/syn13_55L_Mg10Gd_12w_load/absorption/load_sequ_x_4D.tif";
open( path );

// 4D stack dimensions
getDimensions(width, height, channelCount, sliceCount, frameCount);
print( " width : " + width );
print( " height : " + height);
print( " channels : " + channelCount );
print( " slices : " + sliceCount );
print( " frames : " + frameCount);

// z slice
z = 811;
setSlice( z );

// Scale
pix_size = 2.42698 * 2 * 1;
run("Set Scale...", "distance=1 known="+pix_size+" unit=micron global");

run("Line Width...", "line=6");
setForegroundColor(255, 255, 255);

scal_col = "Black";



// roi zoom bone ////////////////////////////////////////////////
name = "roi_bone";
print( "Montage : " + name );
selectWindow("load_sequ_x_4D.tif");
makeRectangle(1040, 210, 148, 140);
run("Duplicate...", "duplicate slices="+z+" frames=7-10");
rename( name );

selectWindow( name );
run("Make Montage...", "columns=4 rows=1 scale=1 border=6");
run("Scale Bar...", "width=200 height=4 font=16 color="+scal_col+" background=None location=[Lower Left] bold overlay");
name = "montage_" + name;
rename( name );

run("Save", "save="+outpath+name+".tif");
saveAs("Jpeg", outpath+name);

// roi zoom interface /////////////////////////////////////////////////////
name = "roi_interface";
print( "Montage : " + name );
selectWindow("load_sequ_x_4D.tif");
makeRectangle(839, 447, 148, 140);
run("Duplicate...", "duplicate slices="+z+" frames=7-10");
rename( name );

selectWindow( name );
run("Make Montage...", "columns=4 rows=1 scale=1 border=6");
run("Scale Bar...", "width=200 height=4 font=16 color="+scal_col+" background=None location=[Lower Left] bold overlay");
name = "montage_" + name;
rename( name );

run("Save", "save="+outpath+name+".tif");
saveAs("Jpeg", outpath+name);

// Draw selections
z = 811;
slices = 1528;
selectWindow("load_sequ_x_4D.tif");
for (nn=0; nn<10; nn++) {
	setSlice( z + slices*nn );
	

	makeRectangle(1040, 210, 148, 140);
	run("Draw", "slice");

	makeRectangle(839, 447, 148, 140);
	run("Draw", "slice");
	
}

// Full ///////////////////////////////////////////////////////////////////////
// 4d_y: s = 723;
// 4d_y: makeRectangle(275, 0, 912, 600);
name = "load_first_last";
print( "Montage : " + name );
selectWindow("load_sequ_x_4D.tif");
makeRectangle(155, 0, 1096, 592);
setSlice( z );
run("Duplicate...", "title=load_sequ_y_4D_roi duplicate slices=" + z);

// Scale bar
run("Scale Bar...", "width=200 height=8 font=32 color="+scal_col+" background=None location=[Lower Left] bold label  overlay");
run("Draw", "stack");

// First/last images, full roi
run("Make Montage...", "columns=2 rows=1 scale=1 increment=9 border=8 font=20");
rename( name );
run("Save", "save="+outpath + name +".tif");
saveAs("Jpeg", outpath + name);

//makeRectangle(857, 246, 284, 258);


// END
print( "FINISHED" );

//run("Close All");