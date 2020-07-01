class RemoveUseridFromEvent < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :user_id, :integer
    remove_column :events, :user_id, :integer
    add_column :events, :creator_id, :integer
  end
end
