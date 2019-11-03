class Bubble {
  //PVector location;
  //PVector velocity;
  //PVector acceleration;
  float x;
  float y;
  float g;
  float radius;

  // float speedX;
  // float speedY;

  float r;
  color c;
  Bubble() {


    x = width/2-50;
    y = height/2-130;
    g = grow;


    // x = width/2;
    //    y = height/2;

    // speedX = 2.5;
    // speedY = 2.5;

    r = random(2, 20);

    //c = color(random(255), random(255), random(255));
  }

  void display() {
    //fill(c);
    noStroke();

    //fill(157,170,234, opacity);
    //ellipse(x, y, g++, g++);
    //bubbles.add(new Bubble(width/2+x, height/2+y, grow++, grow++));

    image(bubbleImg, x, y, g++, g++);
   // tint(255, opacity);
  }

  void move() {
    //velocity.add(acceleration);
    //location.add(velocity);
    //velocity.limit(50);
    //acceleration.mult(0);
    x = x+speedX;
    y = y+speedY;
  }


  void stay() {
    noStroke();

    //fill(157,170,234, opacity);

    //ellipse(x, y, g, g);
    image(bubbleImg, x+r, y+r, g, g);
    tint(255, opacity);
    

  }



  //void applyFo if (location.x - r < 0 || location.x + r > width) {
  //    velocity.x *= -1;
  //  }
  //  if (location.y - r < 0 || location.y + r > height) {
  //    velocity.y *= -1;
  //  }
  //}
  boolean finished() {
    // Balls fade out
 println(opacity);

    if (opacity <= 0) {

      leaveWaterMark();    
       return true;
    } else {
      return false;
    }
  }



  //boolean pass() {

  //  y = y + speedY;
  //  // If square reaches the bottom
  //  // Reverse speed
  //  if (y > height) {
  //    return true;
  //  } else {
  //    return false;
  //  }
  //  // Dampening
  //}
}


void leaveWaterMark() {
  image(waterCImg, x, y, width, height);
  tint(50);
}
