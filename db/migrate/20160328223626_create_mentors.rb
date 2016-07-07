class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|

      t.string :name
      t.string :img_url
      t.string :phase

      t.timestamps
    end
  end
end
