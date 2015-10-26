class RemoveAuthFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :access_token
    remove_column :users, :refresh_token
    remove_column :users, :expires_at
  end
end
