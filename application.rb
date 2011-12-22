require 'rubygems'
require "digest/sha1"
require 'bundler'
Bundler.require
require './models'

class Application < Sinatra::Base
  
  register Sinatra::SinatraAuthentication
  set :sinatra_authentication_view_path, Pathname(__FILE__).dirname.expand_path + "views/"
  use Rack::Session::Cookie, :secret => 'runeskjoldborgmadsen'
  use Rack::Flash
  register Padrino::Helpers
    
  #   Front
  #---------------------------------------
  
  get '/' do
    login_required
    erb :home
  end
  
  get '/hunches/new' do
    login_required
    erb 'hunches/new'.to_sym
  end
  
  post '/hunches' do
    login_required
    hunch = Hunch.create(:hunch => params[:hunch], :dm_user_id => current_user.id)
    redirect "/hunches/#{hunch.id}/freewriting"
  end
  
  get '/hunches/:id/freewriting' do
    @hunch = Hunch.get(params[:id])
    erb 'hunches/freewriting'.to_sym
  end
  
end



