class Event < ActiveRecord::Base

  validates_uniqueness_of :meetup_url

  def self.sanitize_description(str)
    str.slice(0..(str.index('.') + '.'.length))
  end

  def self.sanitize_location(str)
    str.gsub('San Francisco', '')
  end

end
