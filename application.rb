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
  
end



