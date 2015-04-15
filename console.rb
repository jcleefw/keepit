require 'active_record'
require 'pry'
require 'httparty'

ActiveRecord::Base.logger = Logger.new(STDERR) #show sql in the terminal
require_relative 'model/config'
require_relative 'model/class'
require_relative 'model/utils'

binding.pry




