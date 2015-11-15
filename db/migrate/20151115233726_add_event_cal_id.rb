class AddEventCalId < ActiveRecord::Migration
  def change
    add_column :events,  :calendar_id, :string
  end
end
