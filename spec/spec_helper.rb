require 'rubygems'
require 'bundler'
Bundler.require(:default)
Bundler.require(:test)
Dir['server/*.rb'].each {|f| load f.to_s}

require 'sinatra'
require "sinatra/base"
require 'rack/test'
# require 'sinatra_server.rb'
# require 'ruby_ttt'

def app
  SinatraServer.new
end

RSpec.configure do |config|
  # config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
  config.include Rack::Test::Methods
end