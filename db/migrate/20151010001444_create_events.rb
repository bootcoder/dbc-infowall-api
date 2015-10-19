class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :organizer
      t.string :location
      t.string :img_url
      t.string :event_url
      t.string :attending
      t.string :event_type

      t.text :description

      t.datetime :schedule
      t.timestamps
    end
  end
end
