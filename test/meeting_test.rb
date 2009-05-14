require '../app/meeting'
require 'rubygems'
require 'test/unit'


class MeetingTest < Test::Unit::TestCase
  
  def test_object
    meeting = Meeting.new
    assert_equal 'Meeting', meeting.class.to_s
  end
  
  def test_location
    meeting = Meeting.new(:location => 'Lilla Bomen')
    assert_equal 'Lilla Bomen', meeting.location
  end

  def test_time
    meeting = Meeting.new(:time => '2009-04-03 15:34 UTC')
    assert_equal Time.utc(2009,04,03,15,34), meeting.time
  end

  def test_time
    meeting = Meeting.new(:time => '2009-04-03 15:34 UTC')
    assert_equal Time.utc(2009,04,03,15,34), meeting.time
  end
  
  def test_no_location
    meeting = Meeting.new()
    assert_equal nil, meeting.location
  end
  
  def test_fixture_read
    meeting = Meeting.read(File.dirname(__FILE__) + '/fixture/meeting.yml')
    assert_equal 'Gothenburg', meeting.location
    assert_equal Time.utc(2009,04,03,15,34), meeting.time
  end
end