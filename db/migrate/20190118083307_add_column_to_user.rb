class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :unique_id, :string
    add_column :users, :introduction, :text
  end
end
