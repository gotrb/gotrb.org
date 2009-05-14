require '../app/my_app'
require 'rubygems'
require 'test/unit'
require 'sinatra/test'
require 'mocha'

class GotrbAppTest < Test::Unit::TestCase
  include Sinatra::Test

  def setup
    mock_meeting = Meeting.new :location => 'Mock location', :time => Time.now.to_s
    Meeting.expects(:latest).returns(mock_meeting)
  end

  def test_home_page_success
    get '/'
    assert_equal 200, @response.status
  end
  
  def test_meeting_page_success
    get '/'
    assert_match 'Mock location', @response.body
  end

end