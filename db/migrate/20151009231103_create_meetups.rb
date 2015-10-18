class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :title
      t.string :organizer
      t.string :location
      t.string :img_url
      t.string :meetup_url
      t.string :attending
      t.string :event_type

      t.text :description

      t.datetime :schedule
      t.timestamps
    end
  end
end
