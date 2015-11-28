import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;


Twitter twitter;
List<Status> tweets;
ResponseList<Trends> dailyTrends;
Trend[] trend;
int currentTweet;
int currentTrend;

// Choose location for Trending topics and Search Query for displayed tweets here.
String searchString = "Miami";
int woeid = 2450022; // Miami


void setup() {
    size(1200,710);

  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("gIpvudUKCIsur15gtT2KARC49");   
  cb.setOAuthConsumerSecret("QbJH31dBFAfT3otkVZ3DyPDYKg3zEDjtjRAbZacbHUnwRnot3D");   
  cb.setOAuthAccessToken("14476591-H1CVAdwSkJIHb77JYrjwKbtKpB65fYvL9fSWDM5pM");   
  cb.setOAuthAccessTokenSecret("hbRsaFBWptRdum47K8f0JbfSh21tAhX33ZpHzyNRSOxaa");

    TwitterFactory tf = new TwitterFactory(cb.build());
    twitter = tf.getInstance();
    doTrends();
    currentTweet = 0;
    currentTrend = 0;
    getNewTweets();

    thread("refreshTweets");
    thread("refreshTrends");

}


void refreshTweets() {
    while (true)
    {
        getNewTweets();
        println("Updated Tweets");
        delay(30000);
    }
}


void refreshTrends() {
    while (true)
    {
        doTrends();
        println("Updated Trends");
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

void doTrends() {
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