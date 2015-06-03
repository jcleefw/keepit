require 'active_record'
# require 'pry'
require 'sinatra'
#require 'sinatra/reloader'
require 'httparty'

require_relative 'modal/utils'
require_relative 'modal/config'
require_relative 'modal/api'

local_db_settings = {
    :adapter => 'postgresql',
    :database => 'keepit'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || local_db_settings)

before do
  @user = User.find_by(username: 'johnsmith')
end

helpers do
  def print_weather
    weather = get_weather_data
    "<span class='weather'>NOW: <em>#{weather['content'][:current]}</em><b>°C</b></span><span class='weather'>MAX: <em>#{weather['content'][:max]}</em><b>°C</b></span><span class='weather summary'>#{weather['content'][:summary]}</span>"
    # @weather[:current]
    # @weather[:max]
  end
  def print_user
    @user.firstname
  end
end



get '/' do
  @feeds = Feed.where(channel_feed_id: 1).order(date_created: :desc).take(1)
  @channel = ChannelFeed.find(1)
  erb :index
end

get '/explore' do

  @channels = ChannelFeed.where.not(channel_url: nil).order(:id)
  #binding.pry
  @channels.to_json
  erb :explore
end

get '/explore/:order' do
  #"order by category"
  content_type :json
  if params[:order] == 'all'
    channels = ChannelFeed.where.not(channel_url: nil).order(:id)
    channels.to_json
  elsif params[:order] == 'category'
    channels = ChannelFeed.where.not(channel_url: nil).order(:category_id).to_json(:include => :category)
  elsif params[:order] == 'popularity'
    channels = ChannelFeed.where.not(channel_url:nil).order(popularity: :desc)
    channels.to_json
  end
  #binding.pry
  #erb :import_success
end

get '/explore/:id/list' do
  @feeds = Feed.where(channel_feed_id: params[:id]).order(date_created: :desc).take(10)
  @channel = ChannelFeed.find(params[:id])
  #binding.pry
  content = []

  @feeds.each do |feed|
    case params[:id]
    when "1"
      content << feed.content[:encoded]
    when "2"
      desc = feed.content[:description].strip

      if !feed.content[:group].nil?
        img = "<img src='#{feed.content[:group]["content"][1]["url"]}'  alt=''>"
      end
      content << desc + img
    when "3"
      binding.pry
    when "4"
      #binding.pry
      desc = "<p>#{feed.content[:description].strip}</p>"
      content << desc
    when "5"
      desc = feed.content[:description].strip
      img = feed.content[:encoded].strip
      content << desc + img
    when "6"
      desc = feed.content[:description].strip
      content << desc
    else
      "not found"
    end
  end
  #binding.pry
  @content = content

  erb :channel
end

get '/slide' do

end




