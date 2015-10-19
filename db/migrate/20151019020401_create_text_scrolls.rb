class CreateTextScrolls < ActiveRecord::Migration
  def change
    create_table :text_scrolls do |t|
      t.string, :text
      t.string, :text_color
      t.string, :bg_color
      t.integer :scroll_amount

      t.timestamps null: false
    end
  end
end
