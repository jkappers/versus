class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :token
      t.string :user_id

      t.timestamps
    end
    add_index :groups, :token
    add_index :groups, :user_id
  end
end
