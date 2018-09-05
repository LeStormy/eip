class AddShortDescToLog < ActiveRecord::Migration[5.2]
  def change
    add_column :devlogs, :short_description, :string
  end
end
