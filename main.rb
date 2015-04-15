require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

require_relative 'model/utils'
require_relative 'model/config'
require_relative 'model/api'


helpers do
  def print_weather
    weather = get_weather_data
    "<span class='weather'>Current: #{weather['content'][:current]}</span><span class='weather'>Max: #{weather['content'][:max]}</span>"
    # @weather[:current]
    # @weather[:max]
  end
  def print_user
    user = User.find_by(username: 'johnsmith')
    user.firstname
  end
end


get '/' do
  erb :index
end

get '/explore' do
  @categories = Category.all
  @channels = ChannelFeed.all
  #binding.pry
  erb :explore
end





