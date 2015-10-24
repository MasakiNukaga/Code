class AddUserIdToUserCode < ActiveRecord::Migration
  def change
    add_column :user_codes, :user_id, :reference
  end
end
