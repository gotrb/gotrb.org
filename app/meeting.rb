require 'time'
require 'yaml'

class Meeting
  
  def initialize(options={})
    @location = options[:location]
    @time = Time.parse(options[:time]) if options[:time]
  end

  def location
    @location
  end

  def time
    @time
  end

  def self.latest
    read(File.join(File.dirname(__FILE__), 'meeting.yml'))
  end

  def self.read (file)
    data = YAML.load_file file
    Meeting.new :location => data['meeting']['location'],
                :time => data['meeting']['time']
  end
  

end
