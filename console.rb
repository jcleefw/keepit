require 'active_record'
#require 'pry'
require 'httparty'

ActiveRecord::Base.logger = Logger.new(STDERR) #show sql in the terminal
require_relative 'modal/config'
require_relative 'modal/class'
require_relative 'modal/utils'

channel = ChannelFeed.find(1)
raw_feed = RawFeed.where(channel_feed_id: 1)


binding.pry



