class AddTypeToPersonCard < ActiveRecord::Migration[5.0]
  def change
    add_column :person_cards, :card_type, :string
  end
end
