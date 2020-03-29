int size=64;
Fluid fluid;
void setup() {
  size(512, 512);
  fluid=new Fluid(size);
}
void mouseDragged() {
  fluid.addDrop(constrain(mouseX,0,width-1)/(512/size),constrain(mouseY,0,height-1)/(512/size),500);
}
void draw() {
  fluid.update();
  fluid.render();
}
