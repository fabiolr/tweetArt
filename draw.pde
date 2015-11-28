

void draw() {
    
  fill(0, 20);
    rect(0, 0, width, height);

    currentTweet = currentTweet + 1;

    if (currentTweet >= tweets.size())
    {
        currentTweet = 0;
    }

    Status status = tweets.get(currentTweet);

//  background(102);

  
    fill(200);
    text(status.getText(), random(width), random(height), 300, 100);
    //text(trend[1].getName(), random(width-300), random(height-150), 300, 200);
    //text(trend[int(random(10))].getName(), random(width), random(height), 300, 200);

    

    delay(1000);
}