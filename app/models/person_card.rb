class PersonCard < ApplicationRecord

  def self.set_img_url(name)
    case name.downcase
    when 'alyssa'
      'https://avatars.githubusercontent.com/u/439941?v=3'
    when 'hunter'
      'https://dbc-backoffice-production.s3.amazonaws.com/profile_images/2561.jpeg'
    when 'max'
      'https://avatars.githubusercontent.com/u/16928707?v=3'
    when 'shambhavi'
      'https://avatars.githubusercontent.com/u/5216008?v=3'
    when 'sham'
      'https://avatars.githubusercontent.com/u/5216008?v=3'
    when 'sarah'
      'https://avatars.githubusercontent.com/u/424254?v=3'
    when 'sherif'
      'https://avatars.githubusercontent.com/u/24913?v=3'
    when 'rebekah'
      'https://i.imgur.com/CzRXJnA.jpg'
    when 'ken'
      'https://avatars.githubusercontent.com/u/2986627?v=3'
    when 'stanley'
      'https://avatars.githubusercontent.com/u/25013113?v=3'
    when 'james'
      'https://avatars.githubusercontent.com/u/10890778?v=3'
    when 'michael'
      'https://avatars.githubusercontent.com/u/10182814?v=3'
    when 'masha'
      'https://avatars.githubusercontent.com/u/709758?v=3'
    when 'jen'
      'https://avatars.githubusercontent.com/u/1222908?v=3'
    else
      'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRKLgvLHynu1i8hT1bwmG-hYjqRepb2aIPsvsqHjbDk7Q5pxfhQ'
    end
  end

  def self.parse_staff_cards(card_hash)
    results = []
    count = 0
    card_hash.each do |person, role|
      results << PersonCard.new(name: person,
                                phase: role,
                                img_url: PersonCard.set_img_url(person),
                                staff_type: 'Staff',
                                card_type: 'person',
                                id: count += 1)
    end
    results
  end
end
