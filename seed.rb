# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seeds for ChannelFeed


ChannelFeed.create([{ channel_name: 'Yanko Design', channel_url: 'http://feeds.feedburner.com/yankodesign', category_id: 4,  channel_desc: 'Modern Industrial Design News', popularity: 0, channel_image: '/images/yankodesign-logo.jpg'}]);
ChannelFeed.create([{ channel_name: 'ABC World News', channel_url: 'http://www.abc.net.au/news/feed/52278/rss.xml', category_id: 2,  channel_desc: 'Latest news as it happens from around the world', popularity: 10, channel_image: '/images/abcnewsdefault_90.jpg'}]);
ChannelFeed.create([{ channel_name: 'Angry Birds Nest', channel_url: 'http://feeds.feedburner.com/angrybirdsnest', category_id: 1,  channel_desc: 'Angry Birds Walkthrough Videos, Golden Eggs, and more', popularity: 0, channel_image: '/images/Angry_birds_listorylove_resize.png'}]);
ChannelFeed.create([{ channel_name: 'Digg Daily Top Stories', channel_url: 'http://digg.com/rss/top.rss', category_id: 2,  channel_desc: 'Digg - What the Internet is talking about right now', popularity: 3, channel_image: '/images/Digg_Logo.png'}]);
ChannelFeed.create([{ channel_name: 'Ikea Hackers', channel_url: 'http://feeds.feedburner.com/Ikeahacker', category_id: 5,  channel_desc: 'Clever ideas and hacks for your IKEA', popularity: 9, channel_image: '/images/ikean-hack-logo.png'}]);
ChannelFeed.create([{ channel_name: 'Smashing Magazines', channel_url: 'http://www.smashingmagazine.com/feed/', category_id: 6,  channel_desc: 'For Professional Web Designers and Developers', popularity: 15, channel_image: '/images/smashing_magazine_logo5.jpg'}]);
ChannelFeed.create([{ channel_name: 'Smashing Magazines', channel_url: 'http://www.smashingmagazine.com/feed/', category_id: 6,  channel_desc: 'For Professional Web Designers and Developers', popularity: 15, channel_image: '/images/smashing_magazine_logo5.jpg'}]);
ChannelFeed.create([{ channel_name: 'Yahoo Weather Forecast', channel_desc: 'Weather forecast provided by yahoo'}]);

# seed for User
User.create([{ username: 'johnsmith', firstname: 'John', suburb: 'Melbourne', country: 'Australia'}]);

#seed for Category
Category.create([{ name: 'Games'}]);
Category.create([{ name: 'News'}]);
Category.create([{ name: 'LifeStyle'}]);
Category.create([{ name: 'Design'}]);
Category.create([{ name: 'Hacker Tips'}]);
Category.create([{ name: 'Resources'}]);

FeedVariable.create([{channel_feed_id: 2, variable: ["title", "link", "description", "pubDate", "group"], image_url_var: nil, article_link_var: nil, description_var: nil}]);
FeedVariable.create([{channel_feed_id: 5, variable: ["title", "pubDate", "description", "encoded", "origLink"], image_url_var: nil, article_link_var: nil, description_var: nil}]);
FeedVariable.create([{channel_feed_id: 6,variable: ["title", "link", "pubDate", "description"],image_url_var: nil, article_link_var: nil, description_var: nil}]);
FeedVariable.create([{channel_feed_id: 4,variable: ["title", "description", "link", "pubDate"],image_url_var: nil,article_link_var: nil,description_var: nil}]);
FeedVariable.create([{channel_feed_id: 4,variable: ["title", "description", "link", "pubDate"],image_url_var: nil,article_link_var: nil,description_var: nil}]);
FeedVariable.create([{channel_feed_id: 1,
  variable: ["title", "description", "pubDate", "encoded", "origLink"],image_url_var: "description",article_link_var: "origLink",description_var: "description"}]);