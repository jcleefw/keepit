# Keep It App
KeepIt is a feed subscription platform that displays daily topics that users are interested. The software collects content from social media and other websites, presents it in magazine format, and allows users to "flip" through their social-networking feeds and feeds from websites that have partnered with the company.

-------------------------------------------------------------------

## Phase 1
1. Design Database & Table Structure & Relationships
2. Enter minimum data into database to test for Phase 1 building.
  + 1 user
  + 2 channel feeds (News, Yanko Design)
  + 1 Dashboard Feeds (Weather, Joke of the day)
3. Study JSON/XML from feeds to pick up item that are needed
4. Use HTTParty to load JSON into database
5. Setup Basic Divs for app in HTML5, CSS3
6. Create Basic Explore Page


## Phase 2
1. Explore page to list category available in database
2. Create API view, and import data.

## Phase 3
1. Complete main task Explore page.
  + Hide category that does not have any channel
  + List Channel that belongs to category
  + Style Explore page. (Optional: background)


## Extras
1. Create Slideshow
2. Create App Logo with Illustrator
3. Choose a selection of default background for articles with no images.
4. Create User Dashboard

-------------------------------------------------------------------
### User Case

A new user register and login to application with login details.

A new user with no subscribe channel is forwarded into explore page. User hover over each channel and read the description of each channel slide to show.

- Explore Page options.
  + All
  + Category
  + Popularity

User can view the channel before subscribing to the channel. As user click into the channel, 5 - 10 feeds will be shown. If user likes the channel user can subscribe to channel

- View Particular Channel
  + Subscription button
  + Summary / Excerpt / Description
  + No of subscribe
  + Featured (Calculate by the popularity of the likes the feed has)
  + Today (5 articles)

User Account Dashboard stores user information. Name, location

- User Dashboard
  + Weather Forecast (HTTP request every 1 hour for update)
  + Welcoming Message + Name output
  + Quote of the Day / Joke of the day / Horoscope
  + List of channels subscribe
  + Clickable feeds to read more details
  + Add to slide Feature in each Channel

User select which channel they want to view in slideshow.

- User Slideshow
  + Slide show autoplay
  + Play Controller

## Route ERB
  - dashboard
  - explore
  - slide
  - subscribe_channel
  - user_settings

## Class
User
FeedChannel
Feed
Category
UserSubscription
UserArchive

## CRUD
C - Create User, Channel Subscription, Archive feeds, Create Category
R - View channels feed,
U - User location woeid,
D - Remove Archive

## Web Technologies
Front End
  - HTML5
  - CSS3
  - Javascript Library: jQuery
  - CSS Pre-processor: SASS
  - CSS Framework : bootstrap / concise/ cardinal

Backend - Ruby
Routing Library - Sinatra
Debugging - Web browser, Pry,



