# Feeds Info

This markdown stores all details needs to know about various feeds available

To view each feed Raw JSON or XML
/api

## Weather Feeds
Ruby Gem - Weather API: [Documentation](https://rubygems.org/gems/weather-api/versions/1.1.1)

#### To find woied of each location.

  ```
  woeid = HTTParty.get ('https://query.yahooapis.com/v1/public/yql?q=select%20woeid%20from%20geo.places(1)%20where%20text%3D%22melbourne%2C%20australia%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys');

  woeid = (woeid['query']['results']['place']['woeid']).to_i

  response = Weather.lookup(woeid)
  ```

##### References
- https://developer.yahoo.com/weather/documentation.html

## Feeds

Yanko
id = 1

```
["title","link","description","category","pubDate","comments","guid","encoded","commentRss","creator","origLink"]
```

ABC World
id = 2
```
["title", "link", "description", "pubDate", "guid", "category", "group"]
```

Angry Bird Nest
id = 3
```
["title", "link", "comments", "pubDate", "creator", "category", "guid", "description", "encoded", "commentRss", "enclosure", "origLink"]
```

Diggs Top Stories
id = 4
```
["title", "description", "link", "guid", "pubDate"]
```

Ikea Hackers
id = 5
```
["title", "link", "comments", "pubDate", "creator", "category", "guid", "description", "encoded", "commentRss", "enclosure", "origLink"]
```

Smashing Magazine
id = 6
```
["title", "link", "comments", "pubDate", "creator", "category", "guid", "description", "encoded", "commentRss"]
```


