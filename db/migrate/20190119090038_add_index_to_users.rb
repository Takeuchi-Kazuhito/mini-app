class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :unique_id, unique: true
  end
end
