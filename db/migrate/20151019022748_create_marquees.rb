class CreateMarquees < ActiveRecord::Migration
  def change
    create_table :marquees do |t|
      t.string, :text
      t.string, :text_color
      t.string, :bg_color
      t.integer, :scroll_amount
      t.string :display_status

      t.timestamps null: false
    end
  end
end
