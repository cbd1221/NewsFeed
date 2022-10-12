# NewsFeed
A simple newsfeed pulling articles and jobs from hacker-news API

This only pulls the /beststories from new.ycombinator.com, but there are
plenty of other options that can be incorporated. The jobs are only from their recent postings. 

Each item can be favorited by double-tapping on the heart icon, after which it will be added
to the 'favorites' tab. 
- I need to add a way of saving favorited items once the app is shutdown, probably through the user defaults, but 
we will see how it goes over the next couple days

- I spent the past week hunting down the root cause of a security warning getting flagged on the @main annotation for the App struct. 
  after an embarrassing amount of searching and attempts to improve the app's multithreading, it seems it may be a bug in Xcode 14 itself
  - if anyone knows otherwise, and can either confirm this or fix this, please let me know

