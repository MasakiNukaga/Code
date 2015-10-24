class AddTitleToUserCode < ActiveRecord::Migration
  def change
    add_column :user_codes, :title, :string
  end
end
