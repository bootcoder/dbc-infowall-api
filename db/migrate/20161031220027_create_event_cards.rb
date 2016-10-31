class CreateEventCards < ActiveRecord::Migration[5.0]
  def change
    create_table :event_cards do |t|

      t.string :title
      t.string :description
      t.string :organizer
      t.string :location
      t.string :img_url
      t.string :card_type
      t.string :calendar_id

      t.datetime :schedule


    end
  end
end
