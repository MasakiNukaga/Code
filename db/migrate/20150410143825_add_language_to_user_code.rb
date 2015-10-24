class AddLanguageToUserCode < ActiveRecord::Migration
  def change
    add_column :user_codes, :language, :string
  end
end
