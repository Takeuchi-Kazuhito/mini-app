class ChangeColumnToTweet < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :image, :text, default: ""
      change_column :text, :text, default: ""
    end

    def down
      change_column :image, :text
      change_column :text, :text
    end
  end
end
