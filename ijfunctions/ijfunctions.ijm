// FUNCTIONS
function drawLabelledArrow(x0,y0,x1,y1,label,movHor,movVer) {
eval('script','img = IJ.getImage();a= new Arrow('+x0+','+y0+','+x1+','+y1+');img.setRoi(a);');
run("Draw", "stack");
labelWidth = getStringWidth(label);
labelHeight = getValue("font.height");
makeText(label, x0+labelWidth/2*movHor, y0-labelHeight/2*movVer);
run("Draw", "stack");
}
function drawArrowStack(x0,y0,x1,y1) {
eval('script','img = IJ.getImage();a= new Arrow('+x0+','+y0+','+x1+','+y1+');img.setRoi(a);');
run("Draw", "stack");
}
function drawArrowSlice2(x0,y0,x1,y1) {
eval('script','img = IJ.getImage();a= new Arrow('+x0+','+y0+','+x1+','+y1+');img.setRoi(a);');
run("Draw", "slice");
}
function drawArrowSlice(x0,y0,x1,y1) {
	call("fiji.util.ArrowTool.select", "DELTA", x0,y0,x1,y1, "3.0", "10.0");
	run("Fill","slice");
}

function drawTextStack(string,x,y) {
	makeText(string,x,y);
	run("Draw","stack");
}
function drawTextSlice(string,x,y) {
	makeText(string,x,y);
	run("Draw","slice");
}
function OrientationCross(cenx,ceny,len,west,east,north,south) {
	labelHeight = getValue("font.height");
	// ARROW CROSS
	drawArrowStack(cenx,ceny,cenx-len,ceny);
	drawArrowStack(cenx,ceny,cenx+len,ceny);
	drawArrowStack(cenx,ceny,cenx,ceny-len);
	drawArrowStack(cenx,ceny,cenx,ceny+len);
	// NORTH
	drawTextStack(north, cenx-getStringWidth(north)/2,ceny+len);
	// SOUTH
	drawTextStack(south, cenx-getStringWidth(south)/2,ceny-len-labelHeight);
	// WEST
	drawTextStack(west, cenx-len-getStringWidth(west), ceny-labelHeight/2);
	// EAST
	drawTextStack(east, cenx+len, ceny-labelHeight/2);
}