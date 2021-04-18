final int SIZE=64;



Fluid f;



void setup(){
	size(512,512);
	f=new Fluid(SIZE);
}



void mouseDragged(){
	f.addDrop(constrain(mouseX,0,width-1)/(512/SIZE),constrain(mouseY,0,height-1)/(512/SIZE),500);
}



void draw(){
	f.update();
	f.render();
}
