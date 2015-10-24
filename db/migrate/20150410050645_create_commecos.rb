class CreateCommecos < ActiveRecord::Migration
  def change
    create_table :commecos do |t|
      t.text :comment

      t.timestamps null: false
    end
  end
end
