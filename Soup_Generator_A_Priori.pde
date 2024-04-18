float bowlX = 750;
float bowlY = 540;
float bowlY_low = 600;


void setup(){
  size(1500, 1080);
  background(240, 236, 225);
  
  noStroke();
  //bowl
  fill(154, 163, 166);
  ellipse(bowlX, bowlY_low, 500, 350);
  fill(184, 192, 194);
  ellipse(bowlX-10, bowlY_low-10, 490, 340);
  fill(154, 163, 166);
  rect(bowlX-250, bowlY - 95, 500, 140);
  fill(184, 192, 194);
  rect(bowlX - 255, bowlY - 95, 490, 140);
  fill(154, 163, 166);
  ellipse(bowlX - 3, bowlY - 100, 505, 320);
  fill(184, 192, 194);
  ellipse(bowlX-10, bowlY - 95, 490, 310);
  
  //soup
  fill(176, 142, 63);
  ellipse(bowlX, bowlY - 100, 450, 280);
  fill(209, 170, 79);
  ellipse(bowlX - 10, bowlY - 90, 440, 270);
  
  //ingredients
  for (int i = 0; i < int(random(5, 10)); i++){
    fill(random(50, 200), random(50, 255), random(0, 100));
    int shape = int(random(0, 3));
    if (shape == 0){
      ellipse(random(550, 920), random(420, 560), random(20, 50), random(20, 50));
    }else if (shape == 1){
      rect(random(550, 920), random(420, 560), random(20, 50), random(20, 50));
    }else if (shape == 2){
      triangle(random(550, 920), random(420, 560), random(550, 920), random(420, 560), random(550, 920), random(420, 560));
    }
  }
  
  
}

void draw(){

}
