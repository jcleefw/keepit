require 'httparty'
#require 'pry'
require 'weather-api'

require_relative 'class'

def find_channel id

  channel = ChannelFeed.find(id)
  @data = JSON.parse channel.raw_feed.data

  #@data = HTTParty.get(channel.channel_url)

  # if @data.slice(0..10).include? 'xml'
  #   @data = JSON.parse(Hash.from_xml(@data).to_json)
  # end

  items = @data['rss']['channel']['item']
  items_size = items.count

  if items.count > 10
    items_size = 9
  else
    items_size = items.count
  end

  # for loop to specify only to grab 10 of the latest feeds in the channel
  for i in 0..items_size
    #binding.pry
    plus1 = (Time.parse items[i]['pubDate']) + 5.day

    if plus1 > Time.now
      data_variable items[i], id
    else
      return false
    end
  end
end

def data_variable item, id

  feed_variable = FeedVariable.find_by(channel_feed_id: id).variable
  content ={}
  feed_variable.each do |variable|
    content[variable.to_sym] = item[variable]
  end

  insert_data id,content
end


def insert_data channel_id, content
  feed = Feed.create
  feed.channel_feed_id = channel_id
  feed.content = content
  feed.save
  ChannelFeed.find(channel_id).imported = true

  return feed
end

def get_woeid
  #binding.pry
  woeid = HTTParty.get ("https://query.yahooapis.com/v1/public/yql?q=select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{@user.suburb.downcase}%2C%20#{@user.country.downcase}%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys");

  return woeid = (woeid['query']['results']['place']['woeid']).to_i
end

def get_weather_data
  woeid = get_woeid
  rows = Feed.where(channel_feed_id:7)

  if rows.count > 0
    feed_time = Time.now - rows.first.date_created
    returned_woeid = rows.first.content[:woeid]
  end
  #binding.pry
  if rows.empty? || (feed_time>1800 && woeid == returned_woeid)

    weather = JSON.parse (Weather.lookup(woeid, Weather::Units::CELSIUS).to_json)

    current = weather["condition"]["temp"]
    max = weather['forecasts'][0]['high']
    min = weather['forecasts'][0]['low']
    summary = weather['forecasts'][0]['text']
    forecast = weather['forecasts']
    location = weather["location"]
    content = { location: location, current: current, max: max, min: min, woeid: woeid, summary: summary, forecast: forecast }
    #binding.pry
    if !rows.empty?
      rows.first.delete
    end
    @feed = insert_data 7, content
  else
    @feed = rows.first
  end
end

def time_to_import? current_time, previous_time, duration

  if (previous_time + duration) >= current_time
    false
  else
    true
  end
end



