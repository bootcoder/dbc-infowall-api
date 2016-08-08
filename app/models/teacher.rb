
class Teacher < ActiveRecord::Base

  after_initialize :add_image_url

  def add_image_url
    self.img_url = "#{self.name}.jpg"
  end

end
