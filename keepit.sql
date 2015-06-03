CREATE DATABASE keepit;

\c keepit

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY ,
  username VARCHAR(20) NOT NULL,
  password VARCHAR(45),
  firstname VARCHAR(50),
  lastname VARCHAR (50),
  suburb VARCHAR(45),
  country VARCHAR(45),
  woeid INT
);
INSERT INTO users (username, firstname, suburb, country) VALUES ('johnsmith', 'John', 'Melbourne', 'Australia');


CREATE TABLE channel_feeds (
  id SERIAL4 PRIMARY KEY,
  channel_name VARCHAR(100) NULL,
  channel_url VARCHAR(250) NULL,
  category_id VARCHAR(45) NULL,
  channel_desc TEXT,
  channel_image VARCHAR(250) NULL,
  popularity INT DEFAULT 0
  imported BOOLEAN DEFAULT 0
);

ALTER TABLE channel_feeds
ADD imported BOOLEAN DEFAULT 0;

INSERT INTO channel_feeds (channel_name, channel_url, category_id, channel_desc, popularity, channel_image) VALUES ('Yanko Design','http://feeds.feedburner.com/yankodesign', 4, 'Modern Industrial Design News', 0, '/images/yankodesign-logo.jpg');
INSERT INTO channel_feeds (channel_name, channel_url, category_id, channel_desc, popularity, channel_image) VALUES ('ABC World News','http://www.abc.net.au/news/feed/52278/rss.xml', 2, 'Latest news as it happens from around the world',10, '/images/abcnewsdefault_90.jpg');

INSERT INTO channel_feeds (channel_name, channel_url, category_id, channel_desc, popularity, channel_image) VALUES ('Angry Birds Nest','http://feeds.feedburner.com/angrybirdsnest', 1, 'Angry Birds Walkthrough Videos, Golden Eggs, and more', 0, '/images/Angry_birds_listorylove_resize.png');
INSERT INTO channel_feeds (channel_name, channel_url, category_id, channel_desc, popularity, channel_image) VALUES ('Digg Daily Top Stories','http://digg.com/rss/top.rss', 2, 'Digg - What the Internet is talking about right now', 3, '/images/Digg_Logo.png');
INSERT INTO channel_feeds (channel_name, channel_url, category_id, channel_desc, popularity, channel_image) VALUES ('Ikea Hackers','http://feeds.feedburner.com/Ikeahacker', 5, 'Clever ideas and hacks for your IKEA', 9, '/images/ikean-hack-logo.png');
INSERT INTO channel_feeds (channel_name, channel_url, category_id, channel_desc, popularity, channel_image) VALUES ('Smashing Magazines','http://www.smashingmagazine.com/feed/', 6, 'For Professional Web Designers and Developers', 15, '/images/smashing_magazine_logo5.jpg');
INSERT INTO channel_feeds (channel_name, channel_desc) VALUES ('Yahoo Weather Forecast', 'Weather forecast provided by yahoo');

CREATE TABLE feeds (
  id SERIAL4 PRIMARY KEY ,
  channel_feed_id SERIAL4,
  date_created timestamptz DEFAULT NOW(),
  content text,
  popularity INT DEFAULT 0
);

CREATE TABLE user_subscriptions (
  id SERIAL4 PRIMARY KEY,
  user_id SERIAL4,
  channel_feed_id SERIAL4
);

INSERT INTO user_subscriptions (user_id,channel_feed_id) VALUES (1,1);

CREATE TABLE categories (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(45) NULL
);

INSERT INTO categories (name) VALUES ('Games');
INSERT INTO categories (name) VALUES ('News');
INSERT INTO categories (name) VALUES ('LifeStyle');
INSERT INTO categories (name) VALUES ('Design');
INSERT INTO categories (name) VALUES ('Hacker Tips');
INSERT INTO categories (name) VALUES ('Resources');

UPDATE FROM channel_feeds

TRUNCATE TABLE feeds RESTART IDENTITY
TRUNCATE TABLE raw_feeds RESTART IDENTITY

SELECT * FROM feeds WHERE channel_feed_id = 7 AND content[:woeid] = 1103816;

CREATE TABLE raw_feeds (
  id SERIAL4 PRIMARY KEY,
  channel_feed_id SERIAL4,
  date_created timestamptz DEFAULT NOW(),
  data text
);

CREATE TABLE feed_variables (
  id SERIAL4 PRIMARY KEY,
  channel_feed_id SERIAL4,
  variable VARCHAR(250)
);

ALTER TABLE feed_variables
  ADD COLUMN image_url_var VARCHAR(250),
  ADD COLUMN article_link_var VARCHAR(250),
  ADD COLUMN description_var VARCHAR(250);