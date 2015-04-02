# encoding: UTF-8
require 'json'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'

configure :development do
  enable :cross_origin
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(
    :default,
    'mysql://root:times@321@localhost/restaurant_dev'
  )
end

configure :production do
  enable :cross_origin
  DataMapper.setup(
    :default,
    'mysql://root:times@321@localhost/restaurant_dev'
  )
end

require './models/customer'
require './routes/customer'

DataMapper.finalize
DataMapper.auto_upgrade!
