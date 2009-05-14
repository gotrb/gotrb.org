require 'helper'

class TestAddPerson < Test::Unit::TestCase
  include Sinatra::Test
  
  context 'requesting the form' do
    setup do
      get '/new_person'
    end
    
    should 'respond ok' do
      assert response.ok?
    end
    
    should 'display a form' do
      assert_match /<form[^>]*>/, response.body
    end
    
    should "have fields for name and email" do
      assert_match(/<input[^>]*name='person\[name\]'/, response.body)
      assert_match(/<input[^>]*name='person\[email\]'/, response.body)
    end
  end
  
  context 'submitting data for new person' do
    setup do
      Person.delete_all
      post '/people', :person => {:name => 'Got Rb', :email => 'got@rb.net'}
    end
    
    should 'create a Person' do
      assert Person.find_by_name_and_email('Got Rb', 'got@rb.net')
    end
    
    should 'redirect to the index page' do
      assert response.redirect?
      assert_equal '/', response.location
    end
  end
  
  context 'submitting bad data for new person' do
    setup do
      Person.delete_all
      post '/people', :person => {:name => 'Got Rb', :email => ''}
    end
    
    should 'not create a Person' do
      assert_equal 0, Person.count
    end
    
    should 'not redirect to the index page' do
      assert ! response.redirect?
    end
  end
  
end