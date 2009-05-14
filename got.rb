require 'rubygems'
require 'sinatra'

if $ENV
  set :environment, $ENV
end

require 'person'

configure :development do
  ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => 'db/development.sqlite3'
end

configure :test do
  ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => 'db/test.sqlite3'
end

get '/' do
  haml :index
end

get '/new_person' do
  haml :new_person
end

post '/people' do
  Person.create! params[:person]
  redirect '/'
end
