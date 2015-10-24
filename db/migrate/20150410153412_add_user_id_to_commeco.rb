class AddUserIdToCommeco < ActiveRecord::Migration
  def change
    add_column :commecos, :user_id, :reference
  end
end
