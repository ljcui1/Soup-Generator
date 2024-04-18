import java.util.ArrayList;
ArrayList<String> shapes = new ArrayList<>();

float bowlX = 750;
float bowlY = 540;
float bowlY_low = 600;

boolean rand = true;

//shape
boolean shape_rand;
boolean rect_sel;
boolean oval_sel;
boolean tri_sel;

//visuals
boolean amt_rand;
int amt;

boolean color_rand;
float red;
float green;
float blue;

Bowl bowl = new Bowl(500, 350);
Soup soup = new Soup(420, 220);

boolean restart = false;

CheckBox[] checkboxes;

float s_min = 0;
float s_max = 255;

Slider[] sliders;


void setup(){
  size(1500, 1080);
  background(240, 236, 225);
  
  //shape checkboxes
  checkboxes = new CheckBox[4];
  checkboxes[0] = new CheckBox(550, 50, rect_sel, "Rectangular Ingredient: ");
  checkboxes[1] = new CheckBox(550, 120, oval_sel, "Circular Ingredient: ");
  checkboxes[2] = new CheckBox(550, 190, tri_sel, "Triangular Ingredient: ");
  checkboxes[3] = new CheckBox(400, 300, rand, "Random Soup: ");
  
  //color sliders
  sliders = new Slider[3];
  sliders[0] = new Slider(width - 530, 50, 255, 0, 0, red, "R ");
  sliders[1] = new Slider(width - 530, 120, 0, 255, 0, green, "G ");
  sliders[2] = new Slider(width - 530, 190, 0, 0, 255, blue, "B ");
  
  for(CheckBox checkbox : checkboxes){
    checkbox.display();
  }
  
  for(Slider slider : sliders){
    slider.display();
  }
  
  
}

void draw(){
  if(rand == true){
    amt_rand = true;
    color_rand = true;
    shape_rand = true;
  }else{
    amt_rand = false;
    color_rand = false;
    shape_rand = false;
  }
  
  for(CheckBox checkbox : checkboxes){
      checkbox.display();
    }
    
    for(Slider slider : sliders){
      slider.display();
    }
    
  if(!restart){
    background(240, 236, 225);
    
    translate(0, 100);
    noStroke();
    bowl.display();
    soup.broth();
    //soup.ingredients(amt_rand, amt);
    for (int i = 0; i < int(random(5, 12)); i++){
      soup.ing_gen(shape_rand, rect_sel, oval_sel, tri_sel, color_rand, red, green, blue);
    }
    strokeWeight(10);
    stroke(0);
    text("Press Space to regenerate" , width/2 - 275, height - 200);
    textSize(35);
    text("Press S to save Soup" , width/2 - 150, height - 125);
    for(int i = 0; i < shapes.size(); i++){
      shapes.remove(i);
    }
    restart = true;
  }
}

void mousePressed(){
  for(CheckBox checkbox : checkboxes){
    checkbox.clicked();
  }
  
  for(Slider slider : sliders){
    slider.moved();
  }
  
}

void keyPressed(){
  if(key == ' '){
    restart = !restart;
    
  }
  
  if(key == 's' || key == 'S'){
    share();
  }
}

void share(){
  String filename = "GeneratedSoup_" + year() + nf(month(), 2) + nf(day(), 2) + "_" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ".png";
  save(filename);
  println("Soup saved as: " + filename);
}

class Bowl {
  float x = bowlX;
  float y = bowlY;
  float y2 = bowlY_low;
  float w = 500;
  float h = 350;
  int r = int(random(0, 150));
  int g = int(random(0, 150));
  int b = int(random(0, 150));
  
  Bowl(float tmpW, float tmpH){
    w = tmpW;
    h = tmpH;
  }
  
  void display(){
    r = int(random(0, 150));
    g = int(random(0, 150));
    b = int(random(0, 150));
    println("display bowl");
    fill(r - 30,g - 30,b - 30);
    ellipse(x, y2, w, h);
    fill(r,g,b);
    ellipse(x - 10, y2 - 10, w - 10, h - 10);
    fill(r - 30,g - 30,b - 30);
    rect(x - 250, y - 95, w, h - 210);
    fill(r,g,b);
    rect(x - 255, y - 95, w - 10, h - 210);
    fill(r - 30,g - 30,b - 30);
    ellipse(x - 3, y - 100, w + 5, h - 30);
    fill(r,g,b);
    ellipse(x - 10, y - 95, w - 10, h - 40);
  }
  
}

class Soup {
  float x = bowlX;
  float y = bowlY;
  float w = 450;
  float h = 280;
  int r = int(random(50, 255));
  int g = int(random(10, 200));
  int b = int(random(0, 100));
  
  int ing_amt;
  
  Soup(float tmpW, float tmpH){
    w = tmpW;
    h = tmpH;
  }
  
  void broth(){
    r = int(random(0, 150));
    g = int(random(0, 150));
    b = int(random(0, 150));
    fill(r - 30, g - 30, b - 30);
    ellipse(x - 3, y - 100, w + 30, h + 50);
    fill(r, g, b);
    ellipse(x - 13, y - 90, w + 20, h + 40);
  }
  
  void ingredients(boolean amt_rand, int amt){
    if(amt_rand == true){
      amt = int(random(5, 11));
    }
    
    for(int i = 0; i < amt; i++){
      ing_gen(shape_rand, rect_sel, oval_sel, tri_sel, color_rand, red, green, blue);
    }
  }
  
