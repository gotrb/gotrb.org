require 'activerecord'

namespace :db do
  desc 'Load the database schema for the test database'
  task :load_test_schema do
    dbconfig = YAML.load(File.read('database.yml'))['test']
    ActiveRecord::Base.establish_connection dbconfig
    load('db/schema.rb')
  end

  desc 'Load the database schema for the development database'
  task :load_development_schema do
    dbconfig = YAML.load(File.read('database.yml'))['development']
    ActiveRecord::Base.establish_connection dbconfig
    load('db/schema.rb')
  end
end