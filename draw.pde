

void draw() {
    
    // stepping...
  box2d.step();
  
  background(defColor);

// loops thru tweets so we get a random one among the query result each time
    currentTweet = currentTweet + 1;
    if (currentTweet >= tweets.size()) {
        currentTweet = 0;
        }
    Status status = tweets.get(currentTweet);
    
  
// tweet spawns every so often, increase constant to increase density.
  if (random(1) < 0.01) {
    Box p = new Box(defColor, status.getText(),width/2,30);  // position of spawn spot
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

  
  // Show current trending
  

text(trend[1].getName(), 20, 20, 300, 200);
text(trend[2].getName(), 20, 30, 300, 200);
text(trend[3].getName(), 20, 40, 300, 200);
text(trend[4].getName(), 20, 50, 300, 200);
text(trend[5].getName(), 20, 60, 300, 200);
text(trend[6].getName(), 20, 70, 300, 200);
text(trend[7].getName(), 20, 80, 300, 200);
text(trend[8].getName(), 20, 90, 300, 200);
text(trend[9].getName(), 20, 100, 300, 200);
text(trend[10].getName(), 20, 110, 300, 200);




  // Delete boxes that left screen, from box2d and list
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }


  /*
    fill(200);
    text(status.getText(), random(width), random(height), 300, 100);
    //text(trend[1].getName(), random(width-300), random(height-150), 300, 200);
    //text(trend[int(random(10))].getName(), random(width), random(height), 300, 200);

    delay(1000);
    */
    
}