

void draw() {
    
    // stepping...
  box2d.step();
  
   // rect(0, 0, width, height);

    currentTweet = currentTweet + 1;

    if (currentTweet >= tweets.size())
    {
        currentTweet = 0;
    }

    Status status = tweets.get(currentTweet);
    
  
    // Boxes fall from the top every so often
  if (random(1) < 0.01) {
    Box p = new Box(status.getText(),width/2,30);
    boxes.add(p);
  }
  
    // Display  boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }
  
    // Display  boxes
  for (Box b: boxes) {
    b.display();
  }

  // Delete boxes that left screen, from box2d and list
  // (note they have to be deleted from both the box2d world and our list
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }

  


//  background(102);

  /*
    fill(200);
    text(status.getText(), random(width), random(height), 300, 100);
    //text(trend[1].getName(), random(width-300), random(height-150), 300, 200);
    //text(trend[int(random(10))].getName(), random(width), random(height), 300, 200);

    

    delay(1000);
    */
    
}