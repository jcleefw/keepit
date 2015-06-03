require 'active_record'
#require 'pry'
require 'sinatra'
#require 'sinatra/reloader'
require 'httparty'
require 'weather-api'

require_relative 'utils'

Tilt.register Tilt::ERBTemplate, 'html.erb'

def herb(template, options={}, locals={})
  render "html.erb", template, options, locals
end

before do
  @channels = (ChannelFeed).all
  @channels.each do |key|

    if !key.feeds.empty?
      #binding.pry
      last_feed_created = key.feeds.last.date_created

      if (!time_to_import? Time.now, last_feed_created, 12.hour) && !(key.feeds.empty?)

        key.imported = true
      end
    end
  end
end

get '/api' do
  erb :api
end

get '/api/channels' do
  content_type :json
  @channels.to_json
end

get '/api/channel/:id' do
  raw_feed = RawFeed.where(channel_feed_id: params[:id]).order(:date_created)
  raw_feed_json = raw_feed[0]
  need_import = true

  if raw_feed.count > 0

    need_import = time_to_import? Time.now, raw_feed[0].date_created, 12.hour
  end

  if need_import
    channel = ChannelFeed.find(params[:id]).channel_url
    @data = HTTParty.get(channel)

    #if check file is xml
    if @data.slice(0..10).include? 'xml'
      @data = Hash.from_xml(@data).to_json
    else
      @data = @data.to_json
    end
    if raw_feed.count < 1
      RawFeed.create(channel_feed_id: params[:id], data: @data)
      @data
    else
      raw_feed[0].date_created = Time.now
      raw_feed[0].data = @data
      raw_feed[0].save
      @data
    end
  else
    @data = raw_feed_json.data
  end

end

get '/api/weather' do
  woeid = get_woeid
  #binding.pry
  @weather = Weather.lookup(woeid, Weather::Units::CELSIUS).to_json
end

post '/api/:id/get_feed' do
  find_channel params[:id].to_i
end

get '/api/channel/:id/readable' do
  raw_feed = RawFeed.where(channel_feed_id: params[:id])

  if raw_feed.empty?
    redirect_to "/api/channel/#{params[:id]}"
  else
    @data = JSON.parse raw_feed[0].data
    @data = @data["rss"]["channel"]

    @items = @data["item"]
    @itemSize = @data["item"].count
    erb :readable
  end
end

get '/api/channel/:id/variable' do

  raw_feed = RawFeed.where(channel_feed_id: params[:id])
  row = FeedVariable.where(channel_feed_id: params[:id])

  if row.size > 0
    @selected = row[0].variable
    @image_url = row[0].image_url_var
    @article_link = row[0].article_link_var
    @description = row[0].description_var
  end

    @data = JSON.parse raw_feed[0].data
    @data = @data["rss"]["channel"]
    @items = @data["item"]
    @variable_keys = @data["item"][0].keys
    #binding.pry
  erb :variable
end

post '/api/channel/:id/variable' do
  #binding.pry
  row = FeedVariable.where(channel_feed_id: params[:id])

  if row.size > 0
    row[0].variable = params["variable"]
    row[0].image_url_var = params["image_url"]
    row[0].article_link_var = params["article_link"]
    row[0].description_var = params["description"]
    #binding.pry
    row[0].save
    row[0]
  else
    row = FeedVariable.create(channel_feed_id:params[:id], variable:params["variable"], image_url_var:params["image_url"], article_link_var:params["article_link"], description_var:params["description"])
  end
  return "done"

  redirect_to '/api/channel/:id/readable'
end


