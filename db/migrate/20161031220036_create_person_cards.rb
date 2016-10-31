class CreatePersonCards < ActiveRecord::Migration[5.0]
  def change
    create_table :person_cards do |t|

      t.string :name
      t.string :phase
      t.string :img_url
      t.string :staff_type

    end
  end
end
