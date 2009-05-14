require 'rubygems'
require 'sinatra'
require File.join(File.dirname(__FILE__), 'meeting')

get '/' do
  @meeting = Meeting.latest
  erb :index
end
