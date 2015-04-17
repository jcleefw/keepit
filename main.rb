require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

require_relative 'model/utils'
require_relative 'model/config'
require_relative 'model/api'

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
  erb :index
end

get '/explore' do
  @categories = Category.all
  @channels ||= ChannelFeed.where.not(channel_url: nil).order(:id)
  #binding.pry
  erb :explore
end

get '/explore/:order' do
  #"order by category"
  content_type :json
  if params[:order] == 'all'
    @channels = ChannelFeed.where.not(channel_url: nil).order(:id)
    channels.to_json
  else
    categories = Category.all
    channels = ChannelFeed.all.order(:category_id)

    # data = [channels.to_json, categories.to_json]

    ChannelFeed.order(:category_id).to_json(:include => :category)
    # data.to_json
  end
  #binding.pry
  #erb :import_success
end

get '/explore/:id/list' do
  @feeds = Feed.where(channel_feed_id: params[:id])
  @channel = ChannelFeed.find(params[:id])
  #binding.pry
  erb :channel
end



