require 'rubygems'
require 'bundler'
Bundler.require(:default)

Dir['initializers/*.rb'].each {|f| load f.to_s}

class SinatraServer < Sinatra::Base
	set :root, File.dirname(__FILE__)

  enable :sessions
  
	get '/api/v1/:action' do
		ApiController.send(params[:action], params)
	end
end