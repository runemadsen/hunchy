require 'rubygems'
require 'bundler'
Bundler.require
require './models'

class Application < Sinatra::Base
  
  set :root, File.dirname(__FILE__)
  register Sinatra::AssetPack
  register Padrino::Helpers

  assets {
    serve '/javascripts', :from => 'assets/javascripts'
    serve '/stylesheets', :from => 'assets/stylesheets'
    js :front, ['/javascripts/vendor/**/*.js', '/js/app/**/*.js']
    css :shared, ['/stylesheets/reset.css', '/stylesheets/hunchy.css']
    js_compression  :jsmin
    css_compression :sass
  } 
    
  #   Front
  #---------------------------------------
  
  get '/' do
    erb :front
  end

  #   404
  #---------------------------------------

  not_found do
    erb :notfound
  end
  
end



