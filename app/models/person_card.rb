class PersonCard < ApplicationRecord

  def self.parse_staff_cards(card_hash)
    results = []
    card_hash.each do |person, role|
      count = 0
      results << PersonCard.new(name: person,
                                phase: role,
                                img_url: 'http://static.bootic.com/_pictures/1623251/batman-i-am-batman-flip-up_1.jpg',
                                staff_type: 'staff',
                                id: count += 1)
    end
    results
  end
end
