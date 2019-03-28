require 'sinatra'
require 'sprockets'
require 'uglifier'
require 'sass'
require 'coffee-script'
require 'execjs'

class Kroppsfabriken < Sinatra::Base

  set :environment, Sprockets::Environment.new

  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  environment.append_path 'assets/images'

  environment.js_compressor  = :uglify
  environment.css_compressor = :scss

  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "")
    settings.environment.call(env)
  end

  get '/' do
    erb :index
  end

  get '/dresscode' do 
    erb :dresscode
  end

  get '/information' do 
    erb :info
  end

  get '/kontakt' do 
    erb :contact
  end

  get '/fester' do  
    erb :fester 
  end
end