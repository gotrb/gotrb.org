require 'helper'

class TestGot < Test::Unit::TestCase
  include Sinatra::Test

  context '/' do
    
    setup do
      assert Person.create(:name => 'First One Out', :email => 'first@got.rb')
      get '/'
    end
    
    should 'respond ok' do
      assert response.ok?
    end
    
    should 'have css' do
      assert_match "href='/main.css'", response.body
      assert_match "href='/screen.css'", response.body
    end
  
    should 'have a h1' do
      assert_match '<h1>Got.rb</h1>', response.body
    end
  
    should 'have a list of people' do
      names = ['First One Out']
      assert_match names.to_s, response.body
    end
  
  end
  
end