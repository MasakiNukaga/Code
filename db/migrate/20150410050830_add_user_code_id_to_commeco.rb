class AddUserCodeIdToCommeco < ActiveRecord::Migration
  def change
    add_column :commecos, :user_code_id, :reference
  end
end
