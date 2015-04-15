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
  popularity INT DEFAULT 0
);

INSERT INTO channel_feeds (channel_name,channel_url, channel_desc, category_id) VALUES ('Yanko Design','http://feeds.feedburner.com/yankodesign', 'Modern Industrial Design News', 4);
INSERT INTO channel_feeds (channel_name,channel_url, channel_desc, category_id) VALUES ('ABC World News','http://www.abc.net.au/news/feed/52278/rss.xml', 'Latest news as it happens from around the world', 2);
INSERT INTO channel_feeds (channel_name,channel_url, channel_desc, category_id) VALUES ('Angry Birds Nest','http://feeds.feedburner.com/angrybirdsnest', 'Angry Birds Walkthrough Videos, Golden Eggs, and more',1);
INSERT INTO channel_feeds (channel_name,channel_url, channel_desc, category_id) VALUES ('Digg Daily Top Stories','http://digg.com/rss/top.rss', 'Digg - What the Internet is talking about right now', 2);
INSERT INTO channel_feeds (channel_name,channel_url, channel_desc, category_id) VALUES ('Ikea Hackers','http://feeds.feedburner.com/Ikeahacker', 'Clever ideas and hacks for your IKEA', 5);
INSERT INTO channel_feeds (channel_name,channel_url, channel_desc, category_id) VALUES ('Smashing Magazines','http://www.smashingmagazine.com/feed/', 'For Professional Web Designers and Developers', 6);
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

SELECT * FROM feeds WHERE channel_feed_id = 7 AND content[:woeid] = 1103816;
