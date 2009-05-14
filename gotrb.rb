require 'rubygems'
require 'sinatra'
require 'haml'
require "sass"

def data
  YAML.load(File.new('data.yml'))
end

get '/hi' do
  @title = data['title']
  @meetups = data['meetups']
  
  haml :index
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end