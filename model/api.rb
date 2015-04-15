require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'weather-api'

require_relative 'utils'


get '/api' do
  erb :api
end

get '/api/channels' do
  content_type :json
  @channels = (ChannelFeed).all.to_json
end

get '/api/channel/:id' do

  channel = ChannelFeed.find(params[:id]).channel_url
  @data = HTTParty.get(channel)

  #if check file is xml
  if @data.slice(0..10).include? 'xml'
    @data = Hash.from_xml(@data).to_json
  else
    @data = @data.to_json
  end
end

get '/api/weather' do
  woeid = get_woeid
  binding.pry
  @weather = Weather.lookup(woeid, Weather::Units::CELSIUS).to_json
end

post '/api/:id/get_feed' do
  #params[:id]
  find_channel params[:id].to_i
  #redirect to '/'
  "Task In Process..."
  redirect to '/api/import_success'
end

get '/api/import_success' do
  @message = "Get data succeeded!"
  erb :api
end



