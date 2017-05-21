require 'rubygems'
require 'bundler'
Bundler.require(:default)

Dir['initializers/*.rb'].each {|f| load f.to_s}

get '/api/v1/:action' do
	ApiController.send(params[:action], params)
end