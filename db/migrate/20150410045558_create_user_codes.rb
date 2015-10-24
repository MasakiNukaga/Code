class CreateUserCodes < ActiveRecord::Migration
  def change
    create_table :user_codes do |t|
      t.text :source

      t.timestamps null: false
    end
  end
end
