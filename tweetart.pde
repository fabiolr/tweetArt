import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;

Twitter twitter;
List<Status> tweets;
ResponseList<Trends> dailyTrends;
Trend[] trend;
int currentTweet;
int currentTrend;
int currentRefresh;
PFont f;



// Choose location for Trending topics and Search Query for displayed tweets here.
String searchString = "Miami";
int woeid = 2450022; // Miami


void setup() {
    size(1200,710);
    smooth();
    // Initialize box2d physics and create the world
    box2d = new Box2DProcessing(this);
    box2d.createWorld();
    //Custom gravity
    box2d.setGravity(0, -10);
    
    // Create ArrayLists  
    boxes = new ArrayList<Box>();
    boundaries = new ArrayList<Boundary>();

    // Add boundaries
    boundaries.add(new Boundary(width/4,height-5,width/2-50,10));
    boundaries.add(new Boundary(3*width/4,height-50,width/2-50,10));
    
    
    // Connect to Twitter, get the data 
    twitterConnect();
    getTrends();
    currentTweet = 0;
    currentTrend = 0;
    currentRefresh = 0;
    getNewTweets();

    thread("refreshTweets");
    thread("refreshTrends");


  // Set the font
  printArray(PFont.list());
  f = createFont("Nexa Light.otf", 12);
  textFont(f);


}



void refreshTweets() {
    while (true)
    {
        getNewTweets();
        println("Updated Tweets " + currentTweet);
        currentRefresh ++;
        delay(30000);
    }
}


void refreshTrends() {
    while (true)
    {
        getTrends();
        println("Updated Trends " + currentTrend);
        currentTrend ++;
        delay(300000);
    }
}



void getNewTweets() {
    try
    {
        searchString = trend[int(random(10))].getName();
        System.out.println(searchString);

        Query query = new Query(searchString);
        QueryResult result = twitter.search(query);
        tweets = result.getTweets();
    }
    catch (TwitterException te)
    {
        System.out.println("Failed to search tweets: " + te.getMessage());
        System.exit(-1);
    }
}

void getTrends() {
    try {
           //Trends dailyTrends = twitter.getPlaceTrends(23424977);
           Trends dailyTrends = twitter.getPlaceTrends(woeid);
           trend = dailyTrends.getTrends();
            for (int i = 0; i < 10; i++) {
             System.out.println((i+1) + " " + trend[i].getName());
            }
           
         }
    catch (TwitterException te)
    {
        System.out.println("Failed to search tweets: " + te.getMessage());
        System.exit(-1);
    }
}