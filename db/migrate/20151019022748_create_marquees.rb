class CreateMarquees < ActiveRecord::Migration
  def change
    create_table :marquees do |t|

      t.string :text
      t.string :text_color, default: "black"
      t.string :bg_color, default: "white"
      t.string :display_status, default: 'none'

      t.integer :scroll_amount, default: 0

      t.timestamps null: false
    end
  end
end
