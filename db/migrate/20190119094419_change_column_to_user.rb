class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :users, :introduction, :text, default: ""
    end

    def down
      change_column :users, :introduction, :text
    end
  end
end