  void ing_gen(boolean shape_rand, boolean rect_sel, boolean oval_sel, boolean tri_sel, boolean color_rand, float red, float green, float blue){
    println(color_rand);
    if(color_rand == true){
      red = random(50, 200);
      green = random(50, 200);
      blue = random(0, 100);
      fill(red, green, blue);
    }else{
      red = random(red - 25, red + 25);
      green = random(green - 25, green + 25);
      blue = random(blue - 25, blue + 25);
      fill(red, green, blue);
    }
    
    println(red + ", " + green + ", " + blue);
    
    //println("rect " + rect_sel);
    if(shape_rand == true){
      rect_sel = true;
      oval_sel = true;
      tri_sel = true;
      shapes.add("rect");
      shapes.add("oval");
      shapes.add("tri");
    }else{
      if(rect_sel == true){
        shapes.add("rect");
      }
      if(oval_sel == true){
        shapes.add("oval");
      }
      if(tri_sel == true){
        shapes.add("tri");
      }
      println("rect " + rect_sel);
      println("circ " + oval_sel);
      println("tri " + tri_sel);
      
      for(int i = 0; i < shapes.size(); i++){
        println(shapes.get(i));
      }
      
    }
    //println("rect " + rect_sel);
    
    boolean test = true;
    while(test){
      float baseX = random(x - 200, x + 160);
      float baseY = random(y - 160, y - 40);
      float sizeW = random(20, 50);
      float sizeH = random(20, 50);
      
      if(insideSoup(baseX, baseY, x - 13, y - 90, w - 20, h - 20)){
        int sel = int(random(0, shapes.size()));
        if(shapes.get(sel) == "rect"){
          rect(baseX, baseY, sizeW, sizeH);
          fill(red + 30, green + 30, blue + 30);
          rect(baseX, baseY, sizeW - 15, sizeH - 15);
        }else if(shapes.get(sel) == "oval"){
          ellipse(baseX, baseY, sizeW, sizeH);
          fill(red + 30, green + 30, blue + 30);
          ellipse(baseX - 5, baseY - 5, sizeW - 15, sizeH - 15); 
        }else if(shapes.get(sel) == "tri"){
          float x1 = baseX + (random(-20, 20));
          float y1 = baseY + (random(-20, 20));
          float x2 = baseX + (random(-20, 20));
          float y2 = baseY + (random(-20, 20));
          float x3 = baseX + (random(-20, 20));
          float y3 = baseY + (random(-20, 20));
          triangle(x1, y1, x2, y2, x3, y3);
          fill(red + 30, green + 30, blue + 30);
          triangle(x1 - 5, y1 - 5, x2 - 5, y2 - 5, x3 - 5, y3 - 5);
        }
        
        test = false;
      }
    }
    
    
  }
}

boolean insideSoup(float x, float y, float centerX, float centerY, float w, float h){
  float dx = x - centerX;
  float dy = y - centerY;
  return (dx*dx)/(w*w) + (dy*dy)/(h*h) <= 1;
}

class CheckBox{
  float x, y;
  float w = 50;
  float h = 50;
  boolean checked;
  String label;
  
  CheckBox(float x, float y, boolean select, String label){
    this.x = x;
    this.y = y;
    this.checked = select;
    this.label = label;
  }
  
  void display(){
    strokeWeight(5);
    stroke(0);
    fill(240, 236, 225);
    rect(x, y,  w, h);
    
    fill(0);
    textSize(50);
    if(checked == rand){
      if(label == "Random Soup: ") {
        text(label, x - w - 300, y + h/2 + 10);
      }else{
        text(label, x - w - 470, y + h/2 + 10);
      }
    }else{
      if(label == "Random Soup: ") {
        text(label, x - w - 300, y + h/2 + 10);
      }else{
        text(label, x - w - 470, y + h/2 + 10);
      }
    }
    
    if(checked){
      strokeWeight(2);
      line(x, y, x + w, y + h);
      line(x + w, y, x, y + h);
    }
  }
  
  void clicked(){
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
      checked = !checked;
      if(label == "Random Soup: "){
        rand = checked;
        color_rand = checked;
        amt_rand = checked;
        shape_rand = checked;
      }else if(label == "Rectangular Ingredient: "){
        rect_sel = checked;
      }else if(label == "Circular Ingredient: "){
        oval_sel = checked;
      }else if(label == "Triangular Ingredient: "){
        tri_sel = checked;
      }
      println(checked);
    }
  }

}

class Slider{
  float x, y;
  float w = 500;
  float h = 50;
  float r, g, b;
  float col;
  String label;
  
  Slider(float x, float y, float red, float green, float blue, float colour, String label){
    this.x = x;
    this.y = y;
    r = red;
    g = green;
    b = blue;
    col = colour;
    this.label = label;
  }
  
  void display(){
    strokeWeight(5);
    fill(r, g, b);
    rect(x, y, w, h);
    fill(0);
    rect(map(col, s_min, s_max, x, x + w - 10), y, 10, h);
    
    fill(0);
    textSize(50);
    text(label, x - 55, y + h/2 + 15);
  }
  
  void moved(){
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
      col = map(constrain(mouseX, x, x + w), x, x + w, s_min, s_max);
      if(label == "R "){
        red = col;
      }else if(label == "G "){
        green = col;
      }else if(label == "B "){
        blue = col;
      }
      println("red " + red);
      println("green " + green);
      println("blue " + blue);
    }
  }

}
