class AddPublishedToLog < ActiveRecord::Migration[5.2]
  def change
    add_column :devlogs, :public, :boolean, default: false
  end
end
