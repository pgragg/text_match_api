ENV['environment'] = 'test'

require 'rubygems'
require 'bundler'
Bundler.require(:default)
Bundler.require(:test)
Dir['server/*.rb'].each {|f| load f.to_s}

require 'sinatra'
require "sinatra/base"
require 'rack/test'

def app
  SinatraServer.new
end

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
  config.include Rack::Test::Methods
end