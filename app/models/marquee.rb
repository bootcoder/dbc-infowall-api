class Marquee < ActiveRecord::Base

  validates_uniqueness_of :text

  validates_presence_of :text
  validates_presence_of :bg_color
  validates_presence_of :text_color
  validates_presence_of :scroll_amount
  validates_presence_of :display_status

end
